//
//  ViewController.m
//  KNAlertView
//
//  Created by LUKHA_Lu on 15/11/2.
//  Copyright © 2015年 KNKane. All rights reserved.
//

#import "ViewController.h"
#import "KNAlertView.h"
#import "KNActionSheet.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"AlertView" forState:UIControlStateNormal];
    
    btn.frame = CGRectMake(100, 100, 100, 50);
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setTitle:@"ActionSheet" forState:UIControlStateNormal];
    
    btn1.frame = CGRectMake(100, 200, 100, 50);
    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(actionSheetIBAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
}

- (void)click{
/****************************** == AlertView == ********************************/
    // 1. 方法一
    KNAlertView *alertView = [KNAlertView showMessage:@"你挺好" title:nil cancelBtnTitle:@"取消" otherBtnTitle:@"开始"];
    
    alertView.alertOtherBlock = ^(){
        NSLog(@"确定");
    };
    
    alertView.alertCancelBlock = ^(){
        NSLog(@"取消");
    };
    
//    // 2. 方法二
//    [KNAlertView showMessage:@"hehe" title:@"title" cancelBtnTitle:@"cancel" otherBtnTitle:@"sure" buttonBlock:^(NSInteger buttonIndex) {
//        NSLog(@"alertView :%zd",buttonIndex);
//    }];
    
}

- (void)actionSheetIBAction{
    /****************************** == ActionSheet == ********************************/
    KNActionSheet *actionSheet = [[KNActionSheet alloc] initWithCancelBtnTitle:@"cancel" destructiveButtonTitle:nil otherBtnTitlesArr:@[@"first",@"second",@"third"] actionBlock:^(NSInteger buttonIndex) {
        NSLog(@"actionSheet :%zd",buttonIndex);
    }];
    [actionSheet show];
}

@end
