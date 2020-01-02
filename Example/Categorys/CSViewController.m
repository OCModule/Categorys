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
#import "CSSingleton.h"
#import "UIView+CSTest1.h"
#import "UIView+CSTest2.h"
#import "NSObject+AssociatedObject.h"


@interface CSViewController ()

@end

@implementation CSViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    __weak typeof(self) weakself = self;
    
    [self.view test];
    
    CSSingleton *test1 = [CSSingleton shared];
    
    CSSingleton *test2 = [CSSingleton shared];
    
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
    imageView.image = image;
//    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.contentMode = UIViewContentModeScaleAspectFill;
//    imageView.image = [image resized: imageView.bounds.size priority:IMGPriorityBottomTop];
//    imageView.image = [self imageWithImage:image scaledToSizeWithSameAspectRatio:imageView.bounds.size];
//    imageView.image = [self imageWithImage:image aspectRatio:imageView.bounds.size];
    
    
    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(16, 360, width, height)];
    imageView1.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:imageView1];
    UIImage *image1 = [UIImage imageNamed:@"image"];
    
//    imageView1.image = [image1 croppedImage:[self rectWithImage:image1 aspectRatio:16.0/9.0]];
    imageView1.image = [image1 imageScaledBySize:imageView1.frame.size];
    
}

//- (NSInteger)sum:(NSInteger)arg1 arg:(NSInteger)arg2 arg:(NSInteger)arg3 {
////    NSInteger temp = [arg1 integerValue] + [arg2 integerValue] + [arg3 integerValue];
////    return [NSNumber numberWithInteger:temp];
//    return arg1 + arg2 + arg3;
//}


- (void)click: (UIButton *)sender {
//    NSLog(@"🌹🇺🇸ლ(′◉❥◉｀ლ)%@", sender.currentTitle);
}

- (NSNumber *)sum:(NSNumber *)arg1 arg:(NSNumber *)arg2 arg:(NSNumber *)arg3 {
    NSInteger temp = [arg1 integerValue] + [arg2 integerValue] + [arg3 integerValue];
    return [NSNumber numberWithInteger:temp];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSObject *obj = [NSObject new];
    {
        NSObject *obj1 = [NSObject new];
        [obj setWeakObject:obj1 withKey:NSSelectorFromString(@"setObj1:")];
        NSLog(@"🌹 1 %@", [obj object:NSSelectorFromString(@"setObj1:")]);
    }
    NSLog(@"🌹 2 %@", [obj object:NSSelectorFromString(@"setObj1:")]);

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    CSSingleton *test3 = [CSSingleton shared];
    
    CSSingleton *test4 = [CSSingleton shared];

}

/// 图片压缩 size 太小图片会失真
- (CGRect)rectWithImage:(UIImage*)image aspectRatio:(CGFloat)ratio {
    CGSize imageSize = image.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat scaledWidth = imageSize.width;
    CGFloat scaledHeight = width/ratio;
    CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
    thumbnailPoint.x = 0;
    thumbnailPoint.y = height - scaledHeight;
    return CGRectMake(thumbnailPoint.x, thumbnailPoint.y, scaledWidth, scaledHeight);
}


@end


