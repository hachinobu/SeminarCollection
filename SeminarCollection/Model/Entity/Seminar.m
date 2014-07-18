#import "Seminar.h"


@interface Seminar ()

// Private interface goes here.

@end


@implementation Seminar

// Custom logic goes here.
+ (Seminar *)findSeminarWithEventId:(NSString *)eventId andSite:(NSString *)site inContext:(NSManagedObjectContext *)context
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K == %@ and %K == %@", @"eventId", eventId, @"site", site];
    return [self MR_findFirstWithPredicate:predicate inContext:context];
}

@end
