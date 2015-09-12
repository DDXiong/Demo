//
//  HMViewController.m
//  03-模糊查询
//
//  Created by apple on 14-7-24.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "HMViewController.h"
#import "HMPersonTool.h"
#import "HMPerson.h"

@interface HMViewController () <UISearchBarDelegate>
- (IBAction)add:(UIBarButtonItem *)sender;
@property (nonatomic, strong) NSArray *persons;
@end

@implementation HMViewController

- (NSArray *)persons
{
    if (_persons == nil) {
        self.persons = [HMPersonTool query];
    }
    return _persons;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UISearchBar *searchBar = [[UISearchBar alloc] init];
    searchBar.frame = CGRectMake(0, 0, 300, 44);
    searchBar.delegate = self;
    self.navigationItem.titleView = searchBar;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.persons.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"person";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    HMPerson *p = self.persons[indexPath.row];
    cell.textLabel.text = p.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"年龄：%d", p.age];
    
    return cell;
}

- (IBAction)add:(UIBarButtonItem *)sender {
    // 初始化一些假数据
    NSArray *names = @[@"西门抽血", @"西门抽筋", @"西门抽风", @"西门吹雪", @"东门抽血", @"东门抽筋", @"东门抽风", @"东门吹雪"
                       , @"北门抽血", @"北门抽筋", @"南门抽风", @"南门吹雪"];
    for (int i = 0; i<100; i++) {
        HMPerson *p = [[HMPerson alloc] init];
        p.name = [NSString stringWithFormat:@"%@-%d", names[arc4random_uniform(names.count)], arc4random_uniform(100)];
        p.age = arc4random_uniform(20) + 20;
        [HMPersonTool save:p];
    }
}

#pragma mark - 搜索框代理
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    // 根据查询条件搜索联系人信息
    self.persons = [HMPersonTool queryWithCondition:searchText];
    
    // 刷新表格
    [self.tableView reloadData];
}
@end
