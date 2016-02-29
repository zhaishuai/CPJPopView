//
//  ViewController.m
//  CPJPopView
//
//  Created by shuaizhai on 2/29/16.
//  Copyright © 2016 com.zhaishuai.www. All rights reserved.
//

#import "ViewController.h"
#import "CPJPopView/CPJAlertView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CPJAlertView *popView = [[CPJAlertView alloc] initWithFrame:CGRectMake(100, 200, 200, 200)];
    popView.backgroundColor = [UIColor blackColor];
//    [popView show:self.view];
    [popView show:self.view withConfirm:^{
        NSLog(@"hello world");
        [popView hideFromView:self.view];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
