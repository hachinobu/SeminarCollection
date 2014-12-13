//
//  SeminarCell.h
//  SeminarCollection
//
//  Created by Nishinobu.Takahiro on 2014/12/13.
//  Copyright (c) 2014年 Takahiro Nishinobu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Seminar;
@interface HACSeminarCell : UITableViewCell

- (void)setupCellWithModel:(Seminar *)seminar;

@end
