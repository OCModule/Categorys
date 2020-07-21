//
//  CSMutableCopyTests.m
//  Categorys_Tests
//
//  Created by Steve on 2020/7/21.
//  Copyright © 2020 wangchengqvan@gmail.com. All rights reserved.
//

#import <XCTest/XCTest.h>

// see: https://juejin.im/post/5b34aaa36fb9a00e6e28535d

@interface CSMutableCopyTests : XCTestCase

@end

@implementation CSMutableCopyTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
        NSString *str = @"1";
        NSArray *arr1 = [NSArray arrayWithObject:str];
        NSArray *arr2 = arr1.mutableCopy;
        NSMutableArray *arr3 = [[NSMutableArray alloc] initWithArray:arr1 copyItems:YES];
        NSLog(@"str: %p", str);
        NSLog(@"str: %p", arr1.firstObject);
        NSLog(@"str: %p", arr2.firstObject);
        NSLog(@"str: %p", arr3.firstObject);
        NSLog(@"arr: %p", arr1);
        NSLog(@"arr: %p", arr2);
        NSLog(@"arr: %p", arr3);
}

- (void)testMutableElementInSet {
        NSMutableString *str = [NSMutableString stringWithFormat:@"1"];
        NSArray *arr1 = [NSArray arrayWithObject:str];
        NSArray *arr2 = arr1.mutableCopy;
        NSMutableArray *arr3 = [[NSMutableArray alloc] initWithArray:arr1 copyItems:YES];
        NSLog(@"str: %p", str);
        NSLog(@"str: %p", arr1.firstObject);
        NSLog(@"str: %p", arr2.firstObject);
        NSLog(@"str: %p", arr3.firstObject);
        NSLog(@"arr: %p", arr1);
        NSLog(@"arr: %p", arr2);
        NSLog(@"arr: %p", arr3);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
