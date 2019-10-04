//
//  UIView+IBDesignable.m
//  Pods
//
//  Created by Steve on 11/12/2017.
//

#import "UIView+IBDesignable.h"
#import "NSObject+AssociatedObject.h"
#import <objc/runtime.h>

@implementation UIView (IBDesignable)

- (void)setCornerRadius:(CGFloat)cornerRadius {
    [self setRetainObject:@(cornerRadius) withKey:@selector(setCornerRadius:)];
    self.layer.cornerRadius = cornerRadius;
}

- (CGFloat)cornerRadius {
    return [[self object:@selector(setCornerRadius:)] floatValue];
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    [self setRetainObject:@(borderWidth) withKey:@selector(setBorderWidth:)];
    self.layer.borderWidth = borderWidth;
}

- (CGFloat)borderWidth {
    return [[self object:@selector(setBorderWidth:)] floatValue];
}

- (void)setBorderColor:(UIColor *)borderColor {
    [self setRetainObject:borderColor withKey:@selector(setBorderColor:)];
    self.layer.borderColor = borderColor.CGColor;
}

- (UIColor *)borderColor {
    return [self object:@selector(setBorderColor:)];
}

- (void)setMaskToBounds:(BOOL)maskToBounds {
    [self setRetainObject:@(maskToBounds) withKey:@selector(setMaskToBounds:)];
    self.layer.masksToBounds = maskToBounds;
}

- (BOOL)maskToBounds {
    return [[self object:@selector(setMaskToBounds:)] boolValue];
}


@end
