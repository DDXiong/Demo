//
//  ViewController.m
//  Demo03-PlayVedio-Progress
//
//  Created by tarena on 15-7-30.
//  Copyright (c) 2015年 Tarena. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *vedioView;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;

//播放对象属性
@property (nonatomic, strong) AVPlayer *player;


@end

@implementation ViewController

//懒加载初始化player对象
- (AVPlayer *)player {
    if (!_player) {

        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"广告" ofType:@"mov"];
        NSURL *url = [NSURL fileURLWithPath:filePath];
        //创建AVAsset对象
        AVAsset *asset = [AVURLAsset URLAssetWithURL:url options:nil];
        //创建AVPlayerItem
        AVPlayerItem *item = [AVPlayerItem playerItemWithAsset:asset];
        _player = [AVPlayer playerWithPlayerItem:item];

        //添加通知
        [self addNotification];

        //监听视频的进度
        [self addProgressObserver];
    }

    return _player;
}

- (void)addNotification {

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playbackFinish) name:AVPlayerItemDidPlayToEndTimeNotification object:self.player.currentItem];
}

- (void)playbackFinish {
    NSLog(@"播放完毕");
}

- (void)addProgressObserver {
    //获取正在播放的那个item
    AVPlayerItem *item = self.player.currentItem;
    UIProgressView *progress = self.progressView;

    CMTime time = CMTimeMake(1, 1);

    [self.player addPeriodicTimeObserverForInterval:time queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
        //1.主线程

        float currentTime = CMTimeGetSeconds(time);
        float totalTime = CMTimeGetSeconds([item duration]);

        if (currentTime) {
            [progress setProgress:(currentTime/totalTime) animated:YES];
        }
    }];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    //创建视频播放层
    AVPlayerLayer *playLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    playLayer.frame = self.vedioView.frame;
    //设置填充属性
    playLayer.videoGravity = AVLayerVideoGravityResize;

    //添加到view的层上
    [self.vedioView.layer addSublayer:playLayer];

    //播放
    [self.player play];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
