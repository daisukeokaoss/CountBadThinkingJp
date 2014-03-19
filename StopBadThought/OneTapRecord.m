//
//  OneTapRecord.m
//  StopBadThought
//
//  Created by 岡 大輔 on 2014/02/09.
//  Copyright (c) 2014年 ナノソフトウェア. All rights reserved.
//

#import "OneTapRecord.h"

@implementation OneTapRecord

- (void)encodeWithCoder:(NSCoder*)coder {
    [coder encodeDouble:self.longitude forKey:@"longitude"];
    [coder encodeDouble:self.latitude forKey:@"latitude"];
    [coder encodeObject:self.date forKey:@"date"];
    [coder encodeObject:self.description forKey:@"description"];
    [coder encodeBool:self.deleteFlag forKey:@"deletefrag"];
    
}

- (id)initWithCoder:(NSCoder*)coder {
    if ( (self = [super init]) ) {
        self.longitude = [coder decodeDoubleForKey:@"longitude"];
        self.latitude  = [coder decodeDoubleForKey:@"latitude"];
        self.date      = [coder decodeObjectForKey:@"date"];
        self.description = [coder decodeObjectForKey:@"description"];
        self.deleteFlag  = [coder decodeBoolForKey:@"deletefrag"];
        
    }
    return self;
}

@end
