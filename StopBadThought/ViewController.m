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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    //「嫌な考えが浮かんだら押してください！！」ボタンの設定
    self.CountButtn.buttonBackgroundColor = [UIColor colorWithRed:0.74f green:0.21f blue:0.18f alpha:1.00f];
    self.CountButtn.buttonForegroundColor = [UIColor colorWithRed:255.0f/255.0f green:246.0f/255.0f blue:150.0f/255.0f alpha:1.0f];
    self.CountButtn.titleLabel.font = [UIFont fontWithName:@"Arial" size:15.0f];
    self.CountButtn.titleLabel.numberOfLines = 2;
    self.CountButtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.CountButtn setFlatTitle:@"嫌な考えが浮かんだら押してください!!"];
    [self.CountButtn setFlatImage:nil];
    
    //「設定」ボタンの設定
    self.SettingButton.buttonBackgroundColor = [UIColor colorWithRed:0.99f green:0.99f blue:0.00f alpha:1.00f];
    self.SettingButton.buttonForegroundColor = [UIColor colorWithRed:0.99f green:0.00f blue:0.00f alpha:1.00f];
    self.SettingButton.titleLabel.font = [UIFont boldSystemFontOfSize:14.0f];
    
    [self.SettingButton setFlatTitle:@"設定"];
    [self.CountButtn setFlatImage:nil];
    
    //「履歴」ボタンの設定
    self.HistoryButton.buttonBackgroundColor = [UIColor colorWithRed:0.32f green:0.64f blue:0.32f alpha:1.00f];
    self.HistoryButton.buttonForegroundColor = [UIColor colorWithHue:0.0f saturation:0.0f brightness:1.0f alpha:1.0f];
    self.HistoryButton.titleLabel.font = [UIFont boldSystemFontOfSize:16];;
    [self.HistoryButton setFlatTitle:@"履歴"];
    [self.HistoryButton setFlatImage:nil];
    
    
    
    [self.TapPersisitent OpenRecordArray];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self.TapPersisitent saveRecordArray];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //Segueの特定
    if ( [[segue identifier] isEqualToString:@"BadThoughtHappen"] ) {
         ThinkAndDateTimeAndLocationInputViewController *nextViewController = [segue destinationViewController];
        nextViewController.Record = self.TapPersisitent;
    }
    if([[segue identifier] isEqualToString:@"HistoryPlot"]){
        HistoryPlotViewController *nextViewController = [segue destinationViewController];
        nextViewController.Record = self.TapPersisitent;
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
