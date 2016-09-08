# KNAlertView && KNActionSheet

##KNAlertView: 
方法一:

### 1.简化系统的alertView方法,一行代码完成 弹出效果.(以下两种方式)
```
KNAlertView *alertView = [KNAlertView showMessage:@"你好" title:@"提示" cancelBtnTitle:@"取消"];
KNAlertView *alertView = [KNAlertView showMessage:@"您好" title:nil cancelBtnTitle:@"取消" otherBtnTitle:@"确定"];
KNAlertView *alertView = [KNAlertView showMessage:@"你挺好" title:nil cancelBtnTitle:@"取消" otherBtnTitle:@"开始"];

```
### 2.通过block来回调点击方法
```
alertView.alertOtherBlock = ^(){
	NSLog(@"确定");
};    
alertView.alertCancelBlock = ^(){
	NSLog(@"取消");
};
```
方法二:
```
[KNAlertView showMessage:@"hehe" title:@"title" cancelBtnTitle:@"cancel" otherBtnTitle:@"sure" buttonBlock:^(NSInteger buttonIndex) {
	 NSLog(@"alertView :%zd",buttonIndex);
}];
```

## KNActionSheet:
### 高仿微博&&微信 弹出框
```
KNActionSheet *actionSheet = [[KNActionSheet alloc] initWithCancelBtnTitle:@"cancel" destructiveButtonTitle:nil otherBtnTitlesArr:@[@"first",@"second",@"third"] actionBlock:^(NSInteger buttonIndex) {
	NSLog(@"actionSheet :%zd",buttonIndex);
}];
[actionSheet show];
```
