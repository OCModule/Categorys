//
//  UIViewController+hook2.m
//  Categorys_Example
//
//  Created by Steve on 2019/5/25.
//  Copyright © 2019 wangchengqvan@gmail.com. All rights reserved.
//

#import "UIViewController+hook2.h"
#import <Categorys/NSObject+HRNSwizzling.h>

@implementation UIViewController (hook2)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL sel = NSSelectorFromString(@"viewDidAppear:");
        SEL newSel = NSSelectorFromString(@"hrn2_viewDidAppear:");
        [self instanceSwizzle:sel
                  newSelector:newSel];
    });
}

- (void)hrn2_viewDidAppear:(BOOL)animated {
    [self hrn2_viewDidAppear: animated];
}

@end
