//
//  HACTransformTransitionController.m
//  SeminarCollection
//
//  Created by Takahiro Nishinobu on 2014/12/29.
//  Copyright (c) 2014年 Takahiro Nishinobu. All rights reserved.
//

#import "HACTransformTransitionController.h"
#import "HACSeminarDetailVC.h"
#import "HACWebSeminarDetail.h"

static NSTimeInterval const AnimationTransitionDuration = 1.0f;

@implementation HACTransformTransitionController

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return AnimationTransitionDuration;
}

- (void)presentTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UINavigationController *nav = (UINavigationController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    HACSeminarDetailVC *fromVC = (HACSeminarDetailVC *)[nav topViewController];
    
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView *containerView = [transitionContext containerView];
    
    CGRect rect = toView.frame;
    toView.center = fromVC.buttonTapPoint;
    toView.transform = CGAffineTransformMakeScale(0, 0);
    [containerView addSubview:toView];
    
    [UIView animateKeyframesWithDuration:[self transitionDuration:transitionContext] delay:0
                                 options:0
                              animations:^{
                                  toView.transform = CGAffineTransformMakeScale(2, 2);
                              } completion:^(BOOL finished) {
                                  toView.transform = CGAffineTransformIdentity;
                                  toView.frame = rect;
                                  [transitionContext completeTransition:finished];
                              }];
}

- (void)dismissTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UINavigationController *nav = (UINavigationController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    HACSeminarDetailVC *toVC = (HACSeminarDetailVC *)[nav topViewController];
    
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    
    UIView *containerView = [transitionContext containerView];
    [containerView insertSubview:toView belowSubview:fromView];
    
    [UIView animateKeyframesWithDuration:[self transitionDuration:transitionContext] delay:0
                                 options:0
                              animations:^{
                                  fromView.center = toVC.buttonTapPoint;
                                  fromView.transform = CGAffineTransformMakeScale(0.1, 0.1);
                              } completion:^(BOOL finished) {
                                  [transitionContext completeTransition:finished];
                              }];
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    if (self.isPresenting) {
        [self presentTransition:transitionContext];
//        [self presentAffineTransformTransition:transitionContext];
    }
    else {
        [self dismissTransition:transitionContext];
    }
}

- (void)presentAffineTransformTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    
    UIView *containerView = [transitionContext containerView];
    
    toView.frame = containerView.bounds;
    fromView.frame = containerView.bounds;
    
    [containerView addSubview:toView];
    toView.alpha = 0;
    
    [UIView animateKeyframesWithDuration:[self transitionDuration:transitionContext] delay:0
                                 options:0
                              animations:^{
                                  fromView.transform = CGAffineTransformMakeScale(0.1, 0.1);
                                  toView.alpha = 1;
                              } completion:^(BOOL finished) {
                                  fromView.transform = CGAffineTransformIdentity;
                                  [transitionContext completeTransition:finished];
                              }];

}

@end
