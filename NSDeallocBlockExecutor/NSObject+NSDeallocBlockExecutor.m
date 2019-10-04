// 
//   NSObject+NSDeallocBlockExecutor.m
//   Pods
// 
//   Created by CNKCQ on 12/22/2018.
// 
// 

#import "NSObject+NSDeallocBlockExecutor.h"
#import <objc/runtime.h>
#import "NSDeallocBlockExecutor.h"

@implementation NSObject (NSDeallocBlockExecutor)

- (void)setNs_exutor:(NSDeallocBlockExecutor *)ns_exutor {
    objc_setAssociatedObject(self, @selector(ns_exutor), ns_exutor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSDeallocBlockExecutor *)ns_exutor {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)ns_addExutor:(NSDeallocBlockExecutor *)exutor {
    if (!exutor) return;
    [self.ns_exutorPool addObject:exutor];
}

- (NSMutableArray *)ns_exutorPool {
    NSMutableArray *pool = objc_getAssociatedObject(self, _cmd);
    if (!pool) {
        pool = [NSMutableArray array];
        [self setNs_exutorPool:pool];;
    }
    return pool;
}

- (void)setNs_exutorPool:(NSMutableArray *)ns_exutorPool {
    objc_setAssociatedObject(self, @selector(ns_exutorPool), ns_exutorPool, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)ns_createExecutorWithHandlerBlock:(void (^)(void))block {
    NSDeallocBlockExecutor *executor = [[NSDeallocBlockExecutor alloc] initWithDeallocHandler:block];
    [self.ns_exutorPool addObject:executor];
}

@end
