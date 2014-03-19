//
//  ViewController.h
//  StopBadThought
//
//  Created by 岡 大輔 on 2013/11/19.
//  Copyright (c) 2013年 ナノソフトウェア. All rights reserved.
//
#import <UIKit/UIKit.h>

//ユーザーインクルード

#import "JSFlatButton.h"
#import "OneTapRecordPersistentManager.h"


@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet JSFlatButton *CountButtn;

@property (strong,nonatomic) OneTapRecordPersistentManager *TapPersisitent;

@property (weak, nonatomic) IBOutlet JSFlatButton *SettingButton;
@property (weak, nonatomic) IBOutlet JSFlatButton *HistoryButton;

@property (weak, nonatomic) IBOutlet UILabel *PlotBadThoughtCountLabel;


@end
