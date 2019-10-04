//
//  Singleton.m
//  Categorys_Example
//
//  Created by steve on 2019/10/4.
//  Copyright © 2019 wangchengqvan@gmail.com. All rights reserved.
//

#import "CSSingleton.h"

@implementation CSSingleton

+ (instancetype)shared
{
    static __weak CSSingleton *instance;
    CSSingleton *strongInstance = instance;
    @synchronized(self) {
        if (strongInstance == nil) {
            strongInstance = [[[self class] alloc] init];
            instance = strongInstance;
        }
    }
    return strongInstance;
}


@end
