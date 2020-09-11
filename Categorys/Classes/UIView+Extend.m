//
//  UIView+Extend.m
//  Categorys
//
//  Created by Steve on 2019/8/1.
//

#import "UIView+Extend.h"

@implementation UIView (Extend)

- (UIImage *)snapshot {
    UIScreen *screen = [UIScreen mainScreen];
    CGRect bounds = [self bounds];
    UIGraphicsBeginImageContextWithOptions(bounds.size, false, screen.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetInterpolationQuality(context, kCGInterpolationHigh);
    [self drawViewHierarchyInRect:bounds afterScreenUpdates:YES];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (CAGradientLayer *)addGradientBorderWithLineWidth: (CGFloat)lineWidth colors: (NSArray<UIColor *> *)colors cornerRadius: (CGFloat)radius {
        CAGradientLayer *gradientLayer =  [CAGradientLayer layer];
    gradientLayer.frame = self.bounds;
    NSMutableArray* cgcolors = [NSMutableArray array];
    for (UIColor* color in colors) {
        [cgcolors addObject:(id)color.CGColor];
    }
    gradientLayer.colors = [cgcolors copy];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.lineWidth = lineWidth;
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(radius, radius)];
    maskLayer.path = bezierPath.CGPath;
    maskLayer.fillColor = UIColor.clearColor.CGColor;
    maskLayer.strokeColor = UIColor.blackColor.CGColor;
    gradientLayer.mask = maskLayer;
    [self.layer addSublayer:gradientLayer];
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;
    return gradientLayer;
}

@end
