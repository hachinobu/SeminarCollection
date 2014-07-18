//
//  SeminarAPIManager.h
//  SeminarCollection
//
//  Created by Takahiro Nishinobu on 2014/07/16.
//  Copyright (c) 2014年 Takahiro Nishinobu. All rights reserved.
//

#import "MTLModel.h"

typedef NS_ENUM(NSUInteger, SeminarType) {
    SeminarTypeAll,
    SeminarTypeZusaar,
    SeminarTypeConnpass,
    SeminarTypeAtnd,
};

@interface SeminarAPIManager : MTLModel

@property (nonatomic, readonly) NSMutableArray *seminars;

+ (instancetype)sharedManager;

- (void)loadAllSeminars;
- (void)reloadSeminarsWithType:(SeminarType)type withBlock:(void (^)(NSError *))block;

@end
