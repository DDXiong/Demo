//
//  ViewController.m
//  Demo05_Runtime
//
//  Created by tarena on 15/9/2.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Student *stu = [[Student alloc]init];
    stu.age  = 20;
    stu.name = @"张三";
    stu.height = 178;
    
    [stu presentation];
}

@end
