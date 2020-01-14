//
//  CQWeakProxy.h
//  Categorys
//
//  Created by Steve on 2020/1/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CQWeakProxy : NSProxy

@property (nonatomic, weak, readonly) id target;

+ (instancetype)proxyWithTarget:(id)target;

@end

NS_ASSUME_NONNULL_END
