//
//  AppDelegate.m
//  Demo01_UserNotification
//
//  Created by tarena on 15/9/2.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    if ([UIDevice currentDevice].systemVersion.doubleValue >= 8.0) {
        // 以下代码会实现的效果是：
        // 第一次运行程序，系统弹出一个提示框
        // 询问用户是否允许接收通知
        UIUserNotificationType type = UIUserNotificationTypeAlert|UIUserNotificationTypeSound|UIUserNotificationTypeBadge;
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:type categories:nil];
        [application registerUserNotificationSettings:settings];
    }
    
    //如果是因为点击查看了通知而启动了应用程序
    //那么通知的信息都会存在launchOption参数中
    UILocalNotification *note = launchOptions[UIApplicationLaunchOptionsLocalNotificationKey];
    if (note!=nil) {//点通知进来的
        UILabel *label = [[UILabel alloc]init];
        label.frame = CGRectMake(0, 40, 300, 200);
        label.backgroundColor = [UIColor blueColor];
        label.numberOfLines = 0;
        label.font =[UIFont systemFontOfSize:30];
        label.textColor = [UIColor whiteColor];
        label.text = [NSString stringWithFormat:@"%@",note.userInfo];
        [self.window.rootViewController.view addSubview:label];
    }
    return YES;
}

/*
 1.app在前台，通知到了，直接自动执行该方法
 2.app在后台，通知到了，点击查看通知时，该方法才执行
 3.app已经退出，通知到了，点击查看通知，此方法不执行，但是didFinishLaunching方法一定会被执行，通知传入的参数也可以在launching方法中获取到
 
*/
-(void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    UILabel *label = [[UILabel alloc]init];
    label.frame = CGRectMake(0, 250, 300, 200);
    label.backgroundColor = [UIColor grayColor];
    label.numberOfLines = 0;
    label.font =[UIFont systemFontOfSize:30];
    label.textColor = [UIColor whiteColor];
    //alertBody用于存储显示的通知的文字内容
    //userInfo用于存储额外要传递的通知内容
    label.text = [NSString stringWithFormat:@"%@",notification.userInfo];
    [self.window.rootViewController.view addSubview:label];
    
    //去掉应用程序图标中出现的红色数字提醒
    [application setApplicationIconBadgeNumber:0];
}




@end
