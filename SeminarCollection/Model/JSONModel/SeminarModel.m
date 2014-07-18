//
//  SeminarModel.m
//  SeminarCollection
//
//  Created by Takahiro Nishinobu on 2014/07/16.
//  Copyright (c) 2014年 Takahiro Nishinobu. All rights reserved.
//

#import "SeminarModel.h"
#import "DateUtil.h"

@implementation SeminarModel


#pragma mark - MTLJSONSerializing
+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{};
}

#pragma mark - MTLManagedObjectSerializing
+ (NSString *)managedObjectEntityName
{
    return @"Seminar";
}

+ (NSDictionary *)managedObjectKeysByPropertyKey
{
    return @{};
}

#pragma mark - JSONTransformer
+ (NSValueTransformer *)startedAtJSONTransformer
{
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSString *str) {
        return [DateUtil parseISO8601Date:str];
    } reverseBlock:^(NSDate *date) {
        return [DateUtil formatDate:date formatString:@"MM/dd"];
    }];

}

+ (NSValueTransformer *)endedAtJSONTransformer
{
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSString *str) {
        return [DateUtil parseISO8601Date:str];
    } reverseBlock:^(NSDate *date) {
        return [DateUtil formatDate:date formatString:@"MM/dd"];
    }];
}



@end
