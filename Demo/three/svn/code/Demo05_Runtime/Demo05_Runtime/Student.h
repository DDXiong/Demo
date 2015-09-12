//
//  Student.h
//  Demo05_Runtime
//
//  Created by tarena on 15/9/2.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject

@property(nonatomic,strong)NSString *name;

@property(nonatomic)int age;

@property(nonatomic)double height;

@property(nonatomic,strong)NSString *sex;

//自我介绍:将所有属性遍历一次
-(void)presentation;


@end
