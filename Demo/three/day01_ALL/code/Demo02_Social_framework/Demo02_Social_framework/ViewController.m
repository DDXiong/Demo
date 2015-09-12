//
//  ViewController.m
//  Demo02_Social_framework
//
//  Created by tarena on 15/8/27.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import <Social/Social.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)shareToSina:(id)sender {
    //0.判断sina服务是否可用
    if (![SLComposeViewController isAvailableForServiceType:SLServiceTypeSinaWeibo]) {
        return;
    }
    
    //1.创建分享控制器
    SLComposeViewController *cvc = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeSinaWeibo];
    //设置初始化数据
    [cvc setInitialText:@"这是一段用于测试的文本"];
    [cvc addImage:[UIImage imageNamed:@"icon40"]];
    //2.显示控制器
    [self presentViewController:cvc animated:YES completion:nil];
    
    //3.设置block监听
    cvc.completionHandler = ^(SLComposeViewControllerResult result){
        if (result== SLComposeViewControllerResultDone) {
            NSLog(@"确认发送");
        }else{
            NSLog(@"取消发送");
        }
    };
    
    
    
    
}






@end
