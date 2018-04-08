//
//  NSObject+PerformIfResponds.m
//  Categorys
//
//  Created by steve on 07/04/2018.
//

#import "NSObject+PerformIfResponds.h"

@implementation NSObject (PerformIfResponds)

- (id)performIfResponds:(SEL)aSelector {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    if ([self respondsToSelector:aSelector]) {
       return [self performSelector:aSelector];
    }
#pragma clang diagnostic pop
    return nil;
}

- (id)performIfResponds:(SEL)aSelector withObject:(id)object{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    if ([self respondsToSelector:aSelector]) {
        return [self performSelector:aSelector withObject:object];
    }
#pragma clang diagnostic pop
    return nil;
}

- (id)performIfResponds:(SEL)aSelector withObject:(id)object1 withObject:(id)object2{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    if ([self respondsToSelector:aSelector]) {
        return [self performSelector:aSelector withObject:object1 withObject:object2];
    }
#pragma clang diagnostic pop
    return nil;
}

+ (void)performIfResponds:(id)target selector:(SEL)selector object:(id)arg1 object:(id)arg2 {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    if ([target respondsToSelector:selector])
    {
        [target performSelector:selector withObject:arg1 withObject:arg2];
    }
#pragma clang diagnostic pop
}

+ (id)performIfResponds:(id)target selector:(SEL)aSelector object:(id)arg1 object:(id)arg2 object:(id)arg3 {
    if (![target respondsToSelector:aSelector]) {
        return nil;
    }
    NSMethodSignature *sig = [target methodSignatureForSelector:aSelector];
    if (sig) {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:sig];
        [invocation setTarget:target];
        [invocation setSelector:aSelector];
        [invocation setArgument:&arg1 atIndex:2];
        [invocation setArgument:&arg2 atIndex:3];
        [invocation setArgument:&arg3 atIndex:4];
        [invocation invoke];
        if (sig.methodReturnLength) {
            id ret;
            [invocation getReturnValue:&ret];
            return ret;
        } else {
            return nil;
        }
    } else {
        return nil;
    }
    return nil;
}

@end
