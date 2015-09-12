//
//  NSIndexPath+Check.m
//  TMusic
//
//  Created by Alex Zhao on 13-8-9.
//  Copyright (c) 2013年 Tarena. All rights reserved.
//

#import "NSIndexPath+Check.h"

@implementation NSIndexPath (Check)

- (BOOL) isEqualWithRow:(NSUInteger)row inSection:(NSUInteger)section
{
    return self.row == row && self.section == section;
}


- (BOOL) isEqualWithSection:(NSUInteger)section andRow:(NSUInteger)row{
    return [self isEqualWithRow:row inSection:section];
}

@end
