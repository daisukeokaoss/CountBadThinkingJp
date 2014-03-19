//
//  OneTapRecordPersistentManager.m
//  StopBadThought
//
//  Created by 岡 大輔 on 2014/02/09.
//  Copyright (c) 2014年 ナノソフトウェア. All rights reserved.
//

#import "OneTapRecordPersistentManager.h"


//ユーザーインポート


@implementation OneTapRecordPersistentManager

-(void)saveRecordArray
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    
    [ud setInteger:self.TapRecordArray.count forKey:@"TapHistoryCount"];
    
    
    NSData *saveData = [NSKeyedArchiver archivedDataWithRootObject:self.TapRecordArray];
    [ud setObject:saveData forKey:@"TapHistory"];
    
    //[ud setObject:self.TapRecordArray forKey:@"TapHistory"];
    
    [ud synchronize];
}

-(void)OpenRecordArray
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    
    //int count = [ud integerForKey:@"TapHistoryCount"];
    
    NSData *OpenData = [ud dataForKey:@"TapHistory"];
    self.TapRecordArray = [NSKeyedUnarchiver unarchiveObjectWithData: OpenData];
    
    //self.TapRecordArray = [ud objectForKey:@"TapHistory"];
    
    if(self.TapRecordArray == nil){
        self.TapRecordArray = [[NSMutableArray alloc] init];
    }
}

-(int)CountTapRecordNumber
//記録されているタップの数を返す
{
    return[self.TapRecordArray count];
}

//最後からX番目の日付を返すメソッド
-(NSString *)DateOfSpecifiedIndex:(NSInteger)index
{
    //[[self.TapRecordArray objectAtIndex:index]
     NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
     
     [outputFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
     
     return [outputFormatter stringFromDate:[[self.TapRecordArray objectAtIndex:index] date]];
}



//ある一定以上前のデータを消去するメソッド
-(void)DeleteDataBeforeSpecifiedPeriod
{
    int oneday = 60*60*24;
    int oneMonth = oneday*30;
    int oneYear = 365*oneday;
    
    int PersistentPeriod=0;
    if(self.period == PersistentPeriodInfinite){
        //永続的にデータを保持する
        return;
    }else if(self.period == PersistentPeriod_3_Years){
        //３年間分データを保持する
        PersistentPeriod = oneYear * 3;
    }else if(self.period == PersistentPeriod_1_Years){
        //１年間分データを保持する
        PersistentPeriod = oneYear;
    }else if(self.period == PersistentPeriod_Half_Years){
        //半年分データを保持する
        PersistentPeriod = oneYear/2;
    }else if(self.period == PersistentPeriod_3_Month){
        //３ヶ月間データを保持する
        PersistentPeriod = oneMonth *3;
    }else if(self.period == PersistentPeriod_1_Month){
        //１ヶ月間データを保持する
        PersistentPeriod = oneMonth * 1;
    }
    for(OneTapRecord *obj in self.TapRecordArray){
        NSDate *SpecifiedDate = [NSDate dateWithTimeIntervalSinceNow:PersistentPeriod];
        if([[obj date] earlierDate:SpecifiedDate]){
            [self.TapRecordArray removeObject:obj];
        }
    }
}



@end
