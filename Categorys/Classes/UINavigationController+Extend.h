//
//  UINavigationController+Extend.h
//  Categorys
//
//  Created by steve on 2019/7/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationController (Extend)

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated completion:(void (^ __nullable)(BOOL isCancelled))completion;

- (nullable UIViewController *)popViewControllerAnimated:(BOOL)animated completion:(void (^ __nullable)(BOOL isCancelled))completion; // Returns the popped controller.
- (nullable NSArray<__kindof UIViewController *> *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated completion:(void (^ __nullable)(BOOL isCancelled))completion; // Pops view controllers until the one specified is on top. Returns the popped controllers.
- (nullable NSArray<__kindof UIViewController *> *)popToRootViewControllerAnimated:(BOOL)animated completion:(void (^ __nullable)(BOOL isCancelled))completion; // Pops until there's only a single view controller left on the stack. Returns the popped controllers.

@end

NS_ASSUME_NONNULL_END
