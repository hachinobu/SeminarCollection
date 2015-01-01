//
//  HACSeminarDetailVC.m
//  SeminarCollection
//
//  Created by Nishinobu.Takahiro on 2014/12/13.
//  Copyright (c) 2014年 Takahiro Nishinobu. All rights reserved.
//

#import "HACSeminarDetailVC.h"
#import "HACWebSeminarDetail.h"

#import "Seminar.h"

#import <WebKit/WebKit.h>

#import "HACTransforTransitionDelegate.h"

@interface HACSeminarDetailVC ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *catchLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UILabel *placeLabel;
@property (weak, nonatomic) IBOutlet UIView *webContainerView;
@property (weak, nonatomic, readwrite) IBOutlet UIButton *detailButton;

@property (strong, nonatomic) WKWebView *webView;
@property (strong, nonatomic) HACTransforTransitionDelegate *transitionController;

@end

@implementation HACSeminarDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.transitionController = [[HACTransforTransitionDelegate alloc] init];
    
    NSMutableParagraphStyle *paragrahStyle = [[NSMutableParagraphStyle alloc] init];
    paragrahStyle.minimumLineHeight = 30.0f;
    paragrahStyle.maximumLineHeight = 30.0f;
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:self.seminarInfo.title];
    [attributedText addAttribute:NSParagraphStyleAttributeName
                           value:paragrahStyle
                           range:NSMakeRange(0, attributedText.length)];
    self.titleLabel.attributedText = attributedText;
    self.catchLabel.text = self.seminarInfo.catchCopy;
    self.dateLabel.text = [self.seminarInfo schedule];
    self.numberLabel.text = [self.seminarInfo numberStatus];
    self.placeLabel.text = [self.seminarInfo placeInfo];
    
    [self setupWKWebView];
    [self setupDetailButton];
}

- (void)setupWKWebView {
    self.webView = [WKWebView new];
    self.webView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.webContainerView addSubview:self.webView];
    [self.webContainerView addConstraints:@[
                                [NSLayoutConstraint constraintWithItem:self.webView
                                                             attribute:NSLayoutAttributeLeft
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.webContainerView
                                                             attribute:NSLayoutAttributeLeft
                                                            multiplier:1.0
                                                              constant:.0],
                                [NSLayoutConstraint constraintWithItem:self.webView
                                                             attribute:NSLayoutAttributeTop
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.webContainerView
                                                             attribute:NSLayoutAttributeTop
                                                            multiplier:1.0
                                                              constant:.0],
                                [NSLayoutConstraint constraintWithItem:self.webView
                                                             attribute:NSLayoutAttributeRight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.webContainerView
                                                             attribute:NSLayoutAttributeRight
                                                            multiplier:1.0
                                                              constant:.0],
                                [NSLayoutConstraint constraintWithItem:self.webView
                                                             attribute:NSLayoutAttributeBottom
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.webContainerView
                                                             attribute:NSLayoutAttributeBottom
                                                            multiplier:1.0
                                                              constant:.0]
                                
                                ]];
    [self.webView loadHTMLString:self.seminarInfo.detail baseURL:nil];
}

- (void)setupDetailButton {
    [self.detailButton addTarget:self action:@selector(detailWebAction:forEvent:) forControlEvents:UIControlEventTouchUpInside];
    self.detailButton.layer.borderWidth = 0.8;
    self.detailButton.layer.cornerRadius = 8.0;
    self.detailButton.backgroundColor = [UIColor blueColor];
    [self.detailButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Action
- (void)detailWebAction:(id)sender forEvent:(UIEvent *)event {
    NSSet *touches = [event touchesForView:sender];
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:sender];
    self.buttonTapPoint = [self.view convertPoint:touchPoint fromView:sender];
}

#pragma mark - Segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UINavigationController *controller = [segue destinationViewController];
    controller.transitioningDelegate = self.transitionController;
    HACWebSeminarDetail *vc = (HACWebSeminarDetail *)controller.topViewController;
    vc.transitioningDelegate = self.transitionController;
    vc.eventURLString = self.seminarInfo.eventUrl;
}

@end
