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

@end
