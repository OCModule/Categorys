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
#import "CSVeiw.h"
#import <Categorys/UIControl+click.h>
#import <Categorys/UIImage+Resize.h>


@interface CSViewController ()


@end

@implementation CSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    __weak typeof(self) weakself = self;
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 120, 60, 44)];
    button.timeInterval = 2.0;
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:@"repeat click" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *button1 = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 60, 44)];
//    button1.timeInterval = 0.0;
    [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button1 setTitle:@"click 22" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    button1.isIgnoreEvent = YES;
    [self.view addSubview:button1];

//    [[NSObject new] perform:^{
//        __strong typeof(self) strongself = weakself;
//        NSLog(@"🌹--🇺🇸 ==%@", strongself);
//    }];
//    [[NSObject new] perform:^{
//        __strong typeof(self) strongself = weakself;
//        NSLog(@"🌹--🇺🇸 ==%@", strongself);
//    } andDelay:5];
    UIView *test = [[CSVeiw alloc] init];
    
    id obj = [self performSelector:@selector(sum:arg:arg:) withObjects:@[@2, @3, @5]];
//    id obj = [self perform:@selector(sum:arg:arg:) withObject:@2, @3, @4];
    
    NSLog(@"🌹🇺🇸%@", obj);
    CGFloat width = self.view.bounds.size.width - 2 * 16;
    CGFloat height = width / 16.0 * 9.0;
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(16, 100, width, height)];
    imageView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:imageView];
    UIImage *image = [UIImage imageNamed:@"image"];
//    imageView.image = [UIImage imageWithImage:image scaledToSizeWithSameAspectRatio:imageView.bounds.size];
//    CGInterpolationQuality
    imageView.image = [image resizedImage:imageView.bounds.size interpolationQuality:kCGInterpolationHigh];
    
    
    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(16, 360, width, height)];
    imageView1.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:imageView1];
    UIImage *image1 = [UIImage imageNamed:@"image"];
    imageView1.contentMode = UIViewContentModeScaleAspectFill;
    imageView1.image = image1;
}

//- (NSInteger)sum:(NSInteger)arg1 arg:(NSInteger)arg2 arg:(NSInteger)arg3 {
////    NSInteger temp = [arg1 integerValue] + [arg2 integerValue] + [arg3 integerValue];
////    return [NSNumber numberWithInteger:temp];
//    return arg1 + arg2 + arg3;
//}

- (void)click: (UIButton *)sender {
    NSLog(@"🌹🇺🇸ლ(′◉❥◉｀ლ)%@", sender.currentTitle);
}

- (NSNumber *)sum:(NSNumber *)arg1 arg:(NSNumber *)arg2 arg:(NSNumber *)arg3 {
    NSInteger temp = [arg1 integerValue] + [arg2 integerValue] + [arg3 integerValue];
    return [NSNumber numberWithInteger:temp];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

@end


