//
//  TRMusicsViewController.h
//  TMusic
//
//  Created by Alex Zhao on 13-8-21.
//  Copyright (c) 2013年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRMusicGroup.h"

@interface TRMusicsViewController : UITableViewController

@property (nonatomic, strong) TRMusicGroup * group;

@property (strong, nonatomic) IBOutlet UITableViewCell *downloadCell;
@property (strong, nonatomic) IBOutlet UITableViewCell *randomCell;

@end
