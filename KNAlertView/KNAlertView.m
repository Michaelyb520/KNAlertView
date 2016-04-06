//
//  KNAlertView.m
//  FileManagerTest
//
//  Created by LUKHA_Lu on 15/10/21.
//  Copyright (c) 2015年 KNKane. All rights reserved.
//

#import "KNAlertView.h"

@interface KNAlertView()<UIAlertViewDelegate>

@end

@implementation KNAlertView

+ (KNAlertView *)showMessage:(NSString *)message title:(NSString *)title cancelBtnTitle:(NSString *)cancelTitle{
    return [self showMessage:message delegate:nil title:title cancelBtnTitle:cancelTitle otherButtonTitle:nil];
}

+ (KNAlertView *)showMessage:(NSString *)message title:(NSString *)title cancelBtnTitle:(NSString *)cancelTitle otherBtnTitle:(NSString *)otherButtonTitle{
    return [self showMessage:message delegate:nil title:title cancelBtnTitle:cancelTitle otherButtonTitle:otherButtonTitle];
}

+ (KNAlertView *)showMessage:(NSString *)message delegate:(id<UIAlertViewDelegate>)delegate title:(NSString *)title cancelBtnTitle:(NSString *)cancelBtnTitle otherButtonTitle:(NSString *)otherButtonTitle{
    KNAlertView *alert = [[KNAlertView alloc] initWithTitle:title?title:@"提示" message:message delegate:delegate cancelButtonTitle:cancelBtnTitle otherButtonTitles:otherButtonTitle,nil];
    alert.delegate = alert;
    [alert show];
    return alert;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex == 0){
        if(_alertCancelBlock){
            _alertCancelBlock();
        }
    }else{
        if(_alertOtherBlock){
            _alertOtherBlock();
        }
    }
}


@end
