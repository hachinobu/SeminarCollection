//
//  HACUpDownTransition.m
//  SeminarCollection
//
//  Created by Takahiro Nishinobu on 2014/12/14.
//  Copyright (c) 2014年 Takahiro Nishinobu. All rights reserved.
//

#import "HACUpDownTransition.h"
#import "HACSeminarListVC.h"
#import "HACSeminarDetailVC.h"
#import "HACSeminarCell.h"

@implementation HACUpDownTransition

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.3f;
}

- (void)pushAnimateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    HACSeminarListVC *fromVC = (HACSeminarListVC *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    HACSeminarDetailVC *toVC = (HACSeminarDetailVC *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *toView = toVC.view;
    UIView *fromView = fromVC.view;
    
    NSIndexPath *indexPath = [fromVC.tableView indexPathForSelectedRow];
    HACSeminarCell *cell = (HACSeminarCell *)[fromVC.tableView cellForRowAtIndexPath:indexPath];
    
    UIView *container = [transitionContext containerView];
    CGRect sliceRect = [container convertRect:cell.bounds fromView:cell];
    fromVC.sliceRect = sliceRect;
    
    UIView *viewSnapShot = [fromView snapshotViewAfterScreenUpdates:NO];
    CGFloat width = CGRectGetWidth(viewSnapShot.frame);
    CGFloat pointY = CGRectGetMaxY(sliceRect);
    UIView *topView = [viewSnapShot resizableSnapshotViewFromRect:CGRectMake(0, 0, width, pointY)
                                               afterScreenUpdates:NO
                                                    withCapInsets:UIEdgeInsetsZero];
    UIView *bottomView = [viewSnapShot resizableSnapshotViewFromRect:CGRectMake(0, pointY, width, CGRectGetHeight(viewSnapShot.frame) - pointY)
                                                  afterScreenUpdates:NO
                                                       withCapInsets:UIEdgeInsetsZero];
    
    CGRect topFrame = topView.frame;
    CGRect topOutFrame = CGRectOffset(topFrame, 0, -CGRectGetHeight(topFrame));
    CGRect bottomFrame = CGRectOffset(bottomView.frame, 0, CGRectGetHeight(topFrame));
    CGRect bottomOutFrame = CGRectOffset(bottomFrame, 0, CGRectGetHeight(bottomFrame));
    bottomView.frame = bottomFrame;
    
    [container addSubview:topView];
    [container addSubview:bottomView];
    
    [container insertSubview:toView belowSubview:topView];
    toView.alpha = 0.5;
    
    [fromView removeFromSuperview];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                     animations:^{
                         topView.frame = topOutFrame;
                         bottomView.frame = bottomOutFrame;
                         toView.alpha = 1.0;
                     } completion:^(BOOL finished) {
                         [topView removeFromSuperview];
                         [bottomView removeFromSuperview];
                         [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                     }
     ];
}

- (void)popAnimateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    HACSeminarDetailVC *fromVC = (HACSeminarDetailVC *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    HACSeminarListVC *toVC = (HACSeminarListVC *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *toView = toVC.view;
    UIView *fromView = fromVC.view;
    
    UIView *container = [transitionContext containerView];
    CGRect sliceRect = toVC.sliceRect;
    
    UIView *viewSnapShot = [toView snapshotViewAfterScreenUpdates:YES];
    
    CGFloat width = CGRectGetWidth(viewSnapShot.frame);
    CGFloat pointY = CGRectGetMaxY(sliceRect);
    UIView *topView = [viewSnapShot resizableSnapshotViewFromRect:CGRectMake(0, 0, width, pointY)
                                               afterScreenUpdates:NO
                                                    withCapInsets:UIEdgeInsetsZero];
    UIView *bottomView = [viewSnapShot resizableSnapshotViewFromRect:CGRectMake(0, pointY, width, CGRectGetHeight(viewSnapShot.frame) - pointY)
                                                  afterScreenUpdates:NO
                                                       withCapInsets:UIEdgeInsetsZero];
    
    CGRect topFrame = topView.frame;
    CGRect topOutFrame = CGRectOffset(topFrame, 0, -CGRectGetHeight(topFrame));
    CGRect bottomFrame = CGRectOffset(bottomView.frame, 0, CGRectGetHeight(topFrame));
    CGRect bottomOutFrame = CGRectOffset(bottomFrame, 0, CGRectGetHeight(bottomFrame));
    bottomView.frame = bottomFrame;
    
    [container addSubview:topView];
    [container addSubview:bottomView];
    
    topView.frame = topOutFrame;
    bottomView.frame = bottomOutFrame;
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                     animations:^{
                         topView.frame = topFrame;
                         bottomView.frame = bottomFrame;
                         fromView.alpha = 0.5;
                     } completion:^(BOOL finished) {
                         [topView removeFromSuperview];
                         [bottomView removeFromSuperview];
                         [container addSubview:toView];
                         [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                     }
     ];
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    if (self.pushing) {
        [self pushAnimateTransition:transitionContext];
        return;
    }
    [self popAnimateTransition:transitionContext];
}

@end
