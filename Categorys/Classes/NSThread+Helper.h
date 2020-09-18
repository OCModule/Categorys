//
//  NSThread+Helper.h
//  Categorys
//
//  Created by Steve on 2020/9/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

void doInMainThread(void(^block)(void)) {
    if (([[NSThread currentThread] isMainThread])) {
        block();
    } else {
        dispatch_async(dispatch_get_main_queue(), ^{
             block();
        });
    }
}

@interface NSThread (Helper)

@end

NS_ASSUME_NONNULL_END
