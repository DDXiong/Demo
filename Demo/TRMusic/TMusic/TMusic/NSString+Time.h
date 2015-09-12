//
//  NSString+Time.h
//  TMusic
//
//  Created by 赵 哲 on 13-7-3.
//  Copyright (c) 2013年 Zhe Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Time)

+ (NSString *) stringWithMinuteAndSecondTime:(NSTimeInterval) timeInterval;

@end
