//
//  SeminarAPIClient.h
//  SeminarCollection
//
//  Created by Takahiro Nishinobu on 2014/07/17.
//  Copyright (c) 2014年 Takahiro Nishinobu. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface SeminarAPIClient : AFHTTPSessionManager

+ (instancetype)sharedClient;
- (void)getSeminars:(NSDictionary *)parameters
     withCompletion:(void (^)(NSDictionary *, NSError *))block;

@end
