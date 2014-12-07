//
//  AtndModel.m
//  SeminarCollection
//
//  Created by Takahiro Nishinobu on 2014/07/17.
//  Copyright (c) 2014年 Takahiro Nishinobu. All rights reserved.
//

#import "AtndModel.h"

@implementation AtndModel

#pragma mark - override
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"catchCopy": @"catch",
             @"detail": @"description",
             @"endedAt": @"ended_at",
             @"eventId": @"event_id",
             @"eventUrl": @"event_url",
             @"ownerNickname": @"owner_nickname",
             @"startedAt": @"started_at",
             @"ownerTwitterId": @"owner_twitter_id",
            };
}

@end
