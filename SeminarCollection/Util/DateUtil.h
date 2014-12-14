//
//  DateUtil.h
//  SeminarCollection
//
//  Created by Takahiro Nishinobu on 2014/07/16.
//  Copyright (c) 2014年 Takahiro Nishinobu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateUtil : NSObject

//+ (NSDate *)parseISO8601Date:(NSString *)dateString;
+ (NSDate *)parseISO8601Date:(NSString *)dateString iso0860Format:(NSString *)format;
+ (NSString *)formatDate:(NSDate *)date formatString:(NSString *)format;

@end
