//
//  ViewController.m
//  StopBadThought
//
//  Created by 岡 大輔 on 2013/11/19.
//  Copyright (c) 2013年 ナノソフトウェア. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.CountButtn.buttonBackgroundColor = [UIColor colorWithRed:0.74f green:0.21f blue:0.18f alpha:1.00f]; //[UIColor colorWithRed:231.0f/255.0f green:110.0f/255.0f blue:121.0f/255.0f alpha:1.0f];
    self.CountButtn.buttonForegroundColor = [UIColor colorWithRed:255.0f/255.0f green:246.0f/255.0f blue:150.0f/255.0f alpha:1.0f]; //[UIColor colorWithHue:0.0f saturation:0.0f brightness:1.0f alpha:1.0f];
    self.CountButtn.titleLabel.font = [UIFont fontWithName:@"Arial" size:15.0f];
    self.CountButtn.titleLabel.numberOfLines = 2;
    self.CountButtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.CountButtn setFlatTitle:@"嫌な考えが浮かんだら押してください!!"];
    [self.CountButtn setFlatImage:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
