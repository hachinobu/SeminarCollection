//
//  SeminarModel.m
//  SeminarCollection
//
//  Created by Takahiro Nishinobu on 2014/07/16.
//  Copyright (c) 2014年 Takahiro Nishinobu. All rights reserved.
//

#import "SeminarModel.h"
#import "DateUtil.h"

static NSString * const kISO8601Format = @"yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZZ";

@implementation SeminarModel


#pragma mark - MTLJSONSerializing
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{};
}

#pragma mark - MTLManagedObjectSerializing
+ (NSString *)managedObjectEntityName {
    return @"Seminar";
}

+ (NSDictionary *)managedObjectKeysByPropertyKey {
    return @{};
}

#pragma mark - JSONTransformer
+ (NSValueTransformer *)eventIdJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithBlock:^id(id obj) {
        //CommpassのeventIdの型であるNSCFNumberを考慮
        return [NSString stringWithFormat:@"%@", obj];
    }];
}

+ (NSValueTransformer *)startedAtJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSString *str) {
        return [DateUtil parseISO8601Date:str iso0860Format:kISO8601Format];
    } reverseBlock:^(NSDate *date) {
        return [DateUtil formatDate:date formatString:@"MM/dd"];
    }];

}

+ (NSValueTransformer *)endedAtJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSString *str) {
        return [DateUtil parseISO8601Date:str iso0860Format:kISO8601Format];
    } reverseBlock:^(NSDate *date) {
        return [DateUtil formatDate:date formatString:@"MM/dd"];
    }];
}

+ (NSValueTransformer *)latJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithBlock:^id(id obj) {
        if (!obj || obj == [NSNull null]) {
            return @(0.0);
        } else {
            return obj;
        }
    }];
}

+ (NSValueTransformer *)lonJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithBlock:^id(id obj) {
        if (!obj || obj == [NSNull null]) {
            return @(0.0);
        } else {
            return obj;
        }
    }];
}

+ (NSValueTransformer *)limitJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithBlock:^id(id obj) {
        if (!obj || obj == [NSNull null]) {
            return @(0);
        } else {
            return obj;
        }
    }];
}

+ (NSValueTransformer *)waitingJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithBlock:^id(id obj) {
        if (!obj || obj == [NSNull null]) {
            return @(0);
        } else {
            return obj;
        }
    }];
}


@end
