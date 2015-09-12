//
//  TRShare.h
//  Demo1_静态库
//
//  Created by tarena on 15/8/28.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TRShare : NSObject

//计算两个整数的和
+(NSInteger)sumWithNum1:(NSInteger)n1 andNum2:(NSInteger)n2;

//加载一张图片
+(UIImage *)loadImage;

@end






