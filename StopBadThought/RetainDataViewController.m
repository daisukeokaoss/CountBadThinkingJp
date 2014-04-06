//
//  RetainDataViewController.m
//  StopBadThought
//
//  Created by 岡 大輔 on 2013/12/13.
//  Copyright (c) 2013年 ナノソフトウェア. All rights reserved.
//

#import "RetainDataViewController.h"

//ユーザーインクルード
#include "AppDelegate.h"

@interface RetainDataViewController ()

@end

@implementation RetainDataViewController

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

 /*   AppDelegate *appdelegate;
    appdelegate = [[UIApplication sharedApplication] delegate];
    if(appdelegate.TapPersisitent == nil){
        appdelegate.TapPersisitent = [[OneTapRecordPersistentManager alloc] init];
    }
    
    self.PersistentPeriodPicker.*/
    
    AppDelegate *appdelegate;
    appdelegate = [[UIApplication sharedApplication] delegate];
    if(appdelegate.TapPersisitent == nil){
        appdelegate.TapPersisitent = [[OneTapRecordPersistentManager alloc] init];
    }
    
    if(appdelegate.TapPersisitent.period == PersistentPeriodInfinite){
        //永続的だった場合
        [self.PersistentPeriodPicker selectRow:0 inComponent:0 animated:NO];
    }else if(appdelegate.TapPersisitent.period == PersistentPeriod_3_Years){
        //半年だった場合
        [self.PersistentPeriodPicker selectRow:1 inComponent:0 animated:NO];
        
    }else if(appdelegate.TapPersisitent.period == PersistentPeriod_1_Years){
        //3年だった場合
        [self.PersistentPeriodPicker selectRow:2 inComponent:0 animated:NO];
    }else if(appdelegate.TapPersisitent.period == PersistentPeriod_Half_Years){
        //1年だった場合
        [self.PersistentPeriodPicker selectRow:3 inComponent:0 animated:NO];
    }else if(appdelegate.TapPersisitent.period == PersistentPeriod_3_Month){
        [self.PersistentPeriodPicker selectRow:4 inComponent:0 animated:NO];
    }else if(appdelegate.TapPersisitent.period == PersistentPeriod_1_Month){
        //一月だった場合
        [self.PersistentPeriodPicker selectRow:5 inComponent:0 animated:NO];
    }
    
    
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    AppDelegate *appdelegate;
    appdelegate = [[UIApplication sharedApplication] delegate];
    if(appdelegate.TapPersisitent == nil){
        appdelegate.TapPersisitent = [[OneTapRecordPersistentManager alloc] init];
    }
    
    switch([self.PersistentPeriodPicker selectedRowInComponent:0]){
        case 0:
            appdelegate.TapPersisitent.period = PersistentPeriodInfinite;
            break;
        case 1:
            appdelegate.TapPersisitent.period = PersistentPeriod_3_Years;
            break;
        case 2:
            appdelegate.TapPersisitent.period = PersistentPeriod_1_Years;
            break;
        case 3:
            appdelegate.TapPersisitent.period = PersistentPeriod_Half_Years;
            break;
        case 4:
            appdelegate.TapPersisitent.period = PersistentPeriod_3_Month;
            break;
        case 5:
            appdelegate.TapPersisitent.period = PersistentPeriod_1_Month;
            break;
            
    }
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}*/

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    return 6;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView
    widthForComponent:(NSInteger)component
{
    switch (component) {
        case 0: // 1列目
            return 320.0;
            break;
            
     
            
        default:
            return 0;
            break;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    switch (component) {
        case 0: // 1列目
            if(row == 0){
                //１行目
                return @"永久的";
            }else if(row == 1){
                //2行目
                return @"3年";
            }else if(row == 2){
                //3行目
                return @"1年";
            }else if(row == 3){
                //4行目
                return @"半年";
            }else if(row == 4){
                //５行目
                return @"３ヶ月";
            }else if(row == 5){
                //６行目
                return @"1ヶ月";
            }
            break;
        default:
            return nil;
    }
    return nil;
}

@end
