//
//  OneTapRecordPlotViewController.h
//  StopBadThought
//
//  Created by 岡 大輔 on 2014/03/31.
//  Copyright (c) 2014年 ナノソフトウェア. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <MapKit/MapKit.h>

@interface OneTapRecordPlotViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *LogtitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *LatutudeLabel;
@property (weak, nonatomic) IBOutlet MKMapView *PlotMapView;
@property (weak, nonatomic) IBOutlet UITextView *Description;
@property (weak, nonatomic) IBOutlet UILabel *Date;

@end
