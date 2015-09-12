//
//  ViewController.m
//  Demo04-Record-Play
//
//  Created by tarena on 15/8/26.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()
//播放
@property (nonatomic, strong) AVAudioPlayer *player;
//录制
@property (nonatomic, strong) AVAudioRecorder*recorder;
//bool显示是否正在录制
@property (nonatomic, assign) BOOL isRecording;
//录制之后的文件路径
@property (nonatomic, strong) NSURL *recordedURL;
@property (weak, nonatomic) IBOutlet UIButton *recordButton;
@property (weak, nonatomic) IBOutlet UIButton *playButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化
    self.isRecording = NO;
    //沙盒中的xxx/tmp/RecordedFile目录下
    self.recordedURL = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingString:@"RecordedFile"]];
    NSLog(@"录制文件的路径：%@", self.recordedURL);
    
    //初始化播放player对象
    NSError *error = nil;
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:self.recordedURL error:&error];
    
    //第一次没有录制的时候，self.recordedURL为空，设置播放按钮不可点击
    if (self.recordedURL == nil) {
        [self.playButton setEnabled:NO];
        self.playButton.titleLabel.alpha = 0.5;
    }
    
    //AVAudioSession分类
    AVAudioSession *session = [AVAudioSession sharedInstance];
    [session setCategory:AVAudioSessionCategoryPlayAndRecord error:&error];
    [session setActive:YES error:&error];
    
}
//点击录制按钮(一个按钮两个功能)
- (IBAction)recordAudio:(id)sender {
    //如果点击／开始录制;
    if(!self.isRecording) {
        //设置正在录制的bool为yes
        self.isRecording = YES;
        //录制按钮的文本设置成"停止"
        [self.recordButton setTitle:@"停止" forState:UIControlStateNormal];
        
        //严谨的做法：设置播放按钮不可点击和透明度
        [self.playButton setEnabled:NO];
        self.playButton.titleLabel.alpha = 0.2;
        
        //开始录制操作
        NSError *error = nil;
        self.recorder = [[AVAudioRecorder alloc] initWithURL:self.recordedURL settings:nil error:&error];
        if (!error) {
            //执行录制的操作
            [self.recorder prepareToRecord];
            [self.recorder record];
            //严谨做法：设置player对象为空
            self.player = nil;
        }
        
    } else {
        //点击“停止”录制
        //设置正在录制的bool为NO
        self.isRecording = NO;
        //录制按钮的文本设置成"录制"
        [self.recordButton setTitle:@"录制" forState:UIControlStateNormal];
        
        //严谨的做法：设置播放按钮不可点击和透明度
        [self.playButton setEnabled:YES];
        self.playButton.titleLabel.alpha = 1.0;
        
        //停止录制
        [self.recorder stop];
        
        //可以播放对象
        NSError *error = nil;
        self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:self.recordedURL error:&error];
    }
}

//播放／暂停按钮
- (IBAction)playAudio:(id)sender {
    //目的暂停播放
    if ([self.player isPlaying]) {
        [self.player pause];
        //按钮的文本设置成"播放"
        [self.playButton setTitle:@"播放" forState:UIControlStateNormal];
    } else {
        //目的播放
        [self.player play];
        //按钮的文本设置成"暂停"
        [self.playButton setTitle:@"暂停" forState:UIControlStateNormal];
    }
}


@end
