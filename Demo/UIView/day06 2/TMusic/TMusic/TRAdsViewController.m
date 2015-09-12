//
//  TRAdsViewController.m
//  TMusic
//
//  Created by Alex Zhao on 13-8-13.
//  Copyright (c) 2013年 Tarena. All rights reserved.
//

#import "TRAdsViewController.h"
#import "TRAd.h"

@interface TRAdsViewController ()

//@property (strong, nonatomic) NSArray * imageViews;

@end

@implementation TRAdsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.scrollView = [[UIScrollView alloc] init];
    CGRect frame = CGRectZero;
    frame.size = self.contentSize;
    self.scrollView.frame = frame;
    
    CGSize size = self.scrollView.frame.size;
    size.width *= self.ads.count;
    self.scrollView.contentSize = size;
    
    for(int i = 0 ; i < self.ads.count; i++ ){
        TRAd * adName = self.ads[i];
        UIImage * image = [UIImage imageNamed:adName.imageName];
        UIImageView * imageView = [[UIImageView alloc] initWithImage:image];
        CGRect frame = CGRectZero;
        frame.size = self.contentSize;
        frame.origin.x = frame.size.width * i;
        imageView.frame = frame;
        [self.scrollView addSubview:imageView];
    }
    
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.pagingEnabled = YES;
    
    [self.view addSubview:self.scrollView];
    
    self.pageControl = [[UIPageControl alloc] init];
    self.pageControl.frame = CGRectMake(0, self.view.bounds.size.height - 40, self.view.bounds.size.width, 20);
    self.pageControl.numberOfPages = self.ads.count;
    [self.view addSubview:self.pageControl];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
