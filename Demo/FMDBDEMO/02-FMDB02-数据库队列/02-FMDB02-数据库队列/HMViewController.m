//
//  HMViewController.m
//  02-FMDB02-数据库队列
//
//  Created by apple on 14-7-25.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "HMViewController.h"
#import "FMDB.h"

@interface HMViewController ()
@property (nonatomic, strong) FMDatabaseQueue *queue;
@end

@implementation HMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1.获得数据库文件的路径
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *filename = [doc stringByAppendingPathComponent:@"persons.sqlite"];
    
    // 2.得到数据库
    FMDatabaseQueue *queue = [FMDatabaseQueue databaseQueueWithPath:filename];
    
    // 3.打开数据库
    [queue inDatabase:^(FMDatabase *db) {
        // 4.创表
        BOOL result = [db executeUpdate:@"CREATE TABLE IF NOT EXISTS t_person (id integer PRIMARY KEY AUTOINCREMENT, name text NOT NULL, age integer NOT NULL);"];
        if (result) {
            NSLog(@"成功创表");
        } else {
            NSLog(@"创表失败");
        }
    }];
    
    self.queue = queue;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
//    [self.queue inDatabase:^(FMDatabase *db) {
//        [db beginTransaction];
//        
//        [db executeUpdate:@"INSERT INTO t_person (name, age) VALUES (?, ?);", @"jake", @30];
//        [db executeUpdate:@"INSERT INTO t_person (name, age) VALUES (?, ?);", @"jake", @30];
//        [db executeUpdate:@"INSERT INTO t_person (name, age) VALUES (?, ?);", @"jake", @30];
//        [db executeUpdate:@"INSERT INTO t_person (name, age) VALUES (?, ?);", @"jake", @30];
//        
//        [db commit];
//    }];
    
//    [self.queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
//        [db executeUpdate:@"INSERT INTO t_person (name, age) VALUES (?, ?);", @"jake", @30];
//        [db executeUpdate:@"INSERT INTO t_person (name, age) VALUES (?, ?);", @"jake", @30];
//        [db executeUpdate:@"INSERT INTO t_person (name, age) VALUES (?, ?);", @"jake", @30];
//        [db executeUpdate:@"INSERT INTO t_person (name, age) VALUES (?, ?);", @"jake", @30];
//    }];
    
    [self.queue inDatabase:^(FMDatabase *db) {
        
        FMResultSet *resultSet = [db executeQuery:@"SELECT * FROM t_person;"];
        while ([resultSet next]) {
            int ID = [resultSet intForColumn:@"id"];
            NSString *name = [resultSet stringForColumn:@"name"];
            int age = [resultSet intForColumn:@"age"];
            NSLog(@"%d %@ %d", ID, name, age);
        }
    }];
}

@end
