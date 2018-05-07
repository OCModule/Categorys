//
//  CSButton.m
//  Categorys_Example
//
//  Created by steve on 04/05/2018.
//  Copyright © 2018 wangchengqvan@gmail.com. All rights reserved.
//

#import "CSButton.h"
#import <Categorys/UIResponder+Router.h>

@implementation CSButton

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self routerEventWithName:@"button" userInfo:@{@"button": @"hello"}];
    }
    return self;
}



@end
