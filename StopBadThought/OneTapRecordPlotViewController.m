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
