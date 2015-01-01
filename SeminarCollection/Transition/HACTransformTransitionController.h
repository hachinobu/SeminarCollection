//
//  HACTransformTransitionController.h
//  SeminarCollection
//
//  Created by Takahiro Nishinobu on 2014/12/29.
//  Copyright (c) 2014年 Takahiro Nishinobu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HACTransformTransitionController : NSObject <UIViewControllerAnimatedTransitioning>

@property (assign, nonatomic) BOOL isPresenting;

@end
