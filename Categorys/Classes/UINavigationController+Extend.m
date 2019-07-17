//
//  UINavigationController+Extend.m
//  Categorys
//
//  Created by steve on 2019/7/17.
//

#import "UINavigationController+Extend.h"

@implementation UINavigationController (Extend)

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated completion:(void (^ __nullable)(BOOL isCancelled))completion {
    [self pushViewController:viewController animated:animated];
    [self navigationAction:animated completion:completion];
}

- (nullable UIViewController *)popViewControllerAnimated:(BOOL)animated completion:(void (^ __nullable)(BOOL isCancelled))completion {
    UIViewController *poppedController = [self popViewControllerAnimated:animated];
    [self navigationAction:animated completion:completion];
    return poppedController;
}

- (nullable NSArray<__kindof UIViewController *> *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated completion:(void (^ __nullable)(BOOL isCancelled))completion {
    NSArray<__kindof UIViewController *> *poppedControllers = [self popToViewController:viewController animated:animated];
    [self navigationAction:animated completion:completion];
    return poppedControllers;
}

- (nullable NSArray<__kindof UIViewController *> *)popToRootViewControllerAnimated:(BOOL)animated completion:(void (^ __nullable)(BOOL isCancelled))completion {
    NSArray<__kindof UIViewController *> *poppedControllers = [self.navigationController popToRootViewControllerAnimated:animated];
    [self navigationAction:animated completion:completion];
    return poppedControllers;
}

- (void)navigationAction: (BOOL)animated completion:(void (^ __nullable)(BOOL isCancelled))completion {
    if (animated) {
        [self.transitionCoordinator
         animateAlongsideTransition:nil
         completion:^(id<UIViewControllerTransitionCoordinatorContext> context)
         {
             completion ? completion(![context isCancelled]) : nil;
         }];
    } else {
        completion ? completion(YES) : nil;
    }
}

//[CATransaction begin];
//[CATransaction setCompletionBlock:completion];
//[self pushViewController:viewController animated:animated];
//[CATransaction commit];

@end
