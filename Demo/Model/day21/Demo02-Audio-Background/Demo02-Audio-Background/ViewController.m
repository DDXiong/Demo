//
//  ViewController.m
//  Demo02-Audio-Background
//
//  Created by tarena on 15/8/26.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()
//session(会话)
@property (nonatomic, strong) AVAudioSession *audioSession;

//player
@property (nonatomic, strong) AVAudioPlayer *player;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.创建audio session(配置音频播放的设置)
    [self setUpSession];
    
    //2.创建AVAudioPlayer对象
    [self setUpAudioPlayer];
    
    //3.播放
    [self startPlayAudio];
}

- (void)setUpSession {
    //1.获取session的单例对象
    self.audioSession = [AVAudioSession sharedInstance];
    
    //2.激活session
    NSError *error = nil;
    [self.audioSession setActive:YES error:&error];
    
    //3.设置session的分类(category)
    [self.audioSession setCategory:AVAudioSessionCategoryPlayback error:&error];
    if (error) {
        NSLog(@"无法设置session分类:%@", error.userInfo);
    }
}

- (void)setUpAudioPlayer {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"AllOfMe.mp3" ofType:nil];
    NSURL *url = [NSURL fileURLWithPath:filePath];
    NSError *error = nil;
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
}

- (void)startPlayAudio {
    //从磁盘(沙盒)读取到内存
    if([self.player prepareToPlay]) {
        [self.player play];
    }
}


@end
