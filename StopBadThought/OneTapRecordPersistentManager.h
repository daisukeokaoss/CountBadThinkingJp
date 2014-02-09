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

-(void)OpenRecordArray;
-(void)saveRecordArray;



@end
