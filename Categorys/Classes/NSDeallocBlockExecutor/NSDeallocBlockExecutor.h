// 
//   NSDeallocBlockExecutor.h
//   Pods
// 
//   Created by CNKCQ on 12/22/2018.
// 
// 

#import <Foundation/Foundation.h>

@interface NSDeallocBlockExecutor : NSObject

- (instancetype)initWithDeallocHandler:(void (^)(void))handler;

@end
