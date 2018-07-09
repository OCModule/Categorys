//
//  NSObject+PerformIfResponds.h
//  Categorys
//
//  Created by steve on 07/04/2018.
//

#import <Foundation/Foundation.h>

@interface NSObject (PerformIfResponds)

- (id)performIfResponds:(SEL)aSelector;

- (id)performSelector:(SEL)selector
          withObjects: (NSArray<id> *)objects;

@end
