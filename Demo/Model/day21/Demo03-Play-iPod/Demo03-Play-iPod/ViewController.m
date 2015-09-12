//
//  ViewController.m
//  Demo03-Play-iPod
//
//  Created by tarena on 15/8/26.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
//获取“音乐”app中的歌曲列表(数组/四个属性：专辑封面图片/歌手名字/歌曲名字/专辑名字)
- (IBAction)getAllMusic:(id)sender {
    
    //1.创建查询类(从“音乐”app中)
    MPMediaQuery *query = [[MPMediaQuery alloc] init];
    //1.1 给定某个条件(Predicate:谓词)
    //查询所有的歌曲数据
    MPMediaPropertyPredicate *predicate = [MPMediaPropertyPredicate predicateWithValue:[NSNumber numberWithInt:MPMediaTypeMusic] forProperty:MPMediaItemPropertyMediaType];
    //1.2 将predicate和query绑定
    [query addFilterPredicate:predicate];
    
    //2.通过查询类来获取所有的歌曲列表
    NSArray *musicArray = [query items];
    
    //2.1循环打印musicArray中的数据
    for (MPMediaItem *item in musicArray) {
        //歌手名字
        NSString *artistName = [item valueForProperty:MPMediaItemPropertyArtist];
        
        //歌曲名字
        NSString *musicName = [item valueForProperty:MPMediaItemPropertyTitle];
        
        //专辑名字
        NSString *albumName = [item valueForProperty:MPMediaItemPropertyAlbumTitle];
        
        //获取专辑封面
        MPMediaItemArtwork *artwork = [item valueForProperty:MPMediaItemPropertyArtwork];
        //设置专辑封面的图片大小
        UIImage *image = [artwork imageWithSize:CGSizeMake(60, 60)];
        
        NSLog(@"歌手名字：%@; 歌曲名字：%@; 专辑名字：%@; 专辑封面图片：%@", artistName, musicName, albumName, image);
        
        //3.TODO: 播放AVAudioPlayer/[tableView reloadData]
        /**
         AVAudioPlayer *player;
         [player playerWithPlayerItem:];
         */
    }
}

- (IBAction)playMusicOnLine:(id)sender {
    //NSURL -> AVAsset -> AVPlayerItem
    NSURL *url = [NSURL URLWithString:@"xxxx/xxx/xxx.mp3"];
    AVAsset *musicAsset = [AVURLAsset URLAssetWithURL:url options:nil];
    AVPlayerItem *item = [AVPlayerItem playerItemWithAsset:musicAsset];
    AVPlayer *player = [[AVPlayer alloc] init];
    player = [AVPlayer playerWithPlayerItem:item];
    //播放
    [player play];
}



@end
