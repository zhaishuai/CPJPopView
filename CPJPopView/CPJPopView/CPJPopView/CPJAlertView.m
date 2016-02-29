//
//  CPJAlertView.m
//  CPJPopView
//
//  Created by shuaizhai on 2/29/16.
//  Copyright © 2016 com.zhaishuai.www. All rights reserved.
//

#import "CPJAlertView.h"

typedef void (^ConfirmBlock)();

@interface CPJAlertView ()

@property (nonatomic, copy)ConfirmBlock block;

@end

@implementation CPJAlertView

- (CPJPopViewAnimation *)contentViewAnimation{
    if(!_contentViewAnimation){
        _contentViewAnimation = [CPJPopViewAnimation new];
    }
    return _contentViewAnimation;
}

- (UIView *)contentView{
    if(!_contentView){
        _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        _contentView.backgroundColor = [UIColor redColor];
    }
    return _contentView;
}

- (UIButton *)confirmButton{
    if(!_confirmButton){
        _confirmButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_confirmButton addTarget:self action:@selector(confirmAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_confirmButton];
    }
    return _confirmButton;
}

- (void)configSubviews{
    self.contentView.frame = CGRectMake(0, 0, self.frame.size.width/2, self.frame.size.height/2);
    self.confirmButton.frame = CGRectMake(10, 10, 20, 10);
    [self.confirmButton setTitle:@"确定" forState:UIControlStateNormal];
}

- (void)show:(UIView *)view{
    [super show:view];
    [self addSubview:self.contentView];
    [self configSubviews];
    [self.contentViewAnimation performAnimation:self.contentView];
}

- (void)show:(UIView *)view withConfirm:(void (^)())confirm{
    [self show:view];
    self.block = confirm;
}

- (void)confirmAction{
    if(self.block != nil)
        self.block();
}

@end
