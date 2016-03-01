//
//  ViewController.m
//  CPJPopView
//
//  Created by shuaizhai on 2/29/16.
//  Copyright © 2016 com.zhaishuai.www. All rights reserved.
//

#import "ViewController.h"
#import "CPJPopView/CPJAlertView.h"
#import "CPJPopView/CPJDialogView.h"

@interface ViewController ()

@property (nonatomic)CPJPopView *popView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showPopView:(id)sender {
    self.popView = [[CPJPopView alloc] initWithFrame:CGRectMake(0, 0, 300, 500)];
    self.popView.backgroundColor = [UIColor lightGrayColor];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(50, 100, 100, 50)];
    [button addTarget:self action:@selector(closePopView) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [UIColor redColor];
    [self.popView addSubview:button];
    self.popView.center = self.view.center;
    [self.popView showInView:self.view];
}

- (IBAction)showAlertView:(id)sender {
    CPJAlertView *alertView = [CPJAlertView new];
    [alertView showInView:self.view withText:@"CPJAlertView使用起来非常简单, 不需要在使用delegate" withConfirm:^{
        NSLog(@"hello world");
    }];
}

- (IBAction)showDialogView:(id)sender {
    CPJDialogView *dialogView = [CPJDialogView new];
    [dialogView showInView:self.view withText:@"CPJAlertView使用起来非常简单, 不需要在使用delegate" withConfirm:^{
        
        NSLog(@"confirm!");
    } withCancel:^{
        
        NSLog(@"cancel!");
    }];
}

- (void)closePopView{
    [self.popView hide];
}

@end
