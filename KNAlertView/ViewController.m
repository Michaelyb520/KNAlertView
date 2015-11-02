//
//  ViewController.m
//  KNAlertView
//
//  Created by LUKHA_Lu on 15/11/2.
//  Copyright © 2015年 KNKane. All rights reserved.
//

#import "ViewController.h"
#import "KNAlertView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"点我有用" forState:UIControlStateNormal];
    
    btn.frame = CGRectMake(100, 100, 100, 50);
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}

- (void)click{
//   KNAlertView *alertView = [KNAlertView showMessage:@"你好" title:@"提示" cancelBtnTitle:@"取消" alertViewStyle:KNAlertViewStyleLoginAndPasswordInput];

//   KNAlertView *alertView = [KNAlertView showMessage:@"您好" title:nil cancelBtnTitle:@"取消" otherBtnTitle:@"确定" alertViewStyle:KNAlertViewStyleSecureTextInput];
    
    KNAlertView *alertView = [KNAlertView showMessage:@"你挺好" title:nil cancelBtnTitle:@"取消" otherBtnTitle:@"开始" alertViewStyle:KNAlertViewStyleDefault];
    
    alertView.alertOtherBlock = ^(){
        NSLog(@"确定");
    };
    
    alertView.alertCancelBlock = ^(){
        NSLog(@"取消");
    };
}


@end
