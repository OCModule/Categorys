//
//  NSObject+HRNSwizzling.m
//  ComicRN
//
//  Created by Steve on 2018/11/20.
//

#import "NSObject+HRNSwizzling.h"
#import <objc/runtime.h>

@implementation NSObject (HRNSwizzling)

/**
 *  @brief  交换实例方法的实现
 *
 *  @param cls         类
 *  @param oldSelector
 *  @param newSelector
 */
+ (void)instanceSwizzle:(Class)cls oldSelector:(SEL)oldSelector newSelector:(SEL)newSelector {
    Method oldMethod = class_getInstanceMethod(cls, oldSelector);
    Method newMethod = class_getInstanceMethod(cls, newSelector);
    
    if (class_addMethod(cls, oldSelector, method_getImplementation(newMethod), method_getTypeEncoding(newMethod))) {
        class_replaceMethod(cls, newSelector, method_getImplementation(oldMethod), method_getTypeEncoding(oldMethod));
    } else {
        method_exchangeImplementations(oldMethod, newMethod);
    }
}

/**
 *  @brief  交换类方法的实现
 *
 *  @param cls         类
 *  @param oldSelector
 *  @param newSelector
 */
+ (void)classSwizzle:(Class)cls oldSelector:(SEL)oldSelector newSelector:(SEL)newSelector {
    cls = object_getClass(cls);
    [NSObject instanceSwizzle:cls oldSelector:oldSelector newSelector:newSelector];
}

- (void)instanceSwizzle:(SEL)oldSelector newSelector:(SEL)newSElector {
    [NSObject instanceSwizzle:[self class] oldSelector:oldSelector newSelector:newSElector];
}

- (void)classSwizzle:(SEL)oldSelector newSelector:(SEL)newSelector {
    [NSObject classSwizzle:[self class] oldSelector:oldSelector newSelector:newSelector];
}

@end
