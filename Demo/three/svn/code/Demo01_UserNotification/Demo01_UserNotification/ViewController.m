//
//  ViewController.m
//  Demo01_UserNotification
//
//  Created by tarena on 15/9/2.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)sendLocalNotification:(id)sender
{
    //1.创建本地通知对象
    UILocalNotification *note = [[UILocalNotification alloc]init];
    
    //2.设置通知的一些属性
    note.fireDate = [NSDate dateWithTimeIntervalSinceNow:10];
    note.alertBody = @"这是一条新的通知";
    note.userInfo = @{@"name":@"张三",@"age":@20};
    note.applicationIconBadgeNumber = 3;
    
    //3.将通知添加到应用程序的日程清单中
    UIApplication *app = [UIApplication sharedApplication];
    [app scheduleLocalNotification:note];
}











- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
