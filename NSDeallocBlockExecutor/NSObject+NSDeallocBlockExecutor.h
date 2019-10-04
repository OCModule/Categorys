// 
//   NSObject+NSDeallocBlockExecutor.h
//   Pods
// 
//   Created by CNKCQ on 12/22/2018.
// 
// 

#import <Foundation/Foundation.h>

@class NSDeallocBlockExecutor;
@interface NSObject (NSDeallocBlockExecutor)

@property (nonatomic, strong) NSDeallocBlockExecutor *ns_exutor;
@property (nonatomic, readonly) NSMutableArray *ns_exutorPool;

- (void)ns_addExutor:(NSDeallocBlockExecutor *)exutor;

- (void)ns_createExecutorWithHandlerBlock:(void (^)(void))block;

@end
