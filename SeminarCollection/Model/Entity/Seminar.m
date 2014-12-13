#import "Seminar.h"
#import "DateUtil.h"

@interface Seminar ()

// Private interface goes here.

@end


@implementation Seminar

// Custom logic goes here.
#pragma mark - Query
+ (Seminar *)findSeminarWithEventId:(NSString *)eventId andSite:(NSString *)site inContext:(NSManagedObjectContext *)context {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K == %@ and %K == %@", @"eventId", eventId, @"site", site];
    return [self MR_findFirstWithPredicate:predicate inContext:context];
}

#pragma mark - Custom
- (NSString *)startDateString {
    return [self commonDateString:self.startedAt];
}

- (NSString *)endDateString {
    return [self commonDateString:self.endedAt];
}

- (NSString *)schedule {
    if ([self.startDateString isEqualToString:@"開催日未定"]) {
        return @"開催日未定";
    }
    
    return [NSString stringWithFormat:@"%@ - %@", [self startDateString], [self endDateString]];
}

- (NSString *)numberStatus {
    return [NSString stringWithFormat:@"参加希望者 %@/%@ 人  補欠者 %@人", self.accepted, self.limit, self.waiting];
}

- (NSString *)placeInfo {
    return [NSString stringWithFormat:@"%@\n%@", self.address, self.place];
}

#pragma mark - private
- (NSString *)commonDateString:(NSDate *)date {
    NSString *dateString = [DateUtil formatDate:self.startedAt formatString:@"yyyy年MM月dd日 HH:mm"];
    if (!dateString) {
        return @"開催日未定";
    }
    return dateString;
}

@end
