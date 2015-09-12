//
//  ViewController.m
//  Demo02_KVC
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
    
    //点语法的赋值和读取
    stu.sId = 10;
    NSLog(@"[%d]",stu.sId);
    
    //使用setter getter方式的赋值和读取
    [stu setSId:20];
    NSLog(@"[%d]",[stu sId]);
    
    
    //使用KVC赋值 读取
    [stu setValue:@30 forKey:@"sId"];
    NSLog(@"[%@]",[stu valueForKey:@"sId"]);
    
    //使用KVC为私有的成员赋值 和读取
    [stu setValue:@90.5 forKey:@"score"];
    NSLog(@"私有:[%f]",[[stu valueForKey:@"score"] floatValue]);
    
    
    //访问ID类型的属性
    id obj = [[Student alloc]init];
    [obj setValue:@40 forKey:@"sId"];
    NSLog(@"[%@]",[obj valueForKey:@"sId"]);
    
    //访问学生对象的家庭联系人姓名
    //对于多层级的属性访问，使用keyPath的这一组方法
    //value:forKey能实现的效果
    //value:forKeyPath都能实现
    [stu setValue:@"张三" forKeyPath:@"family.fName"];
    NSLog(@"[%@]",[stu valueForKeyPath:@"family.fName"]);
    
    
    //访问对象的数组属性
    NSLog(@"数组:[%@]",[stu valueForKeyPath:@"courses.courseName"]);
    
    //KVC的常用特殊运算符号
    NSLog(@"sum:[%@]",[stu valueForKeyPath:@"courses.@sum.courseScore"]);
    
    NSLog(@"最高分:[%@]",[stu valueForKeyPath:@"courses.@max.courseScore"]);
    
    //返回数组中元素的个数
    NSLog(@"总的课程数:[%@]",[stu valueForKeyPath:@"courses.@count"]);
}


@end
