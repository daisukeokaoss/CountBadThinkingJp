//
//  ThinkAndDateTimeAndLocationInputViewController.m
//  StopBadThought
//
//  Created by 岡 大輔 on 2013/11/25.
//  Copyright (c) 2013年 ナノソフトウェア. All rights reserved.
//

#import "ThinkAndDateTimeAndLocationInputViewController.h"

//ユーザーインポート




@interface ThinkAndDateTimeAndLocationInputViewController ()
- (void)SetUpLocation;


@end

@implementation ThinkAndDateTimeAndLocationInputViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)RecordButtonClicked:(id)sender
{
    OneTapRecord *onetap = [[OneTapRecord alloc] init];
    onetap.longitude = longitude;
    onetap.latitude  = latitude;
    onetap.date = [NSDate date];
    onetap.description = self.ThinkingDicription.text;
    onetap.deleteFlag = false;
    
    [self.Record.TapRecordArray addObject:onetap];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)CancelButtonClicked:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.ThinkingDicription.layer.borderColor = [UIColor blackColor].CGColor;
    self.ThinkingDicription.layer.borderWidth = 1;
    
    self.RecordButton.buttonBackgroundColor = [UIColor colorWithRed:0.32f green:0.64f blue:0.32f alpha:1.00f]; //[UIColor colorWithHue:0.0f saturation:0.0f brightness:0.60f alpha:1.0f];
    self.RecordButton.buttonForegroundColor = [UIColor colorWithHue:0.0f saturation:0.0f brightness:1.0f alpha:1.0f];
    self.RecordButton.titleLabel.font = [UIFont boldSystemFontOfSize:18.0f];
    [self.RecordButton setFlatTitle:@"記録"];
    
    self.CancelJSFlatButton.buttonBackgroundColor = [UIColor colorWithRed:0.99f green:0.99f blue:0.00f alpha:1.00f];
    self.CancelJSFlatButton.buttonForegroundColor = [UIColor colorWithRed:0.99f green:0.00f blue:0.00f alpha:1.00f];
    self.CancelJSFlatButton.titleLabel.font = [UIFont boldSystemFontOfSize:14.0f];
    [self.CancelJSFlatButton setFlatTitle:@"キャンセル"];
    
    NSString *localeIdentifier = [[NSLocale currentLocale] localeIdentifier];
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setLocale:[[NSLocale alloc] initWithLocaleIdentifier:localeIdentifier]]; // Localeの指定
    [df setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
    
    // 日付(NSDate) => 文字列(NSString)に変換
    NSDate *now = [NSDate date];
    NSString *strNow = [df stringFromDate:now];
    
    // ログ出力
    self.DataTimeLabel.text = strNow;
    
    [self SetUpLocation];
    
    
}

- (void)SetUpLocation
//現在位置取得をセットアップする
{
	longitude = 0.0;
	latitude = 0.0;
	self.lonLabel.text = [NSString stringWithFormat:@"%f",longitude];
	self.latLabel.text = [NSString stringWithFormat:@"%f",latitude];
    
    self.locationManager = [[CLLocationManager alloc] init];
    
    BOOL locationServicesEnabled;
    
    self.OneTimeExec = true;
    
    locationServicesEnabled = [CLLocationManager locationServicesEnabled];
    
    if (locationServicesEnabled) {
        self.locationManager.delegate = self;
        [self.locationManager startUpdatingLocation];
    }


}
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
	// 位置情報更新
{
    if(self.OneTimeExec == true){
        self.OneTimeExec = false;
    }else{
        return;
    }
    
	longitude = newLocation.coordinate.longitude;
	latitude = newLocation.coordinate.latitude;
    
	// 表示更新
	self.lonLabel.text = [NSString stringWithFormat:@"%.3f",longitude];
	self.latLabel.text = [NSString stringWithFormat:@"%.3f",latitude];
    
    MKPointAnnotation *cur = [[MKPointAnnotation alloc] init];
    cur.title = @"現在位置";

    cur.coordinate = CLLocationCoordinate2DMake(newLocation.coordinate.latitude, newLocation.coordinate.longitude);
    [self.mv showAnnotations:@[cur] animated:NO];
    
    
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
