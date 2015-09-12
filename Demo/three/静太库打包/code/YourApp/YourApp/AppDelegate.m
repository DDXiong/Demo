//
//  AppDelegate.m
//  YourApp
//
//  Created by tarena on 15/8/28.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  
    return YES;
}

//如果是通过URL打开的本应用，则下面的方法会被执行
-(BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    //获取window中加载的根视图,也就是那个导航
    UINavigationController *navi = (UINavigationController *)self.window.rootViewController;
    //为了触发push第二个界面的segue，需要拿到
    //左边灰色背景的那个控制器的引用
    //而灰色的那个控制器是navi的根视图控制器
    //vc代表灰色的那个界面
    ViewController *vc = (ViewController *)navi.topViewController;
    
    //1.获取请求的URL地址
    NSString *urlString = [url absoluteString];
    
    //2.截取URL中的backScheme参数
    //并且将该参数传给 viewController
    NSRange range = [urlString rangeOfString:@"backscheme="];
    if (range.length>0) {
        NSInteger fromIndex = range.length+range.location;
        NSString *backScheme = [urlString substringFromIndex:fromIndex];
        //将获取的backScheme传递给灰色的viewContorller
        vc.backScheme = backScheme;
    }
    //3.判断地址中包含的信息为bbb则打开第二个页面
    if ([urlString hasPrefix:@"your://bbb"])
    {
        [vc performSegueWithIdentifier:@"pushWhiteSegue" sender:nil];
    }
    
    
    return YES;
}


//新的用于响应从URL跳转过来的方法
-(BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    //获取window中加载的根视图,也就是那个导航
    UINavigationController *navi = (UINavigationController *)self.window.rootViewController;
    //为了触发push第二个界面的segue，需要拿到
    //左边灰色背景的那个控制器的引用
    //而灰色的那个控制器是navi的根视图控制器
    //vc代表灰色的那个界面
    ViewController *vc = (ViewController *)navi.topViewController;
    
    //1.获取请求的URL地址
    NSString *urlString = [url absoluteString];
    
    //2.截取URL中的backScheme参数
    //并且将该参数传给 viewController
    NSRange range = [urlString rangeOfString:@"backscheme="];
    if (range.length>0) {
        NSInteger fromIndex = range.length+range.location;
        NSString *backScheme = [urlString substringFromIndex:fromIndex];
        //将获取的backScheme传递给灰色的viewContorller
        vc.backScheme = backScheme;
    }
    //3.判断地址中包含的信息为bbb则打开第二个页面
    if ([urlString hasPrefix:@"your://bbb"])
    {
        [vc performSegueWithIdentifier:@"pushWhiteSegue" sender:nil];
    }
    return YES;
}



@end
