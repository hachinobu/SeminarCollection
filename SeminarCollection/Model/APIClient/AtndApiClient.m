//
//  AtndApiClient.m
//  SeminarCollection
//
//  Created by Takahiro Nishinobu on 2014/07/17.
//  Copyright (c) 2014年 Takahiro Nishinobu. All rights reserved.
//

#import "AtndApiClient.h"

@implementation AtndApiClient

static NSString * const AtndBaseURLString = @"http://api.atnd.org/events/";

+ (instancetype)sharedClient
{
    static AtndApiClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[self alloc] initWithBaseURL:[NSURL URLWithString:AtndBaseURLString]];
    });
    return _sharedClient;
}

@end
