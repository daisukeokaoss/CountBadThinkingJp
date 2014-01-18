//
//  MyAnnotation.m
//  StopBadThought
//
//  Created by 岡 大輔 on 2014/01/19.
//  Copyright (c) 2014年 ナノソフトウェア. All rights reserved.
//

#import "MyAnnotation.h"

@implementation MyAnnotation

- (NSString *)title {
    return self.annotationTitle;
}

- (NSString *)subtitle {
    return self.annotationSubtitle;
}

- (id)initWithLocationCoordinate:(CLLocationCoordinate2D) coordinate
                           title:(NSString *) annotationTitle subtitle:(NSString *) annotationSubtitle {
    self.coordinate = coordinate;
    self.annotationTitle = annotationTitle;
    self.annotationSubtitle = annotationSubtitle;
    return self;
}

@end
