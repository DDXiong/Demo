//
//  HMPersonTool.h
//  03-模糊查询
//
//  Created by apple on 14-7-24.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HMPerson;

@interface HMPersonTool : NSObject
/**
 *  保存一个联系人
 */
+ (void)save:(HMPerson *)person;

/**
 *  查询所有的联系人
 */
+ (NSArray *)query;
+ (NSArray *)queryWithCondition:(NSString *)condition;
@end
