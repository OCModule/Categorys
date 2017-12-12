//
//  NSObject+NotNull.m
//  Categorys
//
//  Created by Steve on 11/12/2017.
//

#import "NSObject+NotNull.h"

@implementation NSObject (NotNull)

-(BOOL)isNotNull{
    if(self!=nil && self!=NULL && (NSNull *)self!=[NSNull null]){
        return YES;
    }
    return NO;
}

-(BOOL)isNotEmpty{
    
    if ([self isKindOfClass:[NSArray class]] || [self isKindOfClass:[NSMutableArray class]]) {
        if (((NSArray *)self).count > 0) {
            return YES;
        }
        return NO;
    }
    if ([self isKindOfClass:[NSSet class]] || [self isKindOfClass:[NSMutableSet class]]) {
        if (((NSSet *)self).count > 0) {
            return YES;
        }
        return NO;
    }
    
    if ([self isKindOfClass:[NSDictionary class]] || [self isKindOfClass:[NSMutableDictionary class]]) {
        if ([((NSDictionary *)self) allKeys].count > 0) {
            return YES;
        }
        return NO;
    }
    
    if(self!=nil && self!=NULL && (NSNull *)self!=[NSNull null]){
        return YES;
    }
    if ([self isKindOfClass:[NSString class]]) {
        if (![self isEqual:@""]) {
            return YES;
        }
        return NO;
    }
    return NO;
}

@end
