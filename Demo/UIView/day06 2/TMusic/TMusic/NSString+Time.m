//
//  NSString+Time.m
//  TMusic
//
//  Created by 赵 哲 on 13-7-3.
//  Copyright (c) 2013年 Zhe Zhao. All rights reserved.
//

#import "NSString+Time.h"

@implementation NSString (Time)

+ (NSString *) stringWithMinuteAndSecondTime:(NSTimeInterval) timeInterval
{
    return [NSString stringWithFormat:@"%02d:%02d",(int)timeInterval / 60,(int)timeInterval % 60];
}

@end
