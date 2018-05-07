//
//  CSVeiw.m
//  Categorys_Example
//
//  Created by steve on 04/05/2018.
//  Copyright © 2018 wangchengqvan@gmail.com. All rights reserved.
//

#import "CSVeiw.h"
#import <Categorys/UIResponder+Router.h>
#import "CSButton.h"

@implementation CSVeiw

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)init {
    self = [super init];
    if (self) {
        CSButton *btn = [[CSButton alloc] init];
        [self addSubview:btn];
//        [self routerEventWithName:@"csview" userInfo:@{@"csview": @"hello"}];
    }
    return self;
}

- (void)routerEventWithName:(NSString *)aName userInfo:(NSDictionary *)userInfo {
    NSLog(@"ლ(′◉❥◉｀ლ)%@", userInfo[@"button"]);
}
@end
