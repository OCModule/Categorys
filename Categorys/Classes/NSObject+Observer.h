//
//  NSObject+Observer.h
//  Categorys
//
//  Created by Steve on 10/12/2017.
//

#import <Foundation/Foundation.h>

@interface NSObject (Observer)

- (void)cs_addObserver:(nonnull NSObject *)observer forKeyPath:(nonnull NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context;

@end
