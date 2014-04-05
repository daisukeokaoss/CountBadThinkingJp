//
//  AppDelegate.h
//  StopBadThought
//
//  Created by 岡 大輔 on 2013/11/19.
//  Copyright (c) 2013年 ナノソフトウェア. All rights reserved.
//

#include "OneTapRecordPersistentManager.h"

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


@property (strong,nonatomic) OneTapRecordPersistentManager *TapPersisitent;

@property (nonatomic) NSInteger HistryPlotViewController_CurrentSelectedCellIndex;

@end
