//
//  UIControl+click.m
//  Categorys
//
//  Created by steve on 09/07/2018.
//

#import "UIControl+click.h"
#import <objc/runtime.h>
#import <objc/message.h>
/*
 防止用户重复点击
 */

@implementation UIControl (click)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL selA = @selector(sendAction:to:forEvent:);
        SEL selB = @selector(newSendAction:to:forEvent:);
        Method methodA = class_getInstanceMethod(self, selA);
        Method methodB = class_getInstanceMethod(self, selB);
        
        BOOL isAdd = class_addMethod(self, selA, method_getImplementation(methodB), method_getTypeEncoding(methodB));
        if (isAdd) {
            class_replaceMethod(self, selB, method_getImplementation(methodA), method_getTypeEncoding(methodA));
        } else {
            method_exchangeImplementations(methodA, methodB);
        }
    });
}

- (NSTimeInterval)timeInterval {
    return [objc_getAssociatedObject(self, _cmd) doubleValue];
}

- (void)setTimeInterval:(NSTimeInterval)timeInterval {
    objc_setAssociatedObject(self, @selector(timeInterval), @(timeInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)isIgnoreEvent {
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setIsIgnoreEvent:(BOOL)isIgnoreEvent {
    objc_setAssociatedObject(self, @selector(isIgnoreEvent), @(isIgnoreEvent), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)resetState {
    [self setIsIgnoreEvent:NO];
}

- (void)newSendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    if (self.isIgnoreEvent) {
        return;
    } else {
        [self performSelector:@selector(resetState) withObject:nil afterDelay:self.timeInterval];
    }
    self.isIgnoreEvent = YES;
    [self newSendAction:action to:target forEvent:event];
}

@end
