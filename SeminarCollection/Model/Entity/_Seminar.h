// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Seminar.h instead.

#import <CoreData/CoreData.h>


extern const struct SeminarAttributes {
	__unsafe_unretained NSString *accepted;
	__unsafe_unretained NSString *address;
	__unsafe_unretained NSString *catchCopy;
	__unsafe_unretained NSString *detail;
	__unsafe_unretained NSString *endedAt;
	__unsafe_unretained NSString *eventId;
	__unsafe_unretained NSString *eventUrl;
	__unsafe_unretained NSString *lat;
	__unsafe_unretained NSString *limit;
	__unsafe_unretained NSString *lon;
	__unsafe_unretained NSString *ownerNickname;
	__unsafe_unretained NSString *ownerTwitterId;
	__unsafe_unretained NSString *place;
	__unsafe_unretained NSString *site;
	__unsafe_unretained NSString *startedAt;
	__unsafe_unretained NSString *title;
	__unsafe_unretained NSString *waiting;
} SeminarAttributes;

extern const struct SeminarRelationships {
} SeminarRelationships;

extern const struct SeminarFetchedProperties {
} SeminarFetchedProperties;




















@interface SeminarID : NSManagedObjectID {}
@end

@interface _Seminar : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (SeminarID*)objectID;





@property (nonatomic, strong) NSNumber* accepted;



@property int16_t acceptedValue;
- (int16_t)acceptedValue;
- (void)setAcceptedValue:(int16_t)value_;

//- (BOOL)validateAccepted:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* address;



//- (BOOL)validateAddress:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* catchCopy;



//- (BOOL)validateCatchCopy:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* detail;



//- (BOOL)validateDetail:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* endedAt;



//- (BOOL)validateEndedAt:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* eventId;



//- (BOOL)validateEventId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* eventUrl;



//- (BOOL)validateEventUrl:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* lat;



@property float latValue;
- (float)latValue;
- (void)setLatValue:(float)value_;

//- (BOOL)validateLat:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* limit;



@property int16_t limitValue;
- (int16_t)limitValue;
- (void)setLimitValue:(int16_t)value_;

//- (BOOL)validateLimit:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* lon;



@property float lonValue;
- (float)lonValue;
- (void)setLonValue:(float)value_;

//- (BOOL)validateLon:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* ownerNickname;



//- (BOOL)validateOwnerNickname:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* ownerTwitterId;



//- (BOOL)validateOwnerTwitterId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* place;



//- (BOOL)validatePlace:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* site;



//- (BOOL)validateSite:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* startedAt;



//- (BOOL)validateStartedAt:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* title;



//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* waiting;



@property int16_t waitingValue;
- (int16_t)waitingValue;
- (void)setWaitingValue:(int16_t)value_;

//- (BOOL)validateWaiting:(id*)value_ error:(NSError**)error_;






@end

@interface _Seminar (CoreDataGeneratedAccessors)

@end

@interface _Seminar (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveAccepted;
- (void)setPrimitiveAccepted:(NSNumber*)value;

- (int16_t)primitiveAcceptedValue;
- (void)setPrimitiveAcceptedValue:(int16_t)value_;




- (NSString*)primitiveAddress;
- (void)setPrimitiveAddress:(NSString*)value;




- (NSString*)primitiveCatchCopy;
- (void)setPrimitiveCatchCopy:(NSString*)value;




- (NSString*)primitiveDetail;
- (void)setPrimitiveDetail:(NSString*)value;




- (NSDate*)primitiveEndedAt;
- (void)setPrimitiveEndedAt:(NSDate*)value;




- (NSString*)primitiveEventId;
- (void)setPrimitiveEventId:(NSString*)value;




- (NSString*)primitiveEventUrl;
- (void)setPrimitiveEventUrl:(NSString*)value;




- (NSNumber*)primitiveLat;
- (void)setPrimitiveLat:(NSNumber*)value;

- (float)primitiveLatValue;
- (void)setPrimitiveLatValue:(float)value_;




- (NSNumber*)primitiveLimit;
- (void)setPrimitiveLimit:(NSNumber*)value;

- (int16_t)primitiveLimitValue;
- (void)setPrimitiveLimitValue:(int16_t)value_;




- (NSNumber*)primitiveLon;
- (void)setPrimitiveLon:(NSNumber*)value;

- (float)primitiveLonValue;
- (void)setPrimitiveLonValue:(float)value_;




- (NSString*)primitiveOwnerNickname;
- (void)setPrimitiveOwnerNickname:(NSString*)value;




- (NSString*)primitiveOwnerTwitterId;
- (void)setPrimitiveOwnerTwitterId:(NSString*)value;




- (NSString*)primitivePlace;
- (void)setPrimitivePlace:(NSString*)value;




- (NSString*)primitiveSite;
- (void)setPrimitiveSite:(NSString*)value;




- (NSDate*)primitiveStartedAt;
- (void)setPrimitiveStartedAt:(NSDate*)value;




- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;




- (NSNumber*)primitiveWaiting;
- (void)setPrimitiveWaiting:(NSNumber*)value;

- (int16_t)primitiveWaitingValue;
- (void)setPrimitiveWaitingValue:(int16_t)value_;




@end
