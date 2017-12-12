//
//  Foundation+Log.m
//  Categorys
//
//  Created by Steve on 11/12/2017.
//


#import <Foundation/Foundation.h>

@implementation NSArray (Log)
/**
 *  重写NSArray的description函数
 *
 *  @param locale 本地化参数
 *
 *  @return 返回字符串
 */
- (NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString *string = [NSMutableString stringWithFormat:@"%lu (\n", (unsigned long)self.count];
    
    for (id obj in self) {
        [string appendFormat:@"\t%@, \n", obj];
    }
    
    [string appendString:@")"];
    
    return string;
}
@end

@implementation NSDictionary (Log)
/**
 *  重写NSDictionary的description函数
 *
 *  @param locale 本地化参数
 *
 *  @return 返回字符串
 */
- (NSString *)descriptionWithLocale:(id)locale
{
    NSArray *allKeys = [self allKeys];
    NSMutableString *string = [[NSMutableString alloc] initWithFormat:@"{\t\n "];
    for (NSString *key in allKeys) {
        id value= self[key];
        [string appendFormat:@"\t \"%@\" = %@,\n",key, value];
    }
    [string appendString:@"}"];
    
    return string;
}

@end
