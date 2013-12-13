//
//  ThinkAndDateTimeAndLocationInputViewController.h
//  StopBadThought
//
//  Created by 岡 大輔 on 2013/11/25.
//  Copyright (c) 2013年 ナノソフトウェア. All rights reserved.
//

#import "JSFlatButton.h"

#import <UIKit/UIKit.h>

@interface ThinkAndDateTimeAndLocationInputViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *ThinkingDicription;
@property (weak, nonatomic) IBOutlet JSFlatButton *RecordButton;
@property (weak, nonatomic) IBOutlet UILabel *DataTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *LocationLabel;
@property (strong,nonatomic) NSDate *date;


@property (weak, nonatomic) IBOutlet JSFlatButton *CancelJSFlatButton;



@end
