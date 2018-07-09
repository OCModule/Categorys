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

- (id)performSelector:(SEL)selector
            withObjects: (NSArray<id> *)objects {
    if (![self respondsToSelector:selector]) {
        return nil;
    }
    NSMethodSignature *signature = [self methodSignatureForSelector:selector];
    if (signature) {
        NSInvocation *invo = [NSInvocation invocationWithMethodSignature:signature];
        [invo setTarget:self];
        [invo setSelector:selector];
        for (NSInteger i=0; i < objects.count; i++) {
            id obj = objects[i];
            [invo setArgument:&obj atIndex:i + 2];
        }
        [invo invoke];
        if (signature.methodReturnLength) {
            id anObject;
            [invo getReturnValue:&anObject];
            return anObject;
        } else {
            return nil;
        }
    } else {
        return nil;
    }
}

@end
