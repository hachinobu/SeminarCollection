//
//  SeminarAPIManager.m
//  SeminarCollection
//
//  Created by Takahiro Nishinobu on 2014/07/16.
//  Copyright (c) 2014年 Takahiro Nishinobu. All rights reserved.
//

#import "SeminarAPIManager.h"
#import "Seminar.h"
#import "SeminarModel.h"
#import "ZusaarModel.h"
#import "ConnpassModel.h"
#import "AtndModel.h"
#import "SeminarAPIClient.h"
#import "ZusaarAPIClient.h"
#import "ConnpassAPIClient.h"
#import "AtndApiClient.h"

@interface SeminarAPIManager ()

@property (nonatomic, strong) ZusaarAPIClient *zusaarAPIClient;
@property (nonatomic, strong) ConnpassAPIClient *connpassAPIClient;
@property (nonatomic, strong) AtndApiClient *atndAPIClient;
@property (nonatomic) NSMutableArray *seminars;

@end

@implementation SeminarAPIManager

+ (instancetype)sharedManager
{
    static SeminarAPIManager *_sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[SeminarAPIManager alloc] init];
    });
    
    return _sharedManager;
}

- (id)init
{
    self = [super init];
    if (self) {
        self.zusaarAPIClient = [ZusaarAPIClient sharedClient];
        self.connpassAPIClient = [ConnpassAPIClient sharedClient];
        self.atndAPIClient = [AtndApiClient sharedClient];
        self.seminars = [NSMutableArray array];
    }
    
    return self;
}

- (void)loadAllSeminars
{
    NSArray *seminarEntities = [Seminar MR_findAllSortedBy:@"startedAt,endedAt" ascending:YES];
    if (seminarEntities.count > 0) {
        [[self mutableArrayValueForKey:@"seminars"]
         replaceObjectsInRange:NSMakeRange(0, [self.seminars count]) withObjectsFromArray:seminarEntities];
    }
}

- (void)reloadSeminarsWithType:(SeminarType)type withBlock:(void (^)(NSError *))block
{
    __weak typeof(self) weakSelf = self;
    
    [self loadSeminarsWithCompletion:^(NSArray *seminars, NSError *error) {
       
        if ([seminars count] > 0) {
            
            [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
                
                [seminars enumerateObjectsUsingBlock:^(SeminarModel *seminar, NSUInteger idx, BOOL *stop) {
                    
                    //同一既存データは削除
                    Seminar *seminarInfo = [Seminar findSeminarWithEventId:seminar.eventId andSite:seminar.site inContext:localContext];
                    [seminarInfo MR_deleteInContext:localContext];
                    [MTLManagedObjectAdapter managedObjectFromModel:seminar insertingIntoContext:localContext error:nil];
                    
                }];
                
                
            } completion:^(BOOL success, NSError *error) {
                if (success) {
                    // 保存した情報を取得
                    NSArray *seminarEntities = [Seminar MR_findAllSortedBy:@"startedAt,endedAt" ascending:YES];
                    
                    [[weakSelf mutableArrayValueForKey:@"seminars"]
                     replaceObjectsInRange:NSMakeRange(0, [self.seminars count]) withObjectsFromArray:seminarEntities];
                    
                }
                
                if (block) {
                    block(error);
                }
            }];
        } else {
            
            if (block) {
                block(error);
            }
        }
    }];
}

- (void)loadSeminarsWithType:(SeminarType)type withCompletion:(void (^)(NSArray *results, NSError *error))block
{
    switch (type) {
        case SeminarTypeAll:
            
            break;
            
        case SeminarTypeZusaar:
            
            break;
            
        case SeminarTypeConnpass:
            
            break;
            
        case SeminarTypeAtnd:
            
            break;
            
        default:
            break;
    }
}

- (void)loadSeminarsWithCompletion:(void (^)(NSArray *results, NSError *error))block
{
    __weak typeof(self) weakSelf = self;
    [self.zusaarAPIClient getSeminars:nil withCompletion:^(NSDictionary *results, NSError *error) {
        
        NSArray *seminars = nil;
        if (results && [results isKindOfClass:[NSDictionary class]]) {
            NSArray *seminarsJSON = results[@"event"];
            seminars = [weakSelf parseSeminars:seminarsJSON withSeminarType:SeminarTypeZusaar];
        }
        
        if (block) {
            block(seminars, error);
        }
        
    }];
}

- (void)loadZussarSeminarWithCompletion:(void (^)(NSArray *results, NSError *error))block
{
    __weak typeof(self) weakSelf = self;
    [self.zusaarAPIClient getSeminars:nil withCompletion:^(NSDictionary *results, NSError *error) {
        
        NSArray *seminars = nil;
        if (results && [results isKindOfClass:[NSDictionary class]]) {
            NSArray *seminarsJSON = results[@"event"];
            seminars = [weakSelf parseSeminars:seminarsJSON withSeminarType:SeminarTypeZusaar];
        }
        
        if (block) {
            block(seminars, error);
        }
        
    }];
}

- (SeminarModel *)parseSeminar:(NSDictionary *)seminarDic withModel:(id)modelClass andSite:(NSString *)site
{
    SeminarModel *seminarModel = [MTLJSONAdapter modelOfClass:modelClass fromJSONDictionary:seminarDic error:nil];
    seminarModel.site = site;
    
    return seminarModel;
}

- (SeminarModel *)parseSeminar:(NSDictionary *)jsonDic withType:(SeminarType)type
{
    switch (type) {
        case SeminarTypeZusaar:
            return [self parseSeminar:jsonDic withModel:[ZusaarModel class] andSite:@"Zusaar"];
            break;
            
        case SeminarTypeConnpass:
            return [self parseSeminar:jsonDic withModel:[ConnpassModel class] andSite:@"Connpass"];
            break;
            
        case SeminarTypeAtnd:
            return [self parseSeminar:jsonDic withModel:[AtndModel class] andSite:@"Atnd"];
            break;
            
        default:
            break;
    }
    
    return nil;
}

- (NSArray *)parseSeminars:(NSArray *)seminars withSeminarType:(SeminarType)type
{
    NSMutableArray *mutableSeminars = [NSMutableArray array];
    
    [seminars enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        SeminarModel *seminar = [self parseSeminar:obj withType:type];
        [mutableSeminars addObject:seminar];
        
    }];
    
    return [mutableSeminars copy];
}

@end
