//
//  AtndModel.m
//  SeminarCollection
//
//  Created by Takahiro Nishinobu on 2014/07/17.
//  Copyright (c) 2014年 Takahiro Nishinobu. All rights reserved.
//

#import "AtndModel.h"
#import "DateUtil.h"

static NSString * const kISO8601AtndFormat = @"yyyy'-'MM'-'dd'T'HH':'mm':'ss.SSSZZZZ";

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

//Atndのjson日付は[うるう秒]がはいってくるためオーバーライド
+ (NSValueTransformer *)startedAtJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSString *str) {
        return [DateUtil parseISO8601Date:str iso0860Format:kISO8601AtndFormat];
    } reverseBlock:^(NSDate *date) {
        return [DateUtil formatDate:date formatString:@"MM/dd"];
    }];
    
}

+ (NSValueTransformer *)endedAtJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSString *str) {
        return [DateUtil parseISO8601Date:str iso0860Format:kISO8601AtndFormat];
    } reverseBlock:^(NSDate *date) {
        return [DateUtil formatDate:date formatString:@"MM/dd"];
    }];
}

@end
