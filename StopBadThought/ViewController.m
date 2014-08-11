//
//  ViewController.m
//  StopBadThought
//
//  Created by 岡 大輔 on 2013/11/19.
//  Copyright (c) 2013年 ナノソフトウェア. All rights reserved.
//

#import "ViewController.h"


//ユーザーインクルード
#import "ThinkAndDateTimeAndLocationInputViewController.h"
#import "HistoryPlotViewController.h"
#import "AppDelegate.h"
#import "UIColor+HexString.h"
#import <iAd/iAd.h>

@interface ViewController ()

@end

@implementation ViewController

-(void)awakeFromNib
{
    [super awakeFromNib];
    self.canDisplayBannerAds = YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    //「嫌な考えが浮かんだら押してください！！」ボタンの設定
    self.CountButtn.buttonBackgroundColor = [UIColor colorWithHexString:@"#dc143c"];
    self.CountButtn.buttonForegroundColor = [UIColor colorWithRed:255.0f/255.0f green:246.0f/255.0f blue:150.0f/255.0f alpha:1.0f];
    self.CountButtn.titleLabel.font = [UIFont fontWithName:@"Arial" size:15.0f];
    self.CountButtn.titleLabel.numberOfLines = 2;
    self.CountButtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.CountButtn setFlatTitle:@"嫌な考えが浮かんだら押してください!!"];
    [self.CountButtn setFlatImage:nil];
    
    //「設定」ボタンの設定
    self.SettingButton.buttonBackgroundColor = [UIColor colorWithHexString:@"#77d7ff"];
    self.SettingButton.buttonForegroundColor = [UIColor colorWithHexString:@"#2b2b2b"];
    self.SettingButton.titleLabel.font = [UIFont boldSystemFontOfSize:14.0f];
    
    [self.SettingButton setFlatTitle:@"設定"];
    [self.CountButtn setFlatImage:nil];
    
    //「履歴」ボタンの設定
    self.HistoryButton.buttonBackgroundColor = [UIColor colorWithHexString:@"#228b22"];
    self.HistoryButton.buttonForegroundColor = [UIColor colorWithHue:0.0f saturation:0.0f brightness:1.0f alpha:1.0f];
    self.HistoryButton.titleLabel.font = [UIFont boldSystemFontOfSize:16];;
    [self.HistoryButton setFlatTitle:@"履歴"];
    [self.HistoryButton setFlatImage:nil];
    
    AppDelegate *appdelegate;
    appdelegate = [[UIApplication sharedApplication] delegate];
    
    if(appdelegate.TapPersisitent == nil){
        appdelegate.TapPersisitent = [[OneTapRecordPersistentManager alloc] init];
    }
    
    [appdelegate.TapPersisitent OpenRecordArray];
    
    
    
    //「悪い考えは●回浮かびました」を表示
    //self.PlotBadThoughtCountLabel.text = [NSString stringWithFormat:@"今日悪い考えは%d回浮かびました",[self CheckAndCountTodaysBadthoughtCount]];
}

-(void)viewDidAppear:(BOOL)animated
{
    //「悪い考えは●回浮かびました」を表示
    self.PlotBadThoughtCountLabel.text = [NSString stringWithFormat:@"今日悪い考えは%d回浮かびました",[self CheckAndCountTodaysBadthoughtCount]];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    
    AppDelegate *appdelegate;
    appdelegate = [[UIApplication sharedApplication] delegate];
    
    if(appdelegate.TapPersisitent == nil){
        appdelegate.TapPersisitent = [[OneTapRecordPersistentManager alloc] init];
    }
    
    [appdelegate.TapPersisitent saveRecordArray];
}

/*-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //Segueの特定
    if ( [[segue identifier] isEqualToString:@"BadThoughtHappen"] ) {
         ThinkAndDateTimeAndLocationInputViewController *nextViewController = [segue destinationViewController];
       
    }
    if([[segue identifier] isEqualToString:@"HistoryPlot"]){
        HistoryPlotViewController *nextViewController = [segue destinationViewController];
        
        
    }
}*/

-(int)CheckAndCountTodaysBadthoughtCount
{
    
    AppDelegate *appdelegate;
    appdelegate = [[UIApplication sharedApplication] delegate];
    
    if(appdelegate.TapPersisitent == nil){
        appdelegate.TapPersisitent = [[OneTapRecordPersistentManager alloc] init];
    }
    int CountTodaysBadThought = 0;
    for(int i=0;i<appdelegate.TapPersisitent.TapRecordArray.count;i++){
        OneTapRecord *Cursor =  [appdelegate.TapPersisitent.TapRecordArray objectAtIndex:i];
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"yyyy/MM/dd"];
        [formatter setLocale:[NSLocale systemLocale]];
        [formatter setTimeZone:[NSTimeZone systemTimeZone]];
        NSString *CursorDate = [formatter stringFromDate:Cursor.date];
        NSString *Today      = [formatter stringFromDate:[NSDate date]];
        
        
        if([CursorDate isEqualToString:Today]){
            CountTodaysBadThought++;
        }
    }
    return CountTodaysBadThought;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
