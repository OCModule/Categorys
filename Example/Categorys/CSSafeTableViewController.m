//
//  CSSafeTableViewController.m
//  Categorys_Example
//
//  Created by Steve on 15/12/2017.
//  Copyright © 2017 wangchengqvan@gmail.com. All rights reserved.
//

#import "CSSafeTableViewController.h"
#import <Categorys/UIControl+Block.h>
#import <Categorys/UIResponder+Router.h>
#import <Categorys/NSObject+PerformIfResponds.h>
#import "CSTimerViewController.h"

@interface CSSafeTableViewController ()

@end

@implementation CSSafeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[[UIButton alloc] init] touchUpInside:^{
        
    }];
}


- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
                case 0:
                    
                    break;
                case 1:
                    [tableView routerEventWithName:@"click:" userInfo:@{@"say": @"hello world"}];
                    break;
                default:
                    break;
            }
            break;
        case 1:
            switch (indexPath.row) {
                case 0:
                    
                    break;
                case 1:
                {
                    id obj = [self performSelector:@selector(sum:arg:arg:) withObjects:@2, @3, @5,nil];
                    NSLog(@"🌹： %@", obj);
                }
                    break;
                case 2:
                {
                    CSTimerViewController *dest = [[CSTimerViewController alloc] init];
                    [self.navigationController pushViewController:dest animated:YES];
                }
                default:
                    break;
            }
            break;
        default:
            break;
    }
}

- (void)routerEventWithName:(NSString *)aName userInfo:(NSDictionary *)userInfo {
    
    NSLog(@"aName: %@, userInfo: %@", aName, userInfo.debugDescription);

}

- (NSArray *)varArgFunc:(id)value,... NS_REQUIRES_NIL_TERMINATION {
    NSMutableArray *aux = [NSMutableArray arrayWithObjects:value, nil];
    va_list list;
    va_start(list, value);
    while (YES)
    {
        id val = va_arg(list, id);
        if (!val) {
            break;
        }
        [aux addObject:val];
    }
    va_end(list);
    return [aux copy];
}

- (NSNumber *)sum:(NSNumber *)arg1 arg:(NSNumber *)arg2 arg:(NSNumber *)arg3 {
    NSInteger temp = [arg1 integerValue] + [arg2 integerValue] + [arg3 integerValue];
    return [NSNumber numberWithInteger:temp];
}

@end
