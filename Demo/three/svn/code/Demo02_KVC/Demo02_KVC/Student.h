//
//  Student.h
//  Demo02_KVC
//
//  Created by tarena on 15/9/2.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Family.h"

@interface Student : NSObject
{
    @private
    float _score;
}

@property(nonatomic)int  sId;

//对象类型的属性
@property(nonatomic,strong)Family *family;

//数组类型的属性
@property(nonatomic,strong)NSArray *courses;

@end








