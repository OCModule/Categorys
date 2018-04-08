//
//  CSViewController.m
//  Categorys
//
//  Created by wangchengqvan@gmail.com on 12/10/2017.
//  Copyright (c) 2017 wangchengqvan@gmail.com. All rights reserved.
//

#import "CSViewController.h"
#import <Categorys/NSObject+Block.h>
#import <Categorys/NSObject+PerformIfResponds.h>


@interface CSViewController ()


@end

@implementation CSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    __weak typeof(self) weakself = self;
//    [[NSObject new] perform:^{
//        __strong typeof(self) strongself = weakself;
//        NSLog(@"🌹--🇺🇸 ==%@", strongself);
//    }];
//    [[NSObject new] perform:^{
//        __strong typeof(self) strongself = weakself;
//        NSLog(@"🌹--🇺🇸 ==%@", strongself);
//    } andDelay:5];
    
//    [self performSelector:@selector(ok) withObject:nil withObject:nil];
    id ob = [NSObject performIfResponds:self selector:@selector(sum:arg:arg:) object:@1 object:@2 object:@3];
    NSLog(@"🌹🇺🇸%@", ob);
}

- (NSNumber *)sum:(NSNumber *)arg1 arg:(NSNumber *)arg2 arg:(NSNumber *)arg3 {
    NSInteger temp = [arg1 integerValue] + [arg2 integerValue] + [arg3 integerValue];
    return [NSNumber numberWithInteger:temp];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end


