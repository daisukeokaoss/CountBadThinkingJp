//
//  OneTapRecordPersistentManager.h
//  StopBadThought
//
//  Created by 岡 大輔 on 2014/02/09.
//  Copyright (c) 2014年 ナノソフトウェア. All rights reserved.
//

#import <Foundation/Foundation.h>


//ユーザーインクルード
#import "OneTapRecord.h"


typedef enum{
    PersistentPeriodInfinite,
    PersistentPeriod_3_Years,
    PersistentPeriod_1_Years,
    PersistentPeriod_Half_Years,
    PersistentPeriod_3_Month,
    PersistentPeriod_1_Month
    
}TPersistentPeriod;



@interface OneTapRecordPersistentManager : NSObject

@property (nonatomic,strong) NSMutableArray *TapRecordArray;

@property (nonatomic) TPersistentPeriod period;

-(void)OpenRecordArray;
-(void)saveRecordArray;

-(int)CountTapRecordNumber;

//最後からX番目の日付を返すメソッド
-(NSString *)DateOfSpecifiedIndex:(NSInteger)index;

//ある一定期間以上前のデータを消去するメソッド
-(void)DeleteDataBeforeSpecifiedPeriod;



@end
