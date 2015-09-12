//
//  ViewController.m
//  Demo01_测试framework
//
//  Created by tarena on 15/8/31.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import <FrameworkLib/TRShare.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"[%ld]",[TRShare sumWithNum1:1 andNum2:1]);
  
}



@end
