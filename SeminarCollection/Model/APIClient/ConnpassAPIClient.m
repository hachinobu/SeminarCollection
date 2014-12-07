//
//  ConnpassAPIClient.m
//  SeminarCollection
//
//  Created by Takahiro Nishinobu on 2014/07/17.
//  Copyright (c) 2014年 Takahiro Nishinobu. All rights reserved.
//

#import "ConnpassAPIClient.h"

static NSString * const ConnpassBaseURLString = @"http://connpass.com/api/v1/event/";

@implementation ConnpassAPIClient

+ (instancetype)sharedClient {
    static ConnpassAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[self alloc] initWithBaseURL:[NSURL URLWithString:ConnpassBaseURLString]];
    });
    return _sharedClient;
}

@end
