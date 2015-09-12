//
//  TRLoginViewController.m
//  TMusic
//
//  Created by Alex Zhao on 13-8-9.
//  Copyright (c) 2013年 Tarena. All rights reserved.
//

#import "TRLoginViewController.h"
#import "UIColor+Art.h"
#import "NSIndexPath+Check.h"
#import "TRTextFieldCell.h"

@interface TRLoginViewController ()

@end

@implementation TRLoginViewController

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
    self.tableView.backgroundColor = [UIColor colorWithHex:0xE7EBF1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    TRTextFieldCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if ([indexPath isEqualWithRow:0 inSection:0] ) {
        cell.textField.placeholder = @"帐号";
    } else if ([indexPath isEqualWithRow:1 inSection:0] ) {
        cell.textField.placeholder = @"密码";
    }
    
    return cell;
}


- (IBAction) cancel:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)login:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
