//
//  ViewController.m
//  AdvertisingRollingView
//
//  Created by xiangronghua on 2017/2/4.
//  Copyright © 2017年 xiangronghua. All rights reserved.
//

#import "ViewController.h"
#import "AdsView.h"
#import "AppDelegate.h"

@interface ViewController ()<AdsViewDelegate>

{
    UIButton *_button;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor brownColor];
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    _button.frame = CGRectMake(100, 100, 100, 100);
    _button.backgroundColor = [UIColor whiteColor];
    [_button addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
}

- (void)button:(UIButton *)sender {
    
    sender.enabled = NO;
    [self performSelector:@selector(showAdsView) withObject:nil afterDelay:0.1];
}

- (void)showAdsView {
    
    AppDelegate *appDelegate = (id)[UIApplication sharedApplication].delegate;
    appDelegate.window.backgroundColor = [UIColor colorWithWhite:20
                                                           alpha:0.3];
    AdsView *adsView = [[AdsView alloc] initWithWindow:appDelegate.window];
    adsView.tag      = 10;
    adsView.delegate = self;
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (int i = 0; i < 6; i++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0,adsView.mainContainView.frame.size.width, adsView.mainContainView.frame.size.width)];
        label.font = [UIFont boldSystemFontOfSize:20.0];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = [NSString stringWithFormat:@"视图 %d", i+1];
        label.textColor = [UIColor redColor];
        label.backgroundColor = [UIColor colorWithRed:0 green:183.0/255.0 blue:238.0/255.0 alpha:1.000];
        label.layer.cornerRadius = adsView.mainContainView.frame.size.width/2;
        label.layer.masksToBounds = YES;
        [array addObject:label];
    }
    [self.view addSubview:adsView];
    adsView.containerSubviews = array;
    [adsView showAnimated:YES];
}

- (void)hide{
    AdsView *adsView = (AdsView *)[self.view viewWithTag:10];
    [adsView hideAnimated:YES];
}
- (void)adsViewDidAppear:(AdsView *)view{
    NSLog(@"视图出现");
}
- (void)adsViewDidDisAppear:(AdsView *)view{
    NSLog(@"视图消失");
    _button.enabled = YES;
}

- (void)adsViewTapMainContainView:(AdsView *)view currentSelectIndex:(long)selectIndex{
    NSLog(@"点击主内容视图:--%ld",selectIndex);
}

@end
