//
//  ViewController.m
//  BBInputKit
//
//  Created by 项羽 on 16/9/22.
//  Copyright © 2016年 志尊宝宝. All rights reserved.
//

#import "ViewController.h"
#import "BBInput.h"
#import "UIViewController+SelectPhotoIcon.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *userIcon;

@property (weak, nonatomic) IBOutlet UITableViewCell *nickNameCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *signNameCell;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.userIcon.layer.cornerRadius = self.userIcon.bounds.size.width/2;
    self.userIcon.clipsToBounds = YES;
    
    self.navigationItem.title = @"賬戶管理";
   
}


#pragma mark - Table view data source
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        return 13;
    }
    return 15;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    if (indexPath.section == 0)
    {
        switch (indexPath.row) {
            case 0: //头像
            {
                [self showActionSheet];
            }
                break;
            case 1: //昵称
            {
                [self updateNickName];
            }
                break;
            case 2: //签名
            {
                [self updateSignName];
            }
                break;
                
            default:
                break;
        }
    }
    else if (indexPath.section == 1)
    {
        switch (indexPath.row) {
            case 0: //退出登录
            {
                
            }
                break;
                
            default:
                break;
        }
    }
    
}



//TODO:修改头像
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info;{
    
    //获得编辑后的图片
    UIImage *editedImage = (UIImage *)info[UIImagePickerControllerEditedImage];
    self.userIcon.image = editedImage;
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}


//TODO:修改昵称
-(void)updateNickName{
    
    [BBInput setDescTitle:@"請輸入昵稱"];
    [BBInput setMaxContentLength:10];
    [BBInput setNormalContent:self.nickNameCell.detailTextLabel.text];
    [BBInput showInput:^(NSString *inputContent) {
        
        self.nickNameCell.detailTextLabel.text = inputContent;
        [self.tableView reloadData];
        
    }];
    
}

//TODO:修改个性签名
-(void)updateSignName{
    
    [BBInput setDescTitle:@"請輸入個性簽名"];
    [BBInput setMaxContentLength:50];
    [BBInput setNormalContent:self.signNameCell.detailTextLabel.text];
    [BBInput showInput:^(NSString *inputContent) {
        
        self.signNameCell.detailTextLabel.text = inputContent;
        [self.tableView reloadData];
        
    }];
    
}








@end
