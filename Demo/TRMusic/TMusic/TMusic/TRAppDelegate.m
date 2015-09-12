//
//  TRAppDelegate.m
//  TMusic
//
//  Created by Alex Zhao on 13-8-8.
//  Copyright (c) 2013年 Tarena. All rights reserved.
//

#import "TRAppDelegate.h"
#import "TRWelcomeViewController.h"
#import "TRCategories.h"

@implementation TRAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self setupAppearance];
    self.window.backgroundColor = [UIColor whiteColor];
    
    return YES;
}

- (void)setupAppearance
{
    UIEdgeInsets standardEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    
    // Navi
    UIImage * backgroundForNavigationBar = [[UIImage imageNamed:@"navigation_back.png"] resizableImageWithCapInsets:standardEdgeInsets
                                                                                                       resizingMode:UIImageResizingModeStretch];
    [[UINavigationBar appearance] setBackgroundImage:backgroundForNavigationBar
                                       forBarMetrics:UIBarMetricsDefault];
    
    NSDictionary * textAttributesOfTitleOnNavigationBar = @{UITextAttributeTextColor: [UIColor colorWithHex:0x222222],
                                                            UITextAttributeTextShadowColor: [UIColor clearColor]};
    
    [[UINavigationBar appearance] setTitleTextAttributes:textAttributesOfTitleOnNavigationBar];
    [[UINavigationBar appearance] setShadowImage:[UIImage imageNamed:@"clear.png"]];
    

    
    // Tabbar
    [[UITabBar appearance] setShadowImage:[UIImage imageNamed:@"clear.png"]];
    
    UIImage * backgroundForTabBar = [[UIImage imageNamed:@"tabbar_back.png"] resizableImageWithCapInsets:standardEdgeInsets
                                                                                            resizingMode:UIImageResizingModeStretch];
    [[UITabBar appearance] setBackgroundImage:backgroundForTabBar];
    
    UIImage * backgroundForSelectedTabBarItem = [[UIImage imageNamed:@"tabbar_selected_back.png"] resizableImageWithCapInsets:standardEdgeInsets
                                                                                                                 resizingMode:UIImageResizingModeStretch];
    [[UITabBar appearance] setSelectionIndicatorImage:backgroundForSelectedTabBarItem];
    
    [[UITabBarItem appearance] setTitlePositionAdjustment:UIOffsetMake(0, -2)];
    [[UITabBarItem appearance] setTitleTextAttributes:@{ UITextAttributeTextColor : [UIColor colorWithHex:0x999999] }
                                             forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{ UITextAttributeTextColor : [UIColor whiteColor] }
                                             forState:UIControlStateHighlighted];
    
    
//    UIImage * backgroundForBarButtonItem = [[UIImage imageNamed:@"button_bar_item_back.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(5, 5, 5, 5)
//                                                                                                            resizingMode:UIImageResizingModeStretch];
//    
//    [[UIBarButtonItem appearance] setBackgroundImage:backgroundForBarButtonItem forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
