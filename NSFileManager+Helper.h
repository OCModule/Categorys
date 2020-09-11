//
//  NSFileManager+Helper.h
//  MagicCamera
//
//  Created by Steve on 2020/6/23.
//  Copyright © 2020 Steve. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSFileManager (Helper)

+ (NSString *)documents;

+ (NSString *)library;

+ (NSString *)caches;

+ (NSString *)temporary;

+ (NSString *)filePathInTmpWithName:(NSString *)name;

+ (NSString *)filePathInTmpWithSuffix:(NSString *)suffix;

@end

NS_ASSUME_NONNULL_END
