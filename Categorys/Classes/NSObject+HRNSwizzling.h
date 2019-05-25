//
//  NSObject+HRNSwizzling.h
//  ComicRN
//
//  Created by Steve on 2018/11/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef IMP _Nullable  * IMPPointer;

@interface NSObject (HRNSwizzling)

/**
 *  @brief  交换一个类方法的实现
 *
 *  @param oldSelector  原类方法的实现
 *  @param newSelector  新类方法的实现
 */
+ (void)classSwizzle:(Class)cls oldSelector:(SEL)oldSelector newSelector:(SEL)newSelector;

/**
 *  @brief 交换一个实例方法的实现
 *
 *  @param oldSelector  原实例方法的实现
 *  @param newSelector  新实例方法的实现
 */
+ (void)instanceSwizzle:(Class)cls oldSelector:(SEL)oldSelector newSelector:(SEL)newSelector;

/**
 *  @brief  交换当前类方法的实现
 *
 *  @param oldSelector  原类方法的实现
 *  @param newSelector  新类方法的实现
 */
- (void)classSwizzle:(SEL)oldSelector newSelector:(SEL)newSelector;

/**
 *  @brief  交换当前类的实例方法的实现
 *
 *  @param oldSelector  原实例方法的实现
 *  @param newSElector  新实例方法的实现
 */
- (void)instanceSwizzle:(SEL)oldSelector newSelector:(SEL)newSElector;

@end

NS_ASSUME_NONNULL_END
