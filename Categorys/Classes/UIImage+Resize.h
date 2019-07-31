//
//  UIImage+Resize.h
//  Categorys
//
//  Created by Steve on 2019/7/30.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Resize)

+ (UIImage*)imageWithImage:(UIImage*)sourceImage scaledToSizeWithSameAspectRatio:(CGSize)targetSize;

@end

NS_ASSUME_NONNULL_END
