//
//  UIViewController+hook1.m
//  Categorys_Example
//
//  Created by Steve on 2019/5/25.
//  Copyright © 2019 wangchengqvan@gmail.com. All rights reserved.
//

#import "UIViewController+hook1.h"
#import <Categorys/NSObject+HRNSwizzling.h>

@implementation UIViewController (hook1)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL sel = NSSelectorFromString(@"viewDidAppear:");
        SEL newSel = NSSelectorFromString(@"hrn1_viewDidAppear:");
        [self instanceSwizzle:sel
                  newSelector:newSel];
    });
}

- (void)hrn1_viewDidAppear:(BOOL)animated {
    [self hrn1_viewDidAppear: animated];
}

@end
