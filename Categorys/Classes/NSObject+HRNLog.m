//
//  NSObject+HRNLog.m
//  QYComic
//
//  Created by Steve on 2019/5/22.
//



#ifdef DEBUG
#import <objc/runtime.h>
#import "NSObject+HRNSwizzling.h"

#pragma mark - NSObject

@implementation NSObject (HRNLog)
//将obj转换成json字符串。如果失败则返回nil.
- (NSString *)convertToJsonString {
    //先判断是否能转化为JSON格式
    if (![NSJSONSerialization isValidJSONObject:self])  return nil;
    NSError *error = nil;
    NSJSONWritingOptions jsonOptions = NSJSONWritingPrettyPrinted;
    if (@available(iOS 11.0, *)) {
        //11.0之后，可以将JSON按照key排列后输出，看起来会更舒服
        jsonOptions = NSJSONWritingPrettyPrinted | NSJSONWritingSortedKeys ;
    }
    //核心代码，字典转化为有格式输出的JSON字符串
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    if (error || !jsonData) return nil;
    NSString *jsonString = [[NSString alloc] initWithData:jsonData
                                                 encoding:NSUTF8StringEncoding];
    return jsonString;
}
@end


#pragma mark - NSDictionary

@implementation NSDictionary (HRNLog)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            [self instanceSwizzle:@selector(descriptionWithLocale:)
                      newSelector:@selector(hrn_descriptionWithLocale:)];
            [self instanceSwizzle:@selector(descriptionWithLocale:indent:)
                      newSelector:@selector(hrn_descriptionWithLocale:indent:)];
            [self instanceSwizzle:@selector(debugDescription)
                      newSelector: @selector(hrn_debugDescription)];
        });
    });
}

//用此方法交换系统的 descriptionWithLocale: 方法。该方法在代码打印的时候调用。
- (NSString *)hrn_descriptionWithLocale:(id)locale{
    NSString *result = [self convertToJsonString];//转换成JSON格式字符串
    if (!result) {
        result = [self hrn_descriptionWithLocale:locale];//如果无法转换，就使用原先的格式
        return result;
    }
    return result;
}
//用此方法交换系统的 descriptionWithLocale:indent:方法。功能同上。
- (NSString *)hrn_descriptionWithLocale:(id)locale indent:(NSUInteger)level {
    NSString *result = [self convertToJsonString];
    if (!result) {
        result = [self hrn_descriptionWithLocale:locale indent:level];//如果无法转换，就使用原先的格式
        return result;
    }
    return result;
}
//用此方法交换系统的 debugDescription 方法。该方法在控制台使用po打印的时候调用。
- (NSString *)hrn_debugDescription{
    NSString *result = [self convertToJsonString];
    if (!result) return [self hrn_debugDescription];
    return result;
}

@end


#pragma mark - NSArray

@implementation NSArray (HRNLog)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self instanceSwizzle:@selector(descriptionWithLocale:)
                  newSelector:@selector(hrn_descriptionWithLocale:)];
        [self instanceSwizzle:@selector(descriptionWithLocale:indent:)
                  newSelector:@selector(hrn_descriptionWithLocale:indent:)];
        [self instanceSwizzle:@selector(debugDescription)
                  newSelector:@selector(hrn_debugDescription)];
    });
}

//用此方法交换系统的 descriptionWithLocale: 方法。该方法在代码打印的时候调用。
- (NSString *)hrn_descriptionWithLocale:(id)locale{
    
    NSString *result = [self convertToJsonString];//转换成JSON格式字符串
    if (!result) {
        result = [self hrn_descriptionWithLocale:locale];//如果无法转换，就使用原先的格式
        return result;
    }
    return result;
}
//用此方法交换系统的 descriptionWithLocale:indent:方法。功能同上。
- (NSString *)hrn_descriptionWithLocale:(id)locale indent:(NSUInteger)level {
    NSString *result = [self convertToJsonString];
    if (!result) {
        result = [self hrn_descriptionWithLocale:locale indent:level];//如果无法转换，就使用原先的格式
        return result;
    }
    return result;
}
//用此方法交换系统的 debugDescription 方法。该方法在控制台使用po打印的时候调用。
- (NSString *)hrn_debugDescription{
    NSString *result = [self convertToJsonString];
    if (!result) return [self hrn_debugDescription];
    return result;
}

@end
#endif
