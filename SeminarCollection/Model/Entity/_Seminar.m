// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Seminar.m instead.

#import "_Seminar.h"

const struct SeminarAttributes SeminarAttributes = {
	.accepted = @"accepted",
	.address = @"address",
	.catchCopy = @"catchCopy",
	.detail = @"detail",
	.endedAt = @"endedAt",
	.eventId = @"eventId",
	.eventUrl = @"eventUrl",
	.lat = @"lat",
	.limit = @"limit",
	.lon = @"lon",
	.ownerNickname = @"ownerNickname",
	.ownerTwitterId = @"ownerTwitterId",
	.place = @"place",
	.site = @"site",
	.startedAt = @"startedAt",
	.title = @"title",
	.waiting = @"waiting",
};

const struct SeminarRelationships SeminarRelationships = {
};

const struct SeminarFetchedProperties SeminarFetchedProperties = {
};

@implementation SeminarID
@end

@implementation _Seminar

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Seminar" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Seminar";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Seminar" inManagedObjectContext:moc_];
}

- (SeminarID*)objectID {
	return (SeminarID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"acceptedValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"accepted"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"latValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"lat"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"limitValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"limit"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"lonValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"lon"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"waitingValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"waiting"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic accepted;



- (int16_t)acceptedValue {
	NSNumber *result = [self accepted];
	return [result shortValue];
}

- (void)setAcceptedValue:(int16_t)value_ {
	[self setAccepted:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveAcceptedValue {
	NSNumber *result = [self primitiveAccepted];
	return [result shortValue];
}

- (void)setPrimitiveAcceptedValue:(int16_t)value_ {
	[self setPrimitiveAccepted:[NSNumber numberWithShort:value_]];
}





@dynamic address;






@dynamic catchCopy;






@dynamic detail;






@dynamic endedAt;






@dynamic eventId;






@dynamic eventUrl;






@dynamic lat;



- (float)latValue {
	NSNumber *result = [self lat];
	return [result floatValue];
}

- (void)setLatValue:(float)value_ {
	[self setLat:[NSNumber numberWithFloat:value_]];
}

- (float)primitiveLatValue {
	NSNumber *result = [self primitiveLat];
	return [result floatValue];
}

- (void)setPrimitiveLatValue:(float)value_ {
	[self setPrimitiveLat:[NSNumber numberWithFloat:value_]];
}





@dynamic limit;



- (int16_t)limitValue {
	NSNumber *result = [self limit];
	return [result shortValue];
}

- (void)setLimitValue:(int16_t)value_ {
	[self setLimit:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveLimitValue {
	NSNumber *result = [self primitiveLimit];
	return [result shortValue];
}

- (void)setPrimitiveLimitValue:(int16_t)value_ {
	[self setPrimitiveLimit:[NSNumber numberWithShort:value_]];
}





@dynamic lon;



- (float)lonValue {
	NSNumber *result = [self lon];
	return [result floatValue];
}

- (void)setLonValue:(float)value_ {
	[self setLon:[NSNumber numberWithFloat:value_]];
}

- (float)primitiveLonValue {
	NSNumber *result = [self primitiveLon];
	return [result floatValue];
}

- (void)setPrimitiveLonValue:(float)value_ {
	[self setPrimitiveLon:[NSNumber numberWithFloat:value_]];
}





@dynamic ownerNickname;






@dynamic ownerTwitterId;






@dynamic place;






@dynamic site;






@dynamic startedAt;






@dynamic title;






@dynamic waiting;



- (int16_t)waitingValue {
	NSNumber *result = [self waiting];
	return [result shortValue];
}

- (void)setWaitingValue:(int16_t)value_ {
	[self setWaiting:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveWaitingValue {
	NSNumber *result = [self primitiveWaiting];
	return [result shortValue];
}

- (void)setPrimitiveWaitingValue:(int16_t)value_ {
	[self setPrimitiveWaiting:[NSNumber numberWithShort:value_]];
}










@end
