//
//  TRPlayingViewController.h
//  TMusic
//
//  Created by Alex Zhao on 13-8-21.
//  Copyright (c) 2013年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TRMusic.h"

@interface TRPlayingViewController : UIViewController

@property (nonatomic, strong) NSArray * playingList;

@property (nonatomic, strong) TRMusic * music;

@end
