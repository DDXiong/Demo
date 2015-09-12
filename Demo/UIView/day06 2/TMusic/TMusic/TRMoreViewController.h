//
//  TRMoreViewController.h
//  TMusic
//
//  Created by Alex Zhao on 13-8-8.
//  Copyright (c) 2013年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TRMoreViewController : UITableViewController

@property (strong, nonatomic) IBOutlet UIView *headerView;

@property (strong, nonatomic) IBOutlet UITableViewCell *loginCell;

@property (strong, nonatomic) IBOutlet UITableViewCell *preferencesCell;
@property (strong, nonatomic) IBOutlet UITableViewCell *tPlayCell;
@property (strong, nonatomic) IBOutlet UITableViewCell *clockCell;

@property (strong, nonatomic) IBOutlet UITableViewCell *moreAppsCell;

@property (strong, nonatomic) IBOutlet UITableViewCell *dataPackgeCell;
@property (strong, nonatomic) IBOutlet UITableViewCell *rateCell;
@property (strong, nonatomic) IBOutlet UITableViewCell *inviteCell;
@property (strong, nonatomic) IBOutlet UITableViewCell *storageCell;
@property (strong, nonatomic) IBOutlet UITableViewCell *aboutCell;

@end
