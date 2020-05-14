//
//  NSAttributedString+Ext.m
//  Categorys
//
//  Created by Steve on 2020/5/14.
//

#import "NSAttributedString+Ext.h"

@implementation NSAttributedString (Ext)

- (CGRect)lastLineRectSpecifiedWidth:(CGFloat)width {
    CGSize labelSize = CGSizeMake(width, CGFLOAT_MAX);
    NSLayoutManager *layoutManager = [[NSLayoutManager alloc] init];
    NSTextContainer *textContainer = [[NSTextContainer alloc] initWithSize:labelSize];
    NSTextStorage *textStorage = [[NSTextStorage alloc] initWithAttributedString:self];
    [layoutManager addTextContainer:textContainer];
    [textStorage addLayoutManager:layoutManager];
    textContainer.lineFragmentPadding = 0;
    textContainer.lineBreakMode = NSLineBreakByWordWrapping;
    textContainer.maximumNumberOfLines = 0;
    NSUInteger lastGlyphIndex = [layoutManager glyphIndexForCharacterAtIndex:[self length] - 1];
    return [layoutManager lineFragmentUsedRectForGlyphAtIndex:lastGlyphIndex effectiveRange:nil];
}

@end
