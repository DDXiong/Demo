//
//  UINavigationController+Wrapper.m
//  TMusic
//
//  Created by Alex Zhao on 13-8-21.
//  Copyright (c) 2013年 Tarena. All rights reserved.
//

#import "UINavigationController+Wrapper.h"

@implementation UINavigationController (Wrapper)

+ (id) navigationControllerWithRootViewController:(UIViewController *) viewController{
    return [[UINavigationController alloc] initWithRootViewController:viewController];
}

@end
