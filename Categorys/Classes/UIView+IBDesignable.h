//
//  UIView+IBDesignable.h
//  Pods
//
//  Created by Steve on 11/12/2017.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE

@interface UIView (IBDesignable)

@property(nonatomic, assign) IBInspectable CGFloat cornerRadius;
@property(nonatomic, assign) IBInspectable CGFloat borderWidth;
@property(nonatomic, strong) IBInspectable UIColor *borderColor;
@property(nonatomic, assign) IBInspectable BOOL maskToBounds;

@end
