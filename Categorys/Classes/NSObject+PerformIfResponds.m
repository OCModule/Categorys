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
            withObjects:(id)arg1, ... NS_REQUIRES_NIL_TERMINATION {
    if (![self respondsToSelector:selector]) {
        return nil;
    }
    NSMethodSignature *signature = [self methodSignatureForSelector:selector];
    if (signature) {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
        [invocation setTarget:self];
        [invocation setSelector:selector];
        NSMutableArray *aux = [NSMutableArray arrayWithObjects:arg1, nil];
        va_list list;
        va_start(list, arg1);
        while (YES) {
            id val = va_arg(list, id);
            if (!val) {
                break;
            }
            [aux addObject:val];
        }
        va_end(list);
        NSArray *objects = [aux copy];
        for (NSInteger i=0; i < objects.count; i++) {
            id obj = objects[i];
            [invocation setArgument:&obj atIndex:i + 2];
        }
        [invocation invoke];
        if (signature.methodReturnLength) {
            id anObject;
            [invocation getReturnValue:&anObject];
            return anObject;
        } else {
            return nil;
        }
    } else {
        return nil;
    }
}

@end
