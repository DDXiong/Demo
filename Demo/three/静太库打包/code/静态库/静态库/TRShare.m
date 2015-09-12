//
//  TRShare.m
//  静态库
//
//  Created by tarena on 15/8/28.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRShare.h"

@implementation TRShare

+ (NSInteger)sumWithNum1:(NSInteger)n1 andNum2:(NSInteger)n2
{
    return n1+n2;
}

+ (UIImage *)loadImage
{
    NSString *path =[[NSBundle mainBundle] pathForResource:@"china_flag" ofType:@"png" inDirectory:@"TRShare.bundle"];
    return [UIImage imageWithContentsOfFile:path];

}









@end
