//
//  ViewController.m
//  Demo01-Audio
//
//  Created by tarena on 15/8/26.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()
//音效SystemID
@property (nonatomic, assign) SystemSoundID systemSoundID;

//播放本地音频属性
@property (nonatomic, strong) AVAudioPlayer *player;

@end

@implementation ViewController

//懒加载初始化("本地"的音频)
- (AVAudioPlayer *)player {
    if (!_player) {
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"AllOfMe.mp3" withExtension:nil];
        _player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    }
    return _player;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}
- (IBAction)playShortSound:(id)sender {
    //1.获取音效的路径
    NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"audio" ofType:@"wav"];
    NSURL *soundURL = [NSURL fileURLWithPath:soundPath];
    
    //2.创建SystemSoundID
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)(soundURL), &_systemSoundID);
    
    //3.播放音效
    AudioServicesPlaySystemSound(_systemSoundID);
}

- (IBAction)playAudio:(id)sender {
    //播放音频(异步播放)
    [self.player play];
}
- (IBAction)pauseAudio:(id)sender {
    //正在播放
    if (self.player.playing) {
        [self.player pause];
    }
}
- (IBAction)cancelAudio:(id)sender {
    [self.player stop];
    
    self.player = nil;
}



@end
