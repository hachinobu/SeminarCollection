#import "_Seminar.h"

@interface Seminar : _Seminar {}
// Custom logic goes here.

//イベントIDとサイトの組み合わせで一意のセミナー情報を取得する
+ (Seminar *)findSeminarWithEventId:(NSString *)eventId andSite:(NSString *)site inContext:(NSManagedObjectContext *)context;
@end
