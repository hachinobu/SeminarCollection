//
//  HACSeminarDetailVC.m
//  SeminarCollection
//
//  Created by Nishinobu.Takahiro on 2014/12/13.
//  Copyright (c) 2014年 Takahiro Nishinobu. All rights reserved.
//

#import "HACSeminarDetailVC.h"
#import "Seminar.h"
#import <WebKit/WebKit.h>

@interface HACSeminarDetailVC ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *catchLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UILabel *placeLabel;
@property (weak, nonatomic) IBOutlet UIView *webContainerView;
@property (weak, nonatomic) IBOutlet UIButton *detailButton;

@property (strong, nonatomic) WKWebView *webView;

@end

@implementation HACSeminarDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleLabel.text = self.seminarInfo.title;
    self.catchLabel.text = self.seminarInfo.catchCopy;
    self.dateLabel.text = [self.seminarInfo schedule];
    self.numberLabel.text = [self.seminarInfo numberStatus];
    self.placeLabel.text = [self.seminarInfo placeInfo];
    
    [self setupWKWebView];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)openEvent:(id)sender {
    NSURL *eventURL = [NSURL URLWithString:self.seminarInfo.eventUrl];
    [[UIApplication sharedApplication] openURL:eventURL];
}


@end
