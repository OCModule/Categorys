//
//  NSFileManager+Helper.m
//  MagicCamera
//
//  Created by Steve on 2020/6/23.
//  Copyright © 2020 Steve. All rights reserved.
//

#import "NSFileManager+Helper.h"

@implementation NSFileManager (Helper)

+ (NSString *)documents {
    return NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES).firstObject;
}

+ (NSString *)library {
    return NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,NSUserDomainMask, YES).firstObject;
}

+ (NSString *)caches {
    return NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask, YES).firstObject;
}

+ (NSString *)temporary {
    return NSTemporaryDirectory();
}

+ (NSString *)filePathInTmpWithName:(NSString *)name {
    return [[self temporary] stringByAppendingPathComponent:name];
}

+ (NSString *)filePathInTmpWithSuffix:(NSString *)suffix {
    NSTimeInterval interval = [[NSDate date] timeIntervalSince1970] * 1000;
    return [[self filePathInTmpWithName:[NSString stringWithFormat:@"%f", interval]] stringByAppendingString:suffix];
}

@end
