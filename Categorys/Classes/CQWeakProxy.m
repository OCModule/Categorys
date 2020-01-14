//
//  CQWeakProxy.m
//  Categorys
//
//  Created by Steve on 2020/1/14.
//

#import "CQWeakProxy.h"

@interface CQWeakProxy()

@property (nonatomic, weak) id target;

@end

@implementation CQWeakProxy

+ (instancetype)proxyWithTarget:(id)target {
    CQWeakProxy *proxy = [self alloc];
    proxy.target = target;
    return proxy;
}

- (void)forwardInvocation:(NSInvocation *)invocation{
    SEL sel = [invocation selector];
    if ([self.target respondsToSelector:sel]) {
        [invocation invokeWithTarget:self.target];
    }
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    return [self.target methodSignatureForSelector:sel];
}

- (BOOL)respondsToSelector:(SEL)aSelector {
    return [self.target respondsToSelector:aSelector];
}

@end
