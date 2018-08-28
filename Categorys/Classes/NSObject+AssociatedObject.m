//
//  NSObject+AssociatedObject.m
//  Categorys
//
//  Created by steve on 29/08/2018.
//

#import "NSObject+AssociatedObject.h"
#import <objc/runtime.h>

typedef SEL (^DeallocBlock)(void);

static NSString *DEALLOC_BLOCK_KEY = @"DEALLOC_BLOCK_KEY";

@interface NSObject()

@property (nonatomic, copy) DeallocBlock deallocBlock;

@end

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
    [weakObject setDeallocBlock:^SEL {
        objc_setAssociatedObject(self, key, nil, OBJC_ASSOCIATION_ASSIGN);
        return key;
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

- (void)setDeallocBlock:(DeallocBlock)deallocBlock {
    objc_setAssociatedObject(self, &DEALLOC_BLOCK_KEY, deallocBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (DeallocBlock)deallocBlock {
    return objc_getAssociatedObject(self, &DEALLOC_BLOCK_KEY);
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"
- (void)dealloc {
    if (self.deallocBlock) {
        SEL key = self.deallocBlock();
        objc_setAssociatedObject(self, key, nil, OBJC_ASSOCIATION_ASSIGN);
    }
}
#pragma clang diagnostic pop

@end
