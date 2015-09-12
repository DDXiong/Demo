//
//  ViewController.m
//  Demo01-OAuth
//
//  Created by tarena on 15/8/27.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"

@interface ViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置webView的代理
    self.webView.delegate = self;
    
    //1.加载登录页面
    //请求地址：https://api.weibo.com/oauth2/authorize
    /*
     client_id	true	string	申请应用时分配的AppKey。
     redirect_uri	true	string	授权回调地址，站外应用需与设置的回调地址一致，站内应用需填写canvas page的地址。
     */
    NSURL *url = [NSURL URLWithString:@"https://api.weibo.com/oauth2/authorize?client_id=2872490788&redirect_uri=http://"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
   
}


#pragma mark - UIWebViewDelegate
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    // 1.获取url
    NSString *url = request.URL.absoluteString;
    
    // 2.判断是否包含code
    NSRange range = [url rangeOfString:@"code="];
    if (range.length !=0) {
        //获取code=后面的参数值
        NSInteger fromIndex = range.location+range.length;
        NSString *code = [url substringFromIndex:fromIndex];
        
        // 利用code换取一个access token
        [self accessTokenWithCode:code];
        
    }
    return  YES;
}

//自定义的方法
//作用：根据传入的code换取access token
/*
 url:https://api.weibo.com/oauth2/access_token
 参数:
 client_id	true	string	申请应用时分配的AppKey。
 client_secret	true	string	申请应用时分配的AppSecret。
 grant_type	true	string	请求的类型，填写authorization_code
 code	true	string	调用authorize获得的code值。
 redirect_uri	true	string	回调地址，需需与注册应用里的回调地址一致。
*/
-(void)accessTokenWithCode:(NSString *)code
{
    //1.获取请求管理者
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    //2.构建请求参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"client_id"]=@"2872490788";
    params[@"client_secret"]=@"51a5e7d39e9b86f37ae9e7c23776f8a6";
    params[@"grant_type"]=@"authorization_code";
    params[@"code"]=code;
    params[@"redirect_uri"]=@"http://";
    //3.发送请求
    [mgr POST:@"https://api.weibo.com/oauth2/access_token" parameters:params success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {
        //将第一次换回的accessToken保存到沙盒中
        //获取沙盒路径
        NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        NSString *filePath = [doc stringByAppendingPathComponent:@"account.plist"];
        //将返回的responseObject写入到document文件下地account.plist文件中
        [responseObject writeToFile:filePath atomically:YES];
        //跳转到首页
        UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"mainVC"];
        [self presentViewController:vc animated:YES completion:nil];
        //NSLog(@"%@",responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"请求失败%@",error);
    }];
    
}







@end
