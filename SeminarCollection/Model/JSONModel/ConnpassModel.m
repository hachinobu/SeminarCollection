//
//  ConnpassModel.m
//  SeminarCollection
//
//  Created by Takahiro Nishinobu on 2014/07/17.
//  Copyright (c) 2014年 Takahiro Nishinobu. All rights reserved.
//

#import "ConnpassModel.h"

@implementation ConnpassModel

#pragma mark - override
+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{@"catchCopy": @"catch",
             @"detail": @"description",
             @"endedAt": @"ended_at",
             @"eventId": @"event_id",
             @"eventUrl": @"event_url",
             @"ownerNickname": @"owner_nickname",
             @"startedAt": @"started_at",
            };
}

@end
