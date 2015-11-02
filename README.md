# KNAlertView
Streamline system AlertView

1.简化系统的alertView方法,一行代码完成 弹出效果.(以下两种方式)

   KNAlertView *alertView = [KNAlertView showMessage:@"你好" title:@"提示" cancelBtnTitle:@"取消" alertViewStyle:KNAlertViewStyleLoginAndPasswordInput];

   KNAlertView *alertView = [KNAlertView showMessage:@"您好" title:nil cancelBtnTitle:@"取消" otherBtnTitle:@"确定" alertViewStyle:KNAlertViewStyleSecureTextInput];
    
    KNAlertView *alertView = [KNAlertView showMessage:@"你挺好" title:nil cancelBtnTitle:@"取消" otherBtnTitle:@"开始" alertViewStyle:KNAlertViewStyleDefault];
 
2.通过block来回调点击方法

    alertView.alertOtherBlock = ^(){
        NSLog(@"确定");
    };
    
    alertView.alertCancelBlock = ^(){
        NSLog(@"取消");
    };
