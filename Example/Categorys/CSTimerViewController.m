//
//  CSTimerViewController.m
//  Categorys_Example
//
//  Created by Steve on 2020/1/16.
//  Copyright © 2020 wangchengqvan@gmail.com. All rights reserved.
//

#import "CSTimerViewController.h"
#import <Categorys/CQWeakProxy.h>

@interface CSTimerViewController ()

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, assign) NSInteger interval;

@end

@implementation CSTimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    self.timeLabel = [[UILabel alloc] init];
    self.timeLabel.frame = CGRectMake(20, 120, 200, 44);
    // 动态时间 (可变数字) 防抖 //See: https://juejin.im/post/5d2bd974e51d4556da53d16e
    if (@available(iOS 12.0, *)) {
        self.timeLabel.font = [UIFont monospacedSystemFontOfSize:16 weight:0];
    } else {
        self.timeLabel.font = [UIFont fontWithName:@"Helvetica" size:16];
    }
    [self.view addSubview:self.timeLabel];
    
    self.timer = [NSTimer timerWithTimeInterval:1 target:[CQWeakProxy proxyWithTarget:self] selector:@selector(timerAction) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    [self.timer fire];
    
}

- (void)timerAction {
    NSInteger temp = self.interval + 1;
    self.interval = temp > 99 ? 0 : temp;
    NSString *timeStr;
    if (self.interval < 10) {
        timeStr = [NSString stringWithFormat:@"0%ld", self.interval];
    } else {
        timeStr = [NSString stringWithFormat:@"%ld", self.interval];
    }
    self.timeLabel.text = [NSString stringWithFormat:@"当前循环时间： %@ 秒", timeStr];
}

- (void)dealloc {
    [self.timer invalidate];
    self.timer = nil;
}


@end
