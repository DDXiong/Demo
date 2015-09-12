//
//  TRSelectedViewController.m
//  TMusic
//
//  Created by Alex Zhao on 13-8-8.
//  Copyright (c) 2013年 Tarena. All rights reserved.
//

#import "TRSelectedViewController.h"

#import "TRAdsViewController.h"
#import "TRAd.h"

@interface TRSelectedViewController () <UIScrollViewDelegate>

@property (strong, nonatomic) TRAdsViewController * adsViewController;

@end

@implementation TRSelectedViewController

#pragma mark - Initializations & Allocation

- (id)init
{
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self initialize];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)initialize
{
    
}

#pragma mark - View Controller Life-cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    [self initAds];
    [self initChannels];
}


#define CHANNEL_SPACE_FILLED_BY_ADS 2
#define CHANNELS_PER_PAGE           6
#define CHANNELS_PER_ROW            2

#define CHANNEL_GAP_SPACE           4.0
#define CHANNEL_ITEM_WIDTH          154.0
#define CHANNEL_ITEM_HEIGHT         142.0

#define AD_WIDTH                    312.0
#define AD_HEIGHT                   142.0

- (void)initAds
{
    self.adsViewController = [[TRAdsViewController alloc] init];
    TRAd * ad1 = [[TRAd alloc] init];
    ad1.imageName = @"ad01.png";
    TRAd * ad2 = [[TRAd alloc] init];
    ad2.imageName = @"ad02.png";
    TRAd * ad3 = [[TRAd alloc] init];
    ad3.imageName = @"ad03.png";
    TRAd * ad4 = [[TRAd alloc] init];
    ad4.imageName = @"ad04.png";
    TRAd * ad5 = [[TRAd alloc] init];
    ad5.imageName = @"ad05.png";
    self.adsViewController.ads = @[ad1, ad2, ad3, ad4, ad5];
    self.adsViewController.contentSize = CGSizeMake(AD_WIDTH, AD_HEIGHT);
    self.adsViewController.view.frame = CGRectMake(CHANNEL_GAP_SPACE, CHANNEL_GAP_SPACE, AD_WIDTH, AD_HEIGHT);
    [self.scrollView addSubview:self.adsViewController.view];
}

- (void)initChannels
{
    self.channels = @[@"channel01.png", @"channel02.png", @"channel03.png",
                      @"channel04.png", @"channel05.png", @"channel06.png",
                      @"channel07.png", @"channel08.png", @"channel09.png"];
    
    int numberOfPages = (self.channels.count + CHANNEL_SPACE_FILLED_BY_ADS - 1) / CHANNELS_PER_PAGE + 1;
    self.pageControl.numberOfPages = numberOfPages;
    self.pageControl.currentPage = 0;
    
    for (int i = 0; i < self.channels.count; i++) {
        NSString * channelImageNamed = self.channels[i];
        int index = i + CHANNEL_SPACE_FILLED_BY_ADS;
        
        int page = index / CHANNELS_PER_PAGE;
        int column = index % CHANNELS_PER_ROW;
        int row = (index % CHANNELS_PER_PAGE) / CHANNELS_PER_ROW;
        
        
        CGPoint pageOffset = CGPointMake(page * self.scrollView.frame.size.width, 0);
        
        CGRect frame = CGRectZero;
        frame.origin.x = pageOffset.x + CHANNEL_GAP_SPACE + (CHANNEL_GAP_SPACE + CHANNEL_ITEM_WIDTH) * column;
        frame.origin.y = CHANNEL_GAP_SPACE + (CHANNEL_GAP_SPACE + CHANNEL_ITEM_HEIGHT) * row;
        frame.size.width = CHANNEL_ITEM_WIDTH;
        frame.size.height = CHANNEL_ITEM_HEIGHT;
        
        UIImage * image = [UIImage imageNamed:channelImageNamed];
        UIImageView * imageView = [[UIImageView alloc] initWithImage:image];
        imageView.frame = frame;
        
        [self.scrollView addSubview:imageView];
    }
    
    CGSize size = self.scrollView.frame.size;
    size.width *= numberOfPages;
    self.scrollView.contentSize = size;
}

#pragma mark - Scroll View Delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint offset = scrollView.contentOffset;
    self.pageControl.currentPage = round(offset.x / scrollView.frame.size.width);
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    CGSize size = self.scrollView.frame.size;
    size.width *= self.pageControl.numberOfPages;
    self.scrollView.contentSize = size;
    
}


@end















