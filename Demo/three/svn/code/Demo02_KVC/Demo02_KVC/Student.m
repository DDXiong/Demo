//
//  Student.m
//  Demo02_KVC
//
//  Created by tarena on 15/9/2.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "Student.h"
#import "Course.h"

@implementation Student


- (instancetype)init
{
    self = [super init];
    if (self) {
        _family = [[Family alloc]init];
        
        //初始化学生的各门成绩
        Course *c1 = [[Course alloc]init];
        c1.courseName = @"语文";
        c1.courseScore = 100;
        
        Course *c2 = [[Course alloc]init];
        c2.courseName = @"数学";
        c2.courseScore = 90;
        
        _courses = @[c1,c2];
    }
    return self;
}







@end
