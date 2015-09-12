//
//  TRWelcomeViewController.m
//  TMusic
//
//  Created by Alex Zhao on 13-8-8.
//  Copyright (c) 2013年 Tarena. All rights reserved.
//

#import "TRWelcomeViewController.h"

#import "TRMusicViewController.h"
#import "TRSelectedViewController.h"
#import "TRStoreViewController.h"
#import "TRMoreViewController.h"

@interface TRWelcomeViewController () <UIScrollViewDelegate>

@property (strong, nonatomic) UIScrollView * scrollView;

@end

@implementation TRWelcomeViewController

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
    
    self.view.backgroundColor = [UIColor blackColor];
    
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.frame = self.view.bounds;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.scrollView];
    
    // ad data
    NSArray * ads = @[@"Welcome_3.0_1.jpg", @"Welcome_3.0_2.jpg", @"Welcome_3.0_3.jpg", @"Welcome_3.0_4.jpg", @"Welcome_3.0_5.jpg"];
    
    // config scroll view and image views;
    for (int i = 0 ; i < ads.count; i++) {
        UIImage * image = [UIImage imageNamed:ads[i]];
        
        UIImageView * imageView = [[UIImageView alloc] initWithImage:image];
        CGRect frame = self.scrollView.frame;
        frame.origin.x = i * frame.size.width;
        frame.origin.y = 0;
        imageView.frame = frame;
        [self.scrollView addSubview:imageView];
        
        if (i == ads.count - 1) {
            UIButton * next = [UIButton buttonWithType:UIButtonTypeCustom];
            [next addTarget:self action:@selector(start:) forControlEvents:UIControlEventTouchUpInside];
            next.frame = imageView.frame;
            [self.scrollView addSubview:next];
        }
    }
    
    CGSize size = self.scrollView.frame.size;
    size.width *= ads.count;
    self.scrollView.contentSize = size;
    self.scrollView.delegate = self;
    
    // config the page control
    UIPageControl * pageControl = [[UIPageControl alloc] init];
    pageControl.frame = CGRectMake(0, self.view.frame.size.height - 40, self.view.frame.size.width, 20);
    pageControl.numberOfPages = ads.count;
    pageControl.currentPage = 0;
    pageControl.userInteractionEnabled = NO;
    self.pageControl = pageControl;
    [self.view addSubview:pageControl];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    self.pageControl.currentPage = round(scrollView.contentOffset.x / scrollView.frame.size.width);
}

- (void)start:(id)sender {
    UITabBarController * tabBarController = [self.storyboard instantiateViewControllerWithIdentifier:@"MainTabController"];
    
    NSArray * tabBarItems = tabBarController.tabBar.items;
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 7.0) {
        UITabBarItem * myMusicTabBarItem = tabBarItems[0];
        [myMusicTabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"tabbar_item_my_music_selected.png"]
                        withFinishedUnselectedImage:[UIImage imageNamed:@"tabbar_item_my_music.png"]];
        
        UITabBarItem * selectedTabBarItem = tabBarItems[1];
        [selectedTabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"tabbar_item_selected_selected.png"]
                         withFinishedUnselectedImage:[UIImage imageNamed:@"tabbar_item_selected.png"]];
        
        UITabBarItem * storeTabBarItem = tabBarItems[2];
        [storeTabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"tabbar_item_store_selected.png"]
                      withFinishedUnselectedImage:[UIImage imageNamed:@"tabbar_item_store.png"]];
        
        UITabBarItem * moreTabBarItem = tabBarItems[3];
        [moreTabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"tabbar_item_more_selected.png"]
                     withFinishedUnselectedImage:[UIImage imageNamed:@"tabbar_item_more.png"]];
        
    } else {
        UITabBarItem * myMusicTabBarItem = tabBarItems[0];
        myMusicTabBarItem.image = [UIImage imageNamed:@"tabbar_item_my_music.png"];
        myMusicTabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_item_my_music_selected.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        UITabBarItem * selectedTabBarItem = tabBarItems[1];
        selectedTabBarItem.image = [UIImage imageNamed:@"tabbar_item_selected.png"];
        selectedTabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_item_selected_selected.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        UITabBarItem * storeTabBarItem = tabBarItems[2];
        storeTabBarItem.image = [UIImage imageNamed:@"tabbar_item_store.png"];
        storeTabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_item_store_selected.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        UITabBarItem * moreTabBarItem = tabBarItems[3];
        moreTabBarItem.image = [UIImage imageNamed:@"tabbar_item_more.png"];
        moreTabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_item_more_selected.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    
    
    
    tabBarController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:tabBarController animated:YES completion:nil];
}

@end
