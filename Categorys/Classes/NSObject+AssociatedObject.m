//
//  NSObject+AssociatedObject.m
//  Categorys
//
//  Created by steve on 29/08/2018.
//

#import "NSObject+AssociatedObject.h"
#import <objc/runtime.h>
#import "NSObject+NSDeallocBlockExecutor.h"

@implementation NSObject (AssociatedObject)

- (id)object:(SEL)key {
    return objc_getAssociatedObject(self, key);
}

- (void)setBool:(BOOL)value withKey:(SEL)key {
    objc_setAssociatedObject(self, key, @(value), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)BoolWithKey: (SEL)key {
    return [objc_getAssociatedObject(self, key) boolValue];
}

- (void)setInteger:(NSInteger)value withKey:(SEL)key {
    objc_setAssociatedObject(self, key, @(value), OBJC_ASSOCIATION_ASSIGN);
}

- (NSInteger)IntegerWithKey: (SEL)key {
    return [objc_getAssociatedObject(self, key) integerValue];
}

- (void)setWeakObject:(id)weakObject withKey:(SEL)key {
    [weakObject ns_createExecutorWithHandlerBlock:^{
        objc_setAssociatedObject(self, key, nil, OBJC_ASSOCIATION_ASSIGN);
    }];
    objc_setAssociatedObject(self, key, weakObject, OBJC_ASSOCIATION_ASSIGN);
}

- (void)setRetainNonatomicObject:(id)object withKey:(SEL)key {
    objc_setAssociatedObject(self, key, object, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setCopyNonatomicObject:(id)object withKey:(SEL)key {
    objc_setAssociatedObject(self, key, object, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)setRetainObject:(id)object withKey:(SEL)key {
    objc_setAssociatedObject(self, key, object, OBJC_ASSOCIATION_RETAIN);
}

- (void)setCopyObject:(id)object withKey:(SEL)key {
    objc_setAssociatedObject(self, key, object, OBJC_ASSOCIATION_COPY);
}


@end
