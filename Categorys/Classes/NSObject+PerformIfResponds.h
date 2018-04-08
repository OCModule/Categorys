//
//  NSObject+PerformIfResponds.h
//  Categorys
//
//  Created by steve on 07/04/2018.
//

#import <Foundation/Foundation.h>

@interface NSObject (PerformIfResponds)

- (id)performIfResponds:(SEL)aSelector;

- (id)performIfResponds:(SEL)aSelector withObject:(id)object;

- (id)performIfResponds:(SEL)aSelector withObject:(id)object1 withObject:(id)object2;

+ (void)performIfResponds:(id)target
                      selector:(SEL)selector
                        object:(id)arg1
                        object:(id)arg2;

+ (id)performIfResponds:(id)target
               selector:(SEL)aSelector
                 object:(id)arg1
                 object:(id)arg2
                 object:(id)arg3;
@end
