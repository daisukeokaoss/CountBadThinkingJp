//
//  MyAnnotation.h
//  StopBadThought
//
//  Created by 岡 大輔 on 2014/01/19.
//  Copyright (c) 2014年 ナノソフトウェア. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MyAnnotation : NSObject<MKAnnotation>{
    //CLLocationCoordinate2D coordinate;
    //NSString *annotationTitle;
    //NSString *annotationSubtitle;
}

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, strong) NSString *annotationTitle;
@property (nonatomic, strong) NSString *annotationSubtitle;
- (id)initWithLocationCoordinate:(CLLocationCoordinate2D) coordinate
                           title:(NSString *)annotationTitle subtitle:(NSString *)annotationannSubtitle;
- (NSString *)title;
- (NSString *)subtitle;
@end
