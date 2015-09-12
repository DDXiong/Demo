//
//  Student.m
//  Demo05_Runtime
//
//  Created by tarena on 15/9/2.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "Student.h"
#import <objc/runtime.h>

@implementation Student



- (void)presentation
{
    //class_copyIvarList可以获取某种类型
    //的全部成员变量
    
    unsigned int count = 0;
    // Ivar代表的就是成员变量
    // *ivars指向了一个数组的首地址
    // 且数组中的每一个元素都是 Ivar类型的
    Ivar *ivars = class_copyIvarList([Student class], &count);
    
    //遍历ivars数组中的所有的Ivar
    for (int i=0; i<count; i++) {
        //从数组中依次取出每一个 用于描述成员变量的
        //数据到Ivar类型中
        Ivar ivar = ivars[i];
        //获取属性名
        const char *name = ivar_getName(ivar);
        NSString *key = [NSString stringWithUTF8String:name];
        //想根据属性名获取属性值，使用KVC
        id value = [self valueForKey:key];
        NSLog(@"%@,%@",key,value);
    }
    
}








@end
