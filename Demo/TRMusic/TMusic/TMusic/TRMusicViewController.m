//
//  TRMusicViewController.m
//  TMusic
//
//  Created by Alex Zhao on 13-8-8.
//  Copyright (c) 2013年 Tarena. All rights reserved.
//

#import "TRMusicViewController.h"
#import "NSIndexPath+Check.h"
#import "TRLoginViewController.h"
#import "TRGroupsViewController.h"
#import "TRMusicGroup.h"

@interface TRMusicViewController ()

@end

@implementation TRMusicViewController

- (id)init
{
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self initialize];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)initialize
{
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"Groups Segue"]) {
        TRGroupsViewController * groupsViewController = segue.destinationViewController;
        groupsViewController.groups = [TRMusicGroup fakeData];
    }
}


@end
