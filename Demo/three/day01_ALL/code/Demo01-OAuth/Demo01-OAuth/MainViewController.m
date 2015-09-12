//
//  MainViewController.m
//  Demo01-OAuth
//
//  Created by tarena on 15/8/27.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "MainViewController.h"
#import "AFNetworking.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UILabel *screenNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //获取用户信息（昵称和头像）
    [self loadUserInfo];
}

-(void)loadUserInfo
{
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    //从沙盒中获取account.plist文件的内容
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *filePath = [doc stringByAppendingPathComponent:@"account.plist"];
    NSDictionary *account = [NSDictionary dictionaryWithContentsOfFile:filePath];
    //将account中的信息存到参数中
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"access_token"] = account[@"access_token"];
    params[@"uid"] = account[@"uid"];
    
    //发送get请求
    [mgr GET:@"https://api.weibo.com/2/users/show.json" parameters:params success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {
        //发送成功
        //从responseObject中获取昵称和头像
        self.screenNameLabel.text = responseObject[@"screen_name"];
        //显示头像
        NSURL *url = [NSURL URLWithString:responseObject[@"profile_image_url"]];
        NSData *headerData = [NSData dataWithContentsOfURL:url];
        self.headerImageView.image = [UIImage imageWithData:headerData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"请求失败%@",error);
    }];
}

//发送一个消息
- (IBAction)sendNewMsg:(id)sender {
    //从沙盒中获取account.plist文件的内容
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *filePath = [doc stringByAppendingPathComponent:@"account.plist"];
    NSDictionary *account = [NSDictionary dictionaryWithContentsOfFile:filePath];
    
    // 构建 请求管理者 ，发送请求
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"access_token"] = account[@"access_token"];
    params[@"status"] = self.textField.text;
    
    //发送post请求
    [mgr POST:@"https://api.weibo.com/2/statuses/update.json" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"发送成功");
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"发送失败%@",error);
    }];
    
}






@end
