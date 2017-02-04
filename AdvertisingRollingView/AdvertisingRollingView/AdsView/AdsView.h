//
//  AdsView.h
//  AdvertisingRollingView
//
//  Created by xiangronghua on 2017/2/4.
//  Copyright © 2017年 xiangronghua. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark ---- 内容视图
@interface AdsContainerView : UIView<UIScrollViewDelegate>
@property (strong, nonatomic) NSArray *containtViews;
@property (copy, nonatomic)   void (^scrollViewIndex)(long index);
@end

@interface  AdsCloseButton  : UIButton

@property (retain, nonatomic) UIColor *closeButtonTintColor;
//- (void)creatButton;
@end

#pragma mark ---- 主视图

@class AdsView;

@protocol AdsViewDelegate <NSObject>
@optional
//视图已经出现
- (void)adsViewDidAppear:(AdsView *)view;
//视图已经消失
- (void)adsViewDidDisAppear:(AdsView *)view;
/**
 *  点击主内容视图
 *
 *  @param view 弹框视图
 *  @param selectIndex 当前选中索引
 */
- (void)adsViewTapMainContainView:(AdsView *)view
                 currentSelectIndex:(long)selectIndex;

@end

@interface AdsView : UIView {
    long _selectIndex;//当前索引值
}

@property (retain, nonatomic) NSArray *containerSubviews;//内容视图数组
@property (retain, nonatomic) AdsContainerView *mainContainView;//主内容视图
@property (retain, nonatomic) AdsCloseButton   *closeButton;//关闭按钮
@property (retain, nonatomic) UIView *lineView;//直线
@property (assign, nonatomic) float minHorizontalPadding;//水瓶边距
@property (assign, nonatomic) float minVertalPadding;//垂直边距
@property (assign, nonatomic) float proportion;//宽高比例
@property (weak, nonatomic)   id <AdsViewDelegate> delegate;

- (instancetype)initWithView:(UIView *)view;
- (instancetype)initWithWindow:(UIWindow *)window;
- (void)showAnimated:(BOOL)animated;
- (void)hideAnimated:(BOOL)animated;

@end
