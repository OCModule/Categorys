//
//  NSMutableArray+weak.m
//  Categorys
//
//  Created by steve on 07/05/2018.
//

#import "NSMutableArray+weak.h"

@implementation NSMutableArray (weak)

+ (instancetype)mutableArrayUsingWeakReferences {
    return [self mutableArrayUsingWeakReferencesWithCapacity:0];
}

+ (instancetype)mutableArrayUsingWeakReferencesWithCapacity:(NSUInteger)capacity {
    CFArrayCallBacks callbacks = {0, NULL, NULL, CFCopyDescription, CFEqual};
    // We create a weak reference array
    return CFBridgingRelease(CFArrayCreateMutable(0, capacity, &callbacks));
}

@end
