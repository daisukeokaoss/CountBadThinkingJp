//
//  OneTapRecord.h
//  StopBadThought
//
//  Created by 岡 大輔 on 2014/02/09.
//  Copyright (c) 2014年 ナノソフトウェア. All rights reserved.
//

#import <Foundation/Foundation.h>

//以下、ユーザーインクルード
#import <CoreLocation/CoreLocation.h>

@interface OneTapRecord : NSObject<NSCoding>

@property (nonatomic) CLLocationDegrees longitude;
@property (nonatomic) CLLocationDegrees latitude;
@property (nonatomic,strong) NSDate *date;
@property (nonatomic,strong) NSMutableString *description;

@property (nonatomic) BOOL deleteFlag;

@end
