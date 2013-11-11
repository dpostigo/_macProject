#import "NSView+Autolayout.h"

@implementation NSView (Autolayout)

+ (id) newForAutolayoutAndAddToView: (NSView *) view {
    NSView *obj = [self new];
    obj.translatesAutoresizingMaskIntoConstraints = NO;
    [view addSubview: obj];
    return obj;
}
@end
