//
//  HACSeminarDetailVC.h
//  SeminarCollection
//
//  Created by Nishinobu.Takahiro on 2014/12/13.
//  Copyright (c) 2014年 Takahiro Nishinobu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Seminar;
@interface HACSeminarDetailVC : UITableViewController

@property (weak, nonatomic, readonly) IBOutlet UIButton *detailButton;

@property (strong, nonatomic) Seminar *seminarInfo;
@property (assign, nonatomic) CGPoint buttonTapPoint;

@end
