//
//  HMViewController.m
//  01-FMDB01-基本使用
//
//  Created by apple on 14-7-25.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "HMViewController.h"
#import "FMDB.h"

@interface HMViewController ()
@property (nonatomic, strong) FMDatabase *db;
@end

@implementation HMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1.获得数据库文件的路径
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *filename = [doc stringByAppendingPathComponent:@"students.sqlite"];
    
    // 2.得到数据库
    FMDatabase *db = [FMDatabase databaseWithPath:filename];
    
    // 3.打开数据库
    if ([db open]) {
        // 4.创表
        BOOL result = [db executeUpdate:@"CREATE TABLE IF NOT EXISTS t_student (id integer PRIMARY KEY AUTOINCREMENT, name text NOT NULL, age integer NOT NULL);"];
        if (result) {
            NSLog(@"成功创表");
        } else {
            NSLog(@"创表失败");
        }
    }
    
    self.db = db;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self delete];
    [self insert];
    [self query];
}

- (void)insert
{
    for (int i = 0; i<10; i++) {
        NSString *name = [NSString stringWithFormat:@"jack-%d", arc4random_uniform(100)];
        // executeUpdate : 不确定的参数用?来占位
        [self.db executeUpdate:@"INSERT INTO t_student (name, age) VALUES (?, ?);", name, @(arc4random_uniform(40))];
//        [self.db executeUpdate:@"INSERT INTO t_student (name, age) VALUES (?, ?);" withArgumentsInArray:@[name, @(arc4random_uniform(40))]];
        
        // executeUpdateWithFormat : 不确定的参数用%@、%d等来占位
//        [self.db executeUpdateWithFormat:@"INSERT INTO t_student (name, age) VALUES (%@, %d);", name, arc4random_uniform(40)];
    }
}

- (void)delete
{
//    [self.db executeUpdate:@"DELETE FROM t_student;"];
    [self.db executeUpdate:@"DROP TABLE IF EXISTS t_student;"];
    [self.db executeUpdate:@"CREATE TABLE IF NOT EXISTS t_student (id integer PRIMARY KEY AUTOINCREMENT, name text NOT NULL, age integer NOT NULL);"];
}

- (void)query
{
    // 1.执行查询语句
    FMResultSet *resultSet = [self.db executeQuery:@"SELECT * FROM t_student"];
    
    // 2.遍历结果
    while ([resultSet next]) {
        int ID = [resultSet intForColumn:@"id"];
        NSString *name = [resultSet stringForColumn:@"name"];
        int age = [resultSet intForColumn:@"age"];
        NSLog(@"%d %@ %d", ID, name, age);
    }
}

@end
