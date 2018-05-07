//
//  UIResponder+Router.h
//  Categorys
//
//  Created by steve on 04/05/2018.
//

#import <UIKit/UIKit.h>

@interface UIResponder (Router)

- (void)routerEventWithName:(NSString *)aName userInfo: (NSDictionary *)userInfo;

@end
