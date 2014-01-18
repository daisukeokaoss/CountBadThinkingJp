//
//  ThinkAndDateTimeAndLocationInputViewController.m
//  StopBadThought
//
//  Created by 岡 大輔 on 2013/11/25.
//  Copyright (c) 2013年 ナノソフトウェア. All rights reserved.
//

#import "ThinkAndDateTimeAndLocationInputViewController.h"

//ユーザーインポート
#import "MyAnnotation.h"


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
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)CancelButtonClicked:(id)sender {
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
//現在位置を出力する
{
	//_longitude = 0.0;
	//_latitude = 0.0;
	//lonLabel.text = [NSString stringWithFormat:@"%f",_longitude];
	//latLabel.text = [NSString stringWithFormat:@"%f",_latitude];
    self.mv.mapType = MKMapTypeStandard;
    [self.mv setUserTrackingMode:MKUserTrackingModeNone animated:YES];
    
    [self performSelectorOnMainThread:@selector(reloadMap) withObject:nil waitUntilDone:NO];
    
    
    
	// ロケーションマネージャーを作成
	BOOL locationServicesEnabled;
	self.locationManager = [[CLLocationManager alloc] init];

    locationServicesEnabled = [CLLocationManager locationServicesEnabled];
	
    
	if (locationServicesEnabled) {
		self.locationManager.delegate = self;
        
		// 位置情報取得開始
        self.RepeatLocationUpload = YES;
		[self.locationManager startUpdatingLocation];
	}
}

-(void)reloadMap
{
    [self.mv setRegion:self.mv.region animated:NO];
    // 表示位置を設定（ここでは東京都庁の経度緯度を例としています）
   // [self.mv reloadInputViews];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    // 生成
    if(self.RepeatLocationUpload == NO){
        return;
    }else{
        self.RepeatLocationUpload = NO;
    }
    [self.mv addAnnotation:
        [[MyAnnotation alloc]initWithLocationCoordinate:CLLocationCoordinate2DMake(newLocation.coordinate.latitude,newLocation.coordinate.longitude)
                                                       title:@"現在位置"
                                                    subtitle:@""]];
    [self.mv addAnnotation:
     [[MyAnnotation alloc]initWithLocationCoordinate:CLLocationCoordinate2DMake(35.65533333,139.7486111)
                                               title:@"東京タワー"
                                            subtitle:@""]];

    
    CLLocationCoordinate2D co = CLLocationCoordinate2DMake(newLocation.coordinate.latitude, newLocation.coordinate.longitude);
    [self.mv setCenterCoordinate:co animated:NO];
    
    // 縮尺を指定
    MKCoordinateRegion cr = MKCoordinateRegionMakeWithDistance(co, 1000, 1000);
    [self.mv setRegion:cr animated:NO];
    
   
    
    // addSubview
    //[self.view addSubview:self.mv];
    [self.locationManager stopUpdatingLocation];
    
    
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
	if (error) {
		NSString* message = nil;
		switch ([error code]) {
                // アプリでの位置情報サービスが許可されていない場合
			case kCLErrorDenied:
				// 位置情報取得停止
				[self.locationManager stopUpdatingLocation];
				message = [NSString stringWithFormat:@"このアプリは位置情報サービスが許可されていません。"];
				break;
			default:
				message = [NSString stringWithFormat:@"位置情報の取得に失敗しました。"];
				break;
		}
		if (message) {
			// アラートを表示
			UIAlertView* alert=[[UIAlertView alloc] initWithTitle:@"" message:message delegate:nil
                                                 cancelButtonTitle:@"OK" otherButtonTitles:nil] ;
			[alert show];
		}
	}
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
