//
//  NSObject+Block.h
//  Categorys
//
//  Created by Steve on 11/12/2017.
//

#import <Foundation/Foundation.h>

@interface NSObject (Block)

-(void)perform:(void (^)(void))performBlock;

-(void)perform:(void (^)(void))performBlock andDelay:(NSTimeInterval)delay;

@end
