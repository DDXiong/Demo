//
//  ViewController.m
//  Demo05-PlayVideo
//
//  Created by tarena on 15/8/26.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController ()
//播放视频的属性
@property (nonatomic, strong) MPMoviePlayerViewController *playerViewController;

@end

@implementation ViewController

//懒加载初始化
- (MPMoviePlayerViewController *)playerViewController {
    if (!_playerViewController) {
        NSString *videoPath = [[NSBundle mainBundle] pathForResource:@"广告" ofType:@"mov"];
        NSURL *url = [NSURL fileURLWithPath:videoPath];
        _playerViewController = [[MPMoviePlayerViewController alloc] initWithContentURL:url];
    }
    
    return _playerViewController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //监听视频的状态
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(mediaStateChange) name:MPMoviePlayerPlaybackStateDidChangeNotification object:nil];
    
    //监听视频是否播完
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(mediaDidFinish) name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
}

- (void)mediaStateChange {
    switch (self.playerViewController.moviePlayer.playbackState) {
        case MPMoviePlaybackStatePlaying:
            NSLog(@"正在播放");
            break;
        case MPMoviePlaybackStatePaused:
            NSLog(@"播放暂停");
            break;
        case MPMoviePlaybackStateStopped:
            NSLog(@"播放完毕");
            break;
            
        default:
            break;
    }
    
}

- (void)mediaDidFinish {
    NSLog(@"视频播放完毕");
}

- (IBAction)startPlayVideo:(id)sender {
    //弹出视频视图控制器
    [self presentViewController:self.playerViewController animated:YES completion:nil];
}


@end
