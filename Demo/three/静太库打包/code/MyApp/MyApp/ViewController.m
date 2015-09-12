//
//  ViewController.m
//  MyApp
//
//  Created by tarena on 15/8/28.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

//点击按钮后跳转到Your App
- (IBAction)gotoYourApp:(id)sender {
    // 1.获取application对象
    UIApplication *app = [UIApplication sharedApplication];
    
    // 2.创建要打开的应用程序的URL
    NSURL *url = [NSURL URLWithString:@"your://aaa?backscheme=my"];
    
    // 3.判断是否可以打开另一个应用
    if ([app canOpenURL:url]) {
        // 能，就打开
        [app openURL:url];
    }else{
        NSLog(@"打开应用失败");
    }
}

// 打开Your App的第二个界面
- (IBAction)gotoYourAppSecond:(id)sender {
    // 1.获取application对象
    UIApplication *app = [UIApplication sharedApplication];
    
    // 2.创建要打开的应用程序的URL
    NSURL *url = [NSURL URLWithString:@"your://bbb?backscheme=my"];
    
    // 3.判断是否可以打开另一个应用
    if ([app canOpenURL:url]) {
        // 能，就打开
        [app openURL:url];
    }else{
        NSLog(@"打开应用失败");
    }
}







@end
