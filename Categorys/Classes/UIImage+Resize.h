// UIImage+Resize.h
// Created by Trevor Harmon on 8/5/09.
// Free for personal or commercial use, with or without modification.
// No warranty is expressed or implied.

// Extends the UIImage class to support resizing/cropping

typedef NS_ENUM(NSUInteger, IMGPriorityStyle) {
    IMGPriorityDefault,
    IMGPriorityTopBottom,
    IMGPriorityBottomTop,
    IMGPriorityLeftRight,
    IMGPriorityRightLeft,
};

@interface UIImage (Resize)

// Resize any image by size quality
- (UIImage *)resized:(CGSize)newSize;
//UIViewContentModeScaleAspectFill,
//UIViewContentModeBottom// contents scaled to fill with fixed aspect. some portion of content may be clipped.
- (UIImage *)resized:(CGSize)newSize priority: (IMGPriorityStyle)priorityStyle;

- (UIImage *)resized:(CGSize)newSize
     interpolationQuality:(CGInterpolationQuality)quality;
// 裁剪图片
- (UIImage *)croppedImage:(CGRect)bounds;

// 压缩图片 有损压缩
- (UIImage *)thumbnailImage:(NSInteger)thumbnailSize
          transparentBorder:(NSUInteger)borderSize
               cornerRadius:(NSUInteger)cornerRadius
       interpolationQuality:(CGInterpolationQuality)quality;

- (UIImage *)resizedImage:(CGSize)newSize
     interpolationQuality:(CGInterpolationQuality)quality;

- (UIImage *)resizedImageWithContentMode:(UIViewContentMode)contentMode
                                  bounds:(CGSize)bounds
                    interpolationQuality:(CGInterpolationQuality)quality;

- (UIImage *_Nullable)imageScaledBySize:(CGSize)newSize;
@end
