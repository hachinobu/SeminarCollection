//
//  DateUtil.m
//  SeminarCollection
//
//  Created by Takahiro Nishinobu on 2014/07/16.
//  Copyright (c) 2014年 Takahiro Nishinobu. All rights reserved.
//

#import "DateUtil.h"

@implementation DateUtil

+ (NSDate *)parseISO8601Date:(NSString *)dateString iso0860Format:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    formatter.dateFormat = format;
    NSDate *date = [formatter dateFromString:dateString];
    return date;
}

+ (NSString *)formatDate:(NSDate *)date formatString:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    formatter.dateFormat = format;
    NSString *dateString = [formatter stringFromDate:date];
    
    return dateString;
}

@end
