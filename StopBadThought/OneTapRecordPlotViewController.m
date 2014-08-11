//
//  OneTapRecordPlotViewController.m
//  StopBadThought
//
//  Created by 岡 大輔 on 2014/03/31.
//  Copyright (c) 2014年 ナノソフトウェア. All rights reserved.
//

#import "OneTapRecordPlotViewController.h"


//ユーザーインクルード


@interface OneTapRecordPlotViewController ()
@property (weak, nonatomic) IBOutlet UISlider *MoodValue;

@end

@implementation OneTapRecordPlotViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    AppDelegate *appdelegate;
    appdelegate = [[UIApplication sharedApplication] delegate];
    
    if(appdelegate.TapPersisitent == nil){
        appdelegate.TapPersisitent = [[OneTapRecordPersistentManager alloc] init];
    }
    
    OneTapRecord *onetap = [appdelegate.TapPersisitent.TapRecordArray objectAtIndex:appdelegate.HistryPlotViewController_CurrentSelectedCellIndex];
    
    self.LatutudeLabel.text = [NSString stringWithFormat:@"%f",onetap.latitude];
    self.LogtitudeLabel.text = [NSString stringWithFormat:@"%f",onetap.longitude];
    self.Description.text = [onetap.description mutableCopy];
    [self.MoodValue setValue:onetap.Mood];

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy年MM月dd日HH時mm分ss秒"];
    
    self.Date.text = [formatter stringFromDate:onetap.date];
    
    MKPointAnnotation *cur = [[MKPointAnnotation alloc] init];
    cur.title = @"現在位置";
    
    cur.coordinate = CLLocationCoordinate2DMake(onetap.latitude, onetap.longitude);
    [self.PlotMapView showAnnotations:@[cur] animated:NO];
}
- (IBAction)ReturnButton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
