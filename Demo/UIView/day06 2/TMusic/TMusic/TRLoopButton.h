//
//  TRLoopButton.h
//  TMusic
//
//  Created by Alex Zhao on 13-10-30.
//  Copyright (c) 2013年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TRLoopButton : UIButton

- (void)setLoopImages:(NSArray *)images;

- (void)setLoopImages:(NSArray *)images andHighlightedImages:(NSArray *)highlightedImages;

@property (nonatomic) NSUInteger currentIndex;

@end
