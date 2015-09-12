//
//  TRMusicGroup.h
//  TMusic
//
//  Created by Alex Zhao on 13-8-21.
//  Copyright (c) 2013年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRMusic.h"

typedef NS_ENUM(NSInteger, TRMusicGroupState) {
    TRMusicGroupStateNormal,	
    TRMusicGroupStateDownloading,		
    TRMusicGroupStateDownloaded
};

@interface TRMusicGroup : NSObject

@property (nonatomic, copy) NSString * name;

@property (nonatomic, strong) NSArray * musics;

@property (nonatomic) TRMusicGroupState state;

+ (NSArray *) fakeData;

@end
