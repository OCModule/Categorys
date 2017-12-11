//
//  NSObject+Observer.m
//  Categorys
//
//  Created by Steve on 10/12/2017.
//

#import "NSObject+Observer.h"
#import <objc/message.h>

@interface CSObserverHelper : NSObject
@property (nonatomic, unsafe_unretained) id target;
@property (nonatomic, unsafe_unretained) id observer;
@property (nonatomic, strong) NSString *keyPath;
@property (nonatomic, weak) CSObserverHelper *factor;
@end

@implementation CSObserverHelper

- (void)dealloc {
    if ( _factor ) {
        [_target removeObserver:_observer forKeyPath:_keyPath];
    }
}

@end


@implementation NSObject (Observer)

- (void)cs_addObserver:(nonnull NSObject *)observer forKeyPath:(nonnull NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context {
    [self addObserver:observer forKeyPath:keyPath options:options context:context];
    CSObserverHelper *helper = [CSObserverHelper new];
    CSObserverHelper *sub = [CSObserverHelper new];
    sub.target = helper.target = self;
    sub.observer = helper.observer = observer;
    sub.keyPath = helper.keyPath = keyPath;
    helper.factor = sub;
    sub.factor = helper;
    const char *helpeKey = [NSString stringWithFormat:@"%zd", [observer hash]].UTF8String;
    objc_setAssociatedObject(self, helpeKey, helper, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(observer, helpeKey, sub, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
