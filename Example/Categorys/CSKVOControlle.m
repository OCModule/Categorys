//
//  CSKVOControllerViewController.m
//  Categorys_Example
//
//  Created by Steve on 12/12/2017.
//  Copyright © 2017 wangchengqvan@gmail.com. All rights reserved.
//

#import "CSKVOController.h"

//#import <Categorys/NSObject+KVO.h>
//#import <Categorys/NSObject+Observer.h>

@interface Message : NSObject

@property (nonatomic, copy) NSString *text;

@end

@implementation Message

@end

@interface Observer : NSObject

@end

@implementation Observer

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSLog(@"now it's %@", change);
}

@end



@interface CSKVOController ()

@property (nonatomic, strong) Message *message;

@property (nonatomic, strong) Observer *observer;

@end

@implementation CSKVOController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSLog(@"this change is %@", change);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    return;
    switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
                case 0:
                    _observer = [Observer new];
                    break;
                case 1:
                    _message = [Message new];
                    break;
                default:
                    break;
            }
            break;
        case 1:
            switch (indexPath.row) {
                case 0:
                    _message.text = @"hello test !";
                    break;
                case 1:
                    [_message addObserver:_observer forKeyPath:@"text" options:NSKeyValueObservingOptionNew context:nil];
                    break;
                case 2:
//                    [_message cs_addObserver:_observer forKeyPath:@"text" options:NSKeyValueObservingOptionNew context:nil];
                    break;
                case 3:
//                    [_message cs_addObserver:_observer forKey:@"text" withBlock:^(id observedObject, NSString *observedKey, id oldValue, id newValue) {
//                        NSLog(@"imp -- value == %@", newValue);
//                    }];
                    break;
                default:
                    break;
            }
            break;
        case 2:
            switch (indexPath.row) {
                case 0:
//                    [_message cs_removeObserver:_observer forKey:@"text"];
                    _observer = nil;
                    break;
                case 1:
                    _message = nil;
                    break;
                default:
                    break;
            }
            break;
        default:
            break;
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

@end
