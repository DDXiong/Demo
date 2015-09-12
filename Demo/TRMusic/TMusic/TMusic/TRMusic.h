//
//  TRMusic.h
//  TMusic
//
//  Created by Alex Zhao on 13-8-21.
//  Copyright (c) 2013年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRMusic : NSObject

@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * album;
@property (nonatomic, copy) NSString * artist;

@property (nonatomic) NSTimeInterval duration;

@property (nonatomic) BOOL highQuality;
@property (nonatomic) BOOL downloaded;

@end
