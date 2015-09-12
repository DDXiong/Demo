//
//  TRMusicGroup.m
//  TMusic
//
//  Created by Alex Zhao on 13-8-21.
//  Copyright (c) 2013年 Tarena. All rights reserved.
//

#import "TRMusicGroup.h"

@implementation TRMusicGroup

+ (NSArray *) fakeData
{
    NSMutableArray * musics = nil;
    TRMusic * music = nil;
    
    musics = [NSMutableArray array];
    
    music = [[TRMusic alloc] init];
    music.name          = @"Burn";
    music.album         = @"Burn - Single";
    music.artist        = @"Ellie Goulding";
    music.duration      = [self durationWithMinutes:3 andSeconds:51];
    music.downloaded    = YES;
    music.highQuality   = NO;
    [musics addObject:music];
    
    music = [[TRMusic alloc] init];
    music.name          = @"Summertime Sadness (Cedric Gervais Remix)";
    music.album         = @"Summertime Sadness (Cedric Gervais Remix) - Single";
    music.artist        = @"Lana Del Rey";
    music.duration      = [self durationWithMinutes:3 andSeconds:51];
    music.downloaded    = YES;
    music.highQuality   = YES;
    [musics addObject:music];
    
    music = [[TRMusic alloc] init];
    music.name          = @"Spectrum";
    music.album         = @"Clarity";
    music.artist        = @"Zedd";
    music.duration      = [self durationWithMinutes:3 andSeconds:51];
    music.downloaded    = YES;
    music.highQuality   = YES;
    [musics addObject:music];
    
    music = [[TRMusic alloc] init];
    music.name          = @"It's Time";
    music.album         = @"It’s Time";
    music.artist        = @"Imagine Dragons";
    music.duration      = [self durationWithMinutes:3 andSeconds:51];
    music.downloaded    = YES;
    music.highQuality   = YES;
    [musics addObject:music];
    
    music = [[TRMusic alloc] init];
    music.name          = @"Dancing in The Moonlight";
    music.album         = @"Dancing In The Moonlight: The Best Of Toploader";
    music.artist        = @"Toploader";
    music.duration      = [self durationWithMinutes:3 andSeconds:51];
    music.downloaded    = YES;
    music.highQuality   = YES;
    [musics addObject:music];
    
    music = [[TRMusic alloc] init];
    music.name          = @"Thinking About You (feat. Ayah Marar)";
    music.album         = @"18 Months (Deluxe Edition)";
    music.artist        = @"Calvin Harris";
    music.duration      = [self durationWithMinutes:3 andSeconds:51];
    music.downloaded    = YES;
    music.highQuality   = YES;
    [musics addObject:music];
    
    music = [[TRMusic alloc] init];
    music.name          = @"You Make Me (feat. Salem Al Fakir)";
    music.album         = @"True";
    music.artist        = @"Avicii";
    music.duration      = [self durationWithMinutes:3 andSeconds:51];
    music.downloaded    = YES;
    music.highQuality   = NO;
    [musics addObject:music];
    
    music = [[TRMusic alloc] init];
    music.name          = @"Safe and Sound";
    music.album         = @"Capital Cities EP";
    music.artist        = @"Capital Cities";
    music.duration      = [self durationWithMinutes:3 andSeconds:51];
    music.downloaded    = YES;
    music.highQuality   = NO;
    [musics addObject:music];
    
    music = [[TRMusic alloc] init];
    music.name          = @"Reaching Out";
    music.album         = @"Welcome Reality (Deluxe Version)";
    music.artist        = @"nero";
    music.duration      = [self durationWithMinutes:3 andSeconds:51];
    music.downloaded    = YES;
    music.highQuality   = NO;
    [musics addObject:music];
    
    music = [[TRMusic alloc] init];
    music.name          = @"Recover";
    music.album         = @"Recover - EP";
    music.artist        = @"CHVRCHES";
    music.duration      = [self durationWithMinutes:3 andSeconds:51];
    music.downloaded    = YES;
    music.highQuality   = NO;
    [musics addObject:music];
    
    music = [[TRMusic alloc] init];
    music.name          = @"Hold On, We're Going Home (feat. Majid Jordan)";
    music.album         = @"Hold On, We're Going Home (feat. Majid Jordan) - Single";
    music.artist        = @"Drake";
    music.duration      = [self durationWithMinutes:3 andSeconds:51];
    music.downloaded    = YES;
    music.highQuality   = NO;
    [musics addObject:music];
    
    music = [[TRMusic alloc] init];
    music.name          = @"The Mother We Share";
    music.album         = @"The Mother We Share - Single";
    music.artist        = @"CHVRCHES";
    music.duration      = [self durationWithMinutes:3 andSeconds:51];
    music.downloaded    = YES;
    music.highQuality   = NO;
    [musics addObject:music];
    
    music = [[TRMusic alloc] init];
    music.name          = @"Promises";
    music.album         = @"nero";
    music.artist        = @"Promises - EP";
    music.duration      = [self durationWithMinutes:3 andSeconds:51];
    music.downloaded    = YES;
    music.highQuality   = NO;
    [musics addObject:music];
    
    music = [[TRMusic alloc] init];
    music.name          = @"Alone Together";
    music.album         = @"Save Rock and Roll";
    music.artist        = @"Fall Out Boy";
    music.duration      = [self durationWithMinutes:3 andSeconds:51];
    music.downloaded    = YES;
    music.highQuality   = NO;
    [musics addObject:music];
    
    music = [[TRMusic alloc] init];
    music.name          = @"Reload (Radio Edit)";
    music.album         = @"Reload (Radio Edit) - Single";
    music.artist        = @"Sebastian Ingrosso";
    music.duration      = [self durationWithMinutes:3 andSeconds:51];
    music.downloaded    = YES;
    music.highQuality   = NO;
    [musics addObject:music];
    
    music = [[TRMusic alloc] init];
    music.name          = @"I Love It (feat. Charli XCX)";
    music.album         = @"Iconic";
    music.artist        = @"Icona Pop";
    music.duration      = [self durationWithMinutes:3 andSeconds:51];
    music.downloaded    = YES;
    music.highQuality   = NO;
    [musics addObject:music];
    
    music = [[TRMusic alloc] init];
    music.name          = @"Feel the Love";
    music.album         = @"Feel the Love (feat. John Newman) [Remixes] - EP";
    music.artist        = @"Rudimental";
    music.duration      = [self durationWithMinutes:3 andSeconds:51];
    music.downloaded    = YES;
    music.highQuality   = NO;
    [musics addObject:music];
    
    music = [[TRMusic alloc] init];
    music.name          = @"Goin' Crazy (feat. Robbie Williams)";
    music.album         = @"Goin' Crazy (feat. Robbie Williams) - Single";
    music.artist        = @"Dizzee Rascal";
    music.duration      = [self durationWithMinutes:3 andSeconds:51];
    music.downloaded    = YES;
    music.highQuality   = NO;
    [musics addObject:music];
    
    music = [[TRMusic alloc] init];
    music.name          = @"Still Into You";
    music.album         = @"Paramore";
    music.artist        = @"Paramore";
    music.duration      = [self durationWithMinutes:3 andSeconds:51];
    music.downloaded    = YES;
    music.highQuality   = NO;
    [musics addObject:music];
    
    music = [[TRMusic alloc] init];
    music.name          = @"Heart Attack";
    music.album         = @"Demi";
    music.artist        = @"Demi Lovato";
    music.duration      = [self durationWithMinutes:3 andSeconds:51];
    music.downloaded    = YES;
    music.highQuality   = NO;
    [musics addObject:music];
    
    music = [[TRMusic alloc] init];
    music.name          = @"Explosions";
    music.album         = @"Halcyon (Deluxe Edition)";
    music.artist        = @"Ellie Goulding";
    music.duration      = [self durationWithMinutes:3 andSeconds:51];
    music.downloaded    = YES;
    music.highQuality   = NO;
    [musics addObject:music];
    
    music = [[TRMusic alloc] init];
    music.name          = @"I Need Your Love (feat. Ellie Goulding)";
    music.album         = @"I Need Your Love";
    music.artist        = @"Calvin Harris";
    music.duration      = [self durationWithMinutes:3 andSeconds:51];
    music.downloaded    = YES;
    music.highQuality   = NO;
    [musics addObject:music];
    
    music = [[TRMusic alloc] init];
    music.name          = @"Starry Eyed";
    music.album         = @"Bright Lights";
    music.artist        = @"Ellie Goulding";
    music.duration      = [self durationWithMinutes:3 andSeconds:51];
    music.downloaded    = YES;
    music.highQuality   = NO;
    [musics addObject:music];
    
    music = [[TRMusic alloc] init];
    music.name          = @"Lights (Single Version)";
    music.album         = @"Bright Lights";
    music.artist        = @"Ellie Goulding";
    music.duration      = [self durationWithMinutes:3 andSeconds:51];
    music.downloaded    = YES;
    music.highQuality   = NO;
    [musics addObject:music];
    
    music = [[TRMusic alloc] init];
    music.name          = @"Who's That Chick?";
    music.album         = @"Who's That Chick - Single";
    music.artist        = @"David Guetta";
    music.duration      = [self durationWithMinutes:2 andSeconds:47];
    music.downloaded    = YES;
    music.highQuality   = NO;
    [musics addObject:music];
    
    TRMusicGroup * g1 = [[TRMusicGroup alloc] init];
    g1.name = @"国外单曲";
    g1.musics = [musics copy];
    g1.state = TRMusicGroupStateDownloaded;
    
    TRMusicGroup * g2 = [[TRMusicGroup alloc] init];
    g2.name = @"国内";
    g2.musics = [musics copy];
    g2.state = TRMusicGroupStateDownloaded;
    
    TRMusicGroup * g3 = [[TRMusicGroup alloc] init];
    g3.name = @"国外专辑";
    g3.musics = [musics copy];
    g3.state = TRMusicGroupStateNormal;
    
    TRMusicGroup * g4 = [[TRMusicGroup alloc] init];
    g4.name = @"怀旧";
    g4.musics = @[];
    g4.state = TRMusicGroupStateNormal;
    
    return @[g1, g2, g3, g4];
}

+ (NSTimeInterval) durationWithMinutes:(int)minutes andSeconds:(int)seconds
{
    return minutes * 60 + seconds;
}

@end
