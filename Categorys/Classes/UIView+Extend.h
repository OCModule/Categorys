//
//  UIView+Extend.h
//  Categorys
//
//  Created by Steve on 2019/8/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Extend)

- (UIImage *)snapshot;

- (CAGradientLayer *)addGradientBorderWithLineWidth: (CGFloat)lineWidth colors: (NSArray<UIColor *> *)colors cornerRadius: (CGFloat)radius;

@end

NS_ASSUME_NONNULL_END
