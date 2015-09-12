//
//  TRMusicsViewController.m
//  TMusic
//
//  Created by Alex Zhao on 13-8-21.
//  Copyright (c) 2013年 Tarena. All rights reserved.
//

#import "TRMusicsViewController.h"
#import "NSIndexPath+Check.h"
#import "TRPlayingViewController.h"

typedef NS_ENUM(NSInteger, TRMusicsCellType) {
    TRMusicsCellTypeMusic,
    TRMusicsCellTypeDownload,
    TRMusicsCellTypeRandom
};

@interface TRMusicsViewController ()

@end

@implementation TRMusicsViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewWillAppear:(BOOL)animated
{
    self.title = self.group.name;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (TRMusicsCellType) cellTypeForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([indexPath isEqualWithSection:0 andRow:0]) {
        return TRMusicsCellTypeDownload;
    } else if ([indexPath isEqualWithSection:0 andRow:1]){
        return TRMusicsCellTypeRandom;
    } else {
        return TRMusicsCellTypeMusic;
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.group.musics.count + 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TRMusicsCellType cellType = [self cellTypeForRowAtIndexPath:indexPath];
    if (cellType == TRMusicsCellTypeDownload) {
        return [tableView dequeueReusableCellWithIdentifier:@"Download Cell"];
    } else if (cellType == TRMusicsCellTypeRandom) {
        return [tableView dequeueReusableCellWithIdentifier:@"Random Cell"];
    }
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.textLabel.font = [UIFont systemFontOfSize:18];
        cell.detailTextLabel.font = [UIFont systemFontOfSize:14];
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
    }
    
    NSUInteger index = indexPath.row - 2;
    TRMusic * music = self.group.musics[index];
    
    cell.textLabel.text = music.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ - %@", music.artist, music.album];
    
    // Configure the cell...
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"Playing Segue"]) {
        TRPlayingViewController * playingViewController = segue.destinationViewController;
        
        UITableViewCell * cell = sender;
        NSIndexPath * indexPath = [self.tableView indexPathForCell:cell];
        NSUInteger index = indexPath.row - 2;
        
        playingViewController.music = self.group.musics[index];
        playingViewController.playingList = self.group.musics;
        
    }
}



@end
