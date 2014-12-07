//
//  ZusaarAPIClient.m
//  SeminarCollection
//
//  Created by Takahiro Nishinobu on 2014/07/15.
//  Copyright (c) 2014年 Takahiro Nishinobu. All rights reserved.
//

#import "ZusaarAPIClient.h"

static NSString * const ZussarBaseURLString = @"http://www.zusaar.com/api/event/";

@implementation ZusaarAPIClient

+ (instancetype)sharedClient {
    static ZusaarAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[self alloc] initWithBaseURL:[NSURL URLWithString:ZussarBaseURLString]];
    });
    return _sharedClient;
}

@end
