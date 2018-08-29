//
//  UIControl+Block.m
//  Categorys
//
//  Created by steve on 29/08/2018.
//

#import "UIControl+Block.h"
#import "NSObject+AssociatedObject.h"

#define UIControlEventImpl(methodName, eventName)                                                                      \
-(void)methodName : (void (^)(void))eventBlock {                                                                     \
[self setCopyNonatomicObject:eventBlock withKey:@selector(methodName:)];                                           \
[self addTarget:self action:@selector(methodName##Action:) forControlEvents:UIControlEvent##eventName];            \
}                                                                                                                    \
-(void)methodName##Action : (id)sender {                                                                             \
void (^block)() = [self object:@selector(methodName:)];                                                            \
if (block) {                                                                                                       \
block();                                                                                                         \
}                                                                                                                  \
}

@implementation UIControl (Block)
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wstrict-prototypes"

UIControlEventImpl(touchDown, TouchDown);
UIControlEventImpl(touchDownRepeat, TouchDownRepeat);
UIControlEventImpl(touchDragInside, TouchDragInside);
UIControlEventImpl(touchDragOutside, TouchDragOutside);
UIControlEventImpl(touchDragEnter, TouchDragEnter);
UIControlEventImpl(touchDragExit, TouchDragExit);
UIControlEventImpl(touchUpInside, TouchUpInside);
UIControlEventImpl(touchUpOutside, TouchUpOutside);
UIControlEventImpl(touchCancel, TouchCancel);
UIControlEventImpl(valueChanged, ValueChanged);
UIControlEventImpl(editingDidBegin, EditingDidBegin);
UIControlEventImpl(editingChanged, EditingChanged);
UIControlEventImpl(editingDidEnd, EditingDidEnd);
UIControlEventImpl(editingDidEndOnExit, EditingDidEndOnExit);

#pragma clang diagnostic pop
@end
