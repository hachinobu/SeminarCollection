//
//  HACWebSeminarDetail.m
//  SeminarCollection
//
//  Created by Takahiro Nishinobu on 2014/12/20.
//  Copyright (c) 2014年 Takahiro Nishinobu. All rights reserved.
//

#import "HACWebSeminarDetail.h"
#import <WebKit/WebKit.h>

@interface HACWebSeminarDetail ()

@property (strong, nonatomic) WKWebView *seminarWebView;

@end

@implementation HACWebSeminarDetail

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupWebView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupWebView {
    self.seminarWebView = [WKWebView new];
    self.seminarWebView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.seminarWebView];
    [self.view addConstraints:@[
                                            [NSLayoutConstraint constraintWithItem:self.seminarWebView
                                                                         attribute:NSLayoutAttributeLeft
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:self.view
                                                                         attribute:NSLayoutAttributeLeft
                                                                        multiplier:1.0
                                                                          constant:.0],
                                            [NSLayoutConstraint constraintWithItem:self.seminarWebView
                                                                         attribute:NSLayoutAttributeTop
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:self.view
                                                                         attribute:NSLayoutAttributeTop
                                                                        multiplier:1.0
                                                                          constant:.0],
                                            [NSLayoutConstraint constraintWithItem:self.seminarWebView
                                                                         attribute:NSLayoutAttributeRight
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:self.view
                                                                         attribute:NSLayoutAttributeRight
                                                                        multiplier:1.0
                                                                          constant:.0],
                                            [NSLayoutConstraint constraintWithItem:self.seminarWebView
                                                                         attribute:NSLayoutAttributeBottom
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:self.view
                                                                         attribute:NSLayoutAttributeBottom
                                                                        multiplier:1.0
                                                                          constant:.0]
                                            
                                            ]];
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:self.eventURLString]];
    [self.seminarWebView loadRequest:urlRequest];
}

#pragma mark - Action
- (IBAction)reloadWeb:(id)sender {
    [self.seminarWebView reload];
}

- (IBAction)closeWeb:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
