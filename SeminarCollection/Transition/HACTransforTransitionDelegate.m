//
//  HACTransforTransitionDelegate.m
//  SeminarCollection
//
//  Created by Takahiro Nishinobu on 2014/12/30.
//  Copyright (c) 2014年 Takahiro Nishinobu. All rights reserved.
//

#import "HACTransforTransitionDelegate.h"
#import "HACTransformTransitionController.h"

@implementation HACTransforTransitionDelegate

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    HACTransformTransitionController *controller = [[HACTransformTransitionController alloc] init];
    controller.isPresenting = YES;
    return controller;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    HACTransformTransitionController *controller = [[HACTransformTransitionController alloc] init];
    controller.isPresenting = NO;
    return controller;
}

@end
