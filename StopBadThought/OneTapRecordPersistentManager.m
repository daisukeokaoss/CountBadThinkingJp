//
//  OneTapRecordPersistentManager.m
//  StopBadThought
//
//  Created by 岡 大輔 on 2014/02/09.
//  Copyright (c) 2014年 ナノソフトウェア. All rights reserved.
//

#import "OneTapRecordPersistentManager.h"

@implementation OneTapRecordPersistentManager

-(void)saveRecordArray
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    
    [ud setObject:self.TapRecordArray forKey:@"TapHistory"];
    
    [ud synchronize];
}

-(void)OpenRecordArray
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    self.TapRecordArray = [ud objectForKey:@"TapHistory"];
}



@end
