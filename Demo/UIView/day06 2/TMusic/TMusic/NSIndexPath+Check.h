//
//  NSIndexPath+Check.h
//  TMusic
//
//  Created by Alex Zhao on 13-8-9.
//  Copyright (c) 2013年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSIndexPath (Check)

- (BOOL) isEqualWithRow:(NSUInteger)row inSection:(NSUInteger)section;
- (BOOL) isEqualWithSection:(NSUInteger)section andRow:(NSUInteger)row;
@end
