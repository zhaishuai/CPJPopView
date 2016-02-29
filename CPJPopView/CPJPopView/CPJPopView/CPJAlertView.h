//
//  CPJAlertView.h
//  CPJPopView
//
//  Created by shuaizhai on 2/29/16.
//  Copyright © 2016 com.zhaishuai.www. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CPJPopView.h"

@interface CPJAlertView : CPJPopView

@property (nonatomic) UIView *contentView;

@property (nonatomic) UIButton *confirmButton;

@property (nonatomic) CPJPopViewAnimation *contentViewAnimation;

/**
 * @brief 在该方法中配置界面，子类根据需要重写该方法。
 */
- (void)configSubviews;

- (void)show:(UIView *) view withConfirm:(void (^)())confirm;

@end