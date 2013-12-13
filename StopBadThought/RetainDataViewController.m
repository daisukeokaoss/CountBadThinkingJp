//
//  RetainDataViewController.m
//  StopBadThought
//
//  Created by 岡 大輔 on 2013/12/13.
//  Copyright (c) 2013年 ナノソフトウェア. All rights reserved.
//

#import "RetainDataViewController.h"

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

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
