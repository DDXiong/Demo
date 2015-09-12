//
//  TRAdsViewController.h
//  TMusic
//
//  Created by Alex Zhao on 13-8-13.
//  Copyright (c) 2013年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TRAdsViewController : UIViewController

@property (nonatomic) CGSize contentSize;

@property (strong, nonatomic) NSArray * ads;

@property (strong, nonatomic) UIPageControl * pageControl;
@property (strong, nonatomic) UIScrollView * scrollView;

@end
