//
//  ViewController.m
//  Demo03_KVO
//
//  Created by tarena on 15/9/2.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"

@interface ViewController ()
@property(nonatomic,strong)Student *stu;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.stu = [[Student alloc]init];
    self.stu.sId = 10;
    
    /*
     第一个参：哪个对象做监控
     第二个参：监控stu的哪个属性
     第三个参：一旦属性发生改变，给监控者发消息时，需要传递的数值 是否 是 旧值以及 新值
     第四个参：发生改变时，发消息给监控者的额外消息
     
     注：谁是监控者，谁就会收到  变化 的消息
    */
    [self.stu addObserver:self forKeyPath:@"sId" options:NSKeyValueObservingOptionOld context:@"aaaa"];
    
    self.stu.sId = 30;
    self.stu.sId = 40;

}

//此方法是编写在 监控对象的类内，因为现在把self
//控制器变成了监控者，所以此方法就写在控制器内
//只要sId发生了改变，下面的这个方法就会自动执行
//监控者立即就会收到 属性已经改了 这件事
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    id newValue = [object valueForKeyPath:keyPath];
    
    NSLog(@"%@对象的%@属性发生了变化\n 数值如下:旧的%@,新的%@ \n额外传入的其他值:%@",object,keyPath,change[@"old"],newValue,context);
}

- (void)dealloc
{
    [self.stu removeObserver:self forKeyPath:@"sId"];
}

/*
 KVO的本质：
 在执行了addObserver方法之后，系统自动生成了一个
 Student类型的子类，大概叫NSKVONotifying_Student
 并且重写了这个子类的setter方法，在方法中，不仅仅
 调用了以前的父类中的赋值方法，通知从父类中获取了
 监控者对象的引用，于是子类调用了 监控者对象的observerValueForkeyPath方法
 为什么能调用这个方法呢？
 在执行addObserver方法前，stu对象中有一个isa指针
 这个指针此时是指向student类型的实例的
 但执行完addObserver方法后，stu对象中的isa指针
 就指向了系统新创建的这个子类的实例
 所以，再去为sId属性赋值时，isa指向谁就调用谁的方法
 所以 就调用了子类的重写的setter方法，于是就又调用了
 监控者的observerValueForkeyPath 所以 感觉自动执行
*/










@end
