//
//  ViewController.m
//  Demo03_调试静态库
//
//  Created by tarena on 15/8/28.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import "MyLib.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSInteger sum = [MyLib sumWithNum1:1 andNum2:1];
    NSLog(@"%ld",sum);
}

@end
