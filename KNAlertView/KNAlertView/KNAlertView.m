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

static BOOL _isUserBlock;
static KNAlertButtonBlock _buttonBlock;

@implementation KNAlertView

+ (KNAlertView *)showMessage:(NSString *)message title:(NSString *)title cancelBtnTitle:(NSString *)cancelTitle{
    _isUserBlock = NO;
    return [self showMessage:message delegate:nil title:title cancelBtnTitle:cancelTitle otherButtonTitle:nil];
}

+ (KNAlertView *)showMessage:(NSString *)message title:(NSString *)title cancelBtnTitle:(NSString *)cancelTitle otherBtnTitle:(NSString *)otherButtonTitle{
    _isUserBlock = NO;
    return [self showMessage:message delegate:nil title:title cancelBtnTitle:cancelTitle otherButtonTitle:otherButtonTitle];
}

+ (KNAlertView *)showMessage:(NSString *)message delegate:(id<UIAlertViewDelegate>)delegate title:(NSString *)title cancelBtnTitle:(NSString *)cancelBtnTitle otherButtonTitle:(NSString *)otherButtonTitle{
    _isUserBlock = NO;
    KNAlertView *alert = [[KNAlertView alloc] initWithTitle:title?title:@"提示" message:message delegate:delegate cancelButtonTitle:cancelBtnTitle otherButtonTitles:otherButtonTitle,nil];
    alert.delegate = alert;
    [alert show];
    return alert;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(!_isUserBlock){
        if(buttonIndex == 0){
            if(_alertCancelBlock){
                _alertCancelBlock();
            }
        }else{
            if(_alertOtherBlock){
                _alertOtherBlock();
            }
        }
    }else{
        
        if(_buttonBlock){
            _buttonBlock(buttonIndex);
        }
    }
}

+ (void)showMessage:(NSString *)message title:(NSString *)title cancelBtnTitle:(NSString *)cancelTitle buttonBlock:(KNAlertButtonBlock)buttonBlock{
    _isUserBlock = YES;
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title?title:@"提示" message:message delegate:nil cancelButtonTitle:cancelTitle otherButtonTitles:nil];
    alert.delegate = alert;
    _buttonBlock = buttonBlock;
    [alert show];
}

+ (void)showMessage:(NSString *)message title:(NSString *)title cancelBtnTitle:(NSString *)cancelTitle otherBtnTitle:(NSString *)otherButtonTitle buttonBlock:(KNAlertButtonBlock)buttonBlock{
    _isUserBlock = YES;
    KNAlertView *alert = [[KNAlertView alloc] initWithTitle:title?title:@"提示" message:message delegate:nil cancelButtonTitle:cancelTitle otherButtonTitles:otherButtonTitle,nil];
    alert.delegate = alert;
    _buttonBlock = buttonBlock;
    [alert show];
}



@end
