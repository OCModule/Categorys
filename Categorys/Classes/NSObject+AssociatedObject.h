//
//  NSObject+AssociatedObject.h
//  Categorys
//
//  Created by steve on 29/08/2018.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (AssociatedObject)

- (id)object:(SEL)key;

- (void)setBool: (BOOL)value withKey: (SEL)key;

- (void)setInteger: (NSInteger)value withKey: (SEL)key;

- (void)setRetainNonatomicObject:(id)object withKey:(SEL)key;

- (void)setCopyNonatomicObject:(id)object withKey:(SEL)key;

- (void)setRetainObject:(id)object withKey:(SEL)key;

- (void)setCopyObject:(id)object withKey:(SEL)key;

- (void)setWeakObject:(id)object withKey:(SEL)key;

@end

NS_ASSUME_NONNULL_END
