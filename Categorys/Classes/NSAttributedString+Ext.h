//
//  NSAttributedString+Ext.h
//  Categorys
//
//  Created by Steve on 2020/5/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSAttributedString (Ext)
/// 返回自动换行后最后一行的 rect
- (CGRect)lastLineRectSpecifiedWidth:(CGFloat)width;

@end

NS_ASSUME_NONNULL_END
