//
//  ThinkAndDateTimeAndLocationInputViewController.m
//  StopBadThought
//
//  Created by 岡 大輔 on 2013/11/25.
//  Copyright (c) 2013年 ナノソフトウェア. All rights reserved.
//

#import "ThinkAndDateTimeAndLocationInputViewController.h"

@interface ThinkAndDateTimeAndLocationInputViewController ()

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
    
    NSString *localeIdentifier = [[NSLocale currentLocale] localeIdentifier];
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setLocale:[[NSLocale alloc] initWithLocaleIdentifier:localeIdentifier]]; // Localeの指定
    [df setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
    
    // 日付(NSDate) => 文字列(NSString)に変換
    NSDate *now = [NSDate date];
    NSString *strNow = [df stringFromDate:now];
    
    // ログ出力
    self.DataTimeLabel.text = strNow;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
