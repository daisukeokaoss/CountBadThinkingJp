//
//  ThinkAndDateTimeAndLocationInputViewController.h
//  StopBadThought
//
//  Created by 岡 大輔 on 2013/11/25.
//  Copyright (c) 2013年 ナノソフトウェア. All rights reserved.
//



#import "JSFlatButton.h"

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>


@interface ThinkAndDateTimeAndLocationInputViewController : UIViewController <CLLocationManagerDelegate,MKMapViewDelegate>{
    
	// 現在位置記録用
	CLLocationDegrees longitude;
	CLLocationDegrees latitude;

}
@property (nonatomic,strong) CLLocationManager* locationManager;

@property (nonatomic,weak) IBOutlet UILabel *lonLabel;
@property (nonatomic,weak) IBOutlet UILabel *latLabel;


// 現在位置記録用
//@property (nonatomic) CLLocationDegrees _longitude;
//@property (nonatomic) CLLocationDegrees _latitude;


@property (weak, nonatomic) IBOutlet UITextView *ThinkingDicription;
@property (weak, nonatomic) IBOutlet JSFlatButton *RecordButton;
@property (weak, nonatomic) IBOutlet UILabel *DataTimeLabel;

@property (nonatomic,retain) IBOutlet MKMapView *mv;
@property (strong,nonatomic) NSDate *date;


@property (weak, nonatomic) IBOutlet JSFlatButton *CancelJSFlatButton;

@property bool RepeatLocationUpload;



@end
