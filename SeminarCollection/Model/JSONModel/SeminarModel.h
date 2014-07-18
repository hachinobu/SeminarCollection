//
//  SeminarModel.h
//  SeminarCollection
//
//  Created by Takahiro Nishinobu on 2014/07/16.
//  Copyright (c) 2014年 Takahiro Nishinobu. All rights reserved.
//

#import "MTLModel.h"
#import "Mantle.h"

@interface SeminarModel : MTLModel <MTLJSONSerializing, MTLManagedObjectSerializing>

@property (nonatomic) NSUInteger accepted;
@property (nonatomic, copy) NSString *address;
@property (nonatomic, copy) NSString *catchCopy;
@property (nonatomic, copy) NSString *detail;
@property (nonatomic, strong) NSDate *endedAt;
@property (nonatomic, copy) NSString *eventId;
@property (nonatomic, copy) NSString *eventUrl;
@property (nonatomic) CGFloat lat;
@property (nonatomic) NSUInteger limit;
@property (nonatomic) CGFloat lon;
@property (nonatomic, copy) NSString *ownerNickname;
@property (nonatomic, copy) NSString *ownerTwitterId;
@property (nonatomic, copy) NSString *place;
@property (nonatomic, copy) NSString *site;
@property (nonatomic, strong) NSDate *startedAt;
@property (nonatomic, copy) NSString *title;
@property (nonatomic) NSUInteger waiting;

@end
