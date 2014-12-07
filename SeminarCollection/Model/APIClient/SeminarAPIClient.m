//
//  SeminarAPIClient.m
//  SeminarCollection
//
//  Created by Takahiro Nishinobu on 2014/07/17.
//  Copyright (c) 2014年 Takahiro Nishinobu. All rights reserved.
//

#import "SeminarAPIClient.h"

@implementation SeminarAPIClient

+ (instancetype)sharedClient {
    static SeminarAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[self alloc] init];
    });
    return _sharedClient;
}

- (void)getSeminars:(NSDictionary *)parameters
     withCompletion:(void (^)(NSDictionary *, NSError *))block {
    [self GET:@"" parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        if (block) {
            block(responseObject, nil);
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];
}


@end
