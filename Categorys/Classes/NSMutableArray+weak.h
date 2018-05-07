//
//  NSMutableArray+weak.h
//  Categorys
//
//  Created by steve on 07/05/2018.
//

#import <Foundation/Foundation.h>

/**
 It's quite ingenius, using a Category to allow the creation of a mutable array
 that does no retain/release by backing it with a CFArray with proper callbacks.
 http://stackoverflow.com/questions/4692161/non-retaining-array-for-delegates
 */
@interface NSMutableArray (weak)

+ (instancetype)mutableArrayUsingWeakReferences;

+ (instancetype)mutableArrayUsingWeakReferencesWithCapacity:(NSUInteger)capacity;

@end

