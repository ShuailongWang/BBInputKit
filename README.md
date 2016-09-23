
![image](https://raw.githubusercontent.com/bawangxx/BBInputKit/master/image/logo.png)
---
更新头像、昵称、用户名，共两套框架(仿《今日头条》效果)

效果图：

![image](https://raw.githubusercontent.com/bawangxx/BBInputKit/master/image/BBInputKit.gif)

使用方法：

1.修改头像
```
#import "UIViewController+SelectPhotoIcon.h"

[self showActionSheet];

//实现下面方法拿到裁剪后的图片
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info;{

//获得编辑后的图片
UIImage *editedImage = (UIImage *)info[UIImagePickerControllerEditedImage];
self.userIcon.image = editedImage;

[picker dismissViewControllerAnimated:YES completion:nil];
}
```

2、修改昵称、签名
```
[BBInput setDescTitle:@"請輸入昵稱"];
[BBInput setMaxContentLength:10];//设置输入文字的最大个数（支持中英文）
[BBInput setNormalContent:self.nickNameCell.detailTextLabel.text];
[BBInput showInput:^(NSString *inputContent) {

self.nickNameCell.detailTextLabel.text = inputContent;
[self.tableView reloadData];

}];
```
