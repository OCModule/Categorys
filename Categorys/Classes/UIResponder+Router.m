//
//  UIResponder+Router.m
//  Categorys
//
//  Created by steve on 04/05/2018.
//

#import "UIResponder+Router.h"

@implementation UIResponder (Router)

- (void)routerEventWithName:(NSString *)aName userInfo:(NSDictionary *)userInfo {
    if ([self.nextResponder respondsToSelector:@selector(routerEventWithName:userInfo:)]) {
        [self.nextResponder routerEventWithName:aName userInfo:userInfo];
    }
}

@end
