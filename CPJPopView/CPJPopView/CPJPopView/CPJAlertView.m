//
//  CPJAlertView.m
//  CPJPopView
//
//  Created by shuaizhai on 2/29/16.
//  Copyright © 2016 com.zhaishuai.www. All rights reserved.
//

#import "CPJAlertView.h"

#define CONFIRM_BUTTON_HEIGHT 30
#define CONFIRM_BUTTON_WIDTH  100

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
        _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 2*self.frame.size.width/3, self.frame.size.height/5)];
        self.contentView.center = CGPointMake(self.center.x, self.center.y - self.frame.size.height/10);
        _contentView.backgroundColor = [UIColor whiteColor];
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
        self.clipsToBounds = YES;
    }
    return _contentView;
}

- (UIButton *)confirmButton{
    if(!_confirmButton){
        _confirmButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_confirmButton addTarget:self action:@selector(confirmAction) forControlEvents:UIControlEventTouchUpInside];
        [_contentView addSubview:_confirmButton];
    }
    return _confirmButton;
}

- (UILabel *)textLabel{
    if(!_textLabel){
        _textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.contentView.frame.size.width - 40, self.contentView.frame.size.height - CONFIRM_BUTTON_HEIGHT - 20)];
        _textLabel.center = CGPointMake(self.contentView.frame.size.width/2, self.contentView.frame.size.height/2 -20);
        _textLabel.numberOfLines = 0;
        _textLabel.textAlignment = NSTextAlignmentCenter;
        _textLabel.textColor = [UIColor grayColor];
        _textLabel.font = [UIFont systemFontOfSize:15];
        [_contentView addSubview:_textLabel];
    }
    return _textLabel;
}

- (void)configSubviews{
    self.frame = [UIScreen mainScreen].bounds;
    self.contentView.layer.masksToBounds = YES;
    self.contentView.layer.cornerRadius = 10;
    self.contentView.frame = CGRectMake(0, 0, 2*self.frame.size.width/3, self.frame.size.height/5);
    self.contentView.center = CGPointMake(self.center.x, self.center.y - self.frame.size.height/10);
    self.confirmButton.frame = CGRectMake(self.contentView.frame.size.width/2 - CONFIRM_BUTTON_WIDTH/2, self.contentView.frame.size.height - CONFIRM_BUTTON_HEIGHT - 10, CONFIRM_BUTTON_WIDTH, CONFIRM_BUTTON_HEIGHT);
    [self.confirmButton setTitle:@"确定" forState:UIControlStateNormal];
    [self.confirmButton setTintColor:[UIColor whiteColor]];
    self.confirmButton.layer.masksToBounds = YES;
    self.confirmButton.layer.cornerRadius = CONFIRM_BUTTON_HEIGHT/2;
    [self.confirmButton setBackgroundColor:[UIColor colorWithRed:251.0/255.0 green:90.0/255.0 blue:146.0/255.0 alpha:1]];
}

- (void)showInView:(UIView *)view{
    [super showInView:view];
    [self addSubview:self.contentView];
    [self configSubviews];
    [self.contentViewAnimation performAnimation:self.contentView];
}

- (void)showInView:(UIView *)view withText:(NSString *)text withConfirm:(void (^)())confirm{
    [self showInView:view];
    self.block = confirm;
    self.textLabel.text = text;
}

- (void)confirmAction{
    [self hide];
    if(self.block != nil)
        self.block();
}

@end
