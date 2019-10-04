// 
//   NSDeallocBlockExecutor.m
//   Pods
// 
//   Created by CNKCQ on 12/22/2018.
// 
// 

#import "NSDeallocBlockExecutor.h"

@interface NSDeallocBlockExecutor ()
@property (nonatomic, copy) void (^deallocHandler)(void);
@end

@implementation NSDeallocBlockExecutor

- (instancetype)initWithDeallocHandler:(void (^)(void))handler {
    self = [super init];
    if (self) {
        self.deallocHandler = handler;
    }
    return self;
}

- (void)dealloc {
    !self.deallocHandler ?: self.deallocHandler();
    self.deallocHandler = nil;
}

@end
