//
//  HMViewController.m
//  02-SQLite的应用
//
//  Created by apple on 14-7-24.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "HMViewController.h"
#import <sqlite3.h>

@interface HMViewController ()
- (IBAction)insert;
- (IBAction)update;
- (IBAction)delete;
- (IBAction)select;
// db就是数据库的象征，如果要进行CRUD，得操作db这个实例
@property (nonatomic, assign) sqlite3 *db;
@end

@implementation HMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 获得数据库文件的路径
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *filename = [doc stringByAppendingPathComponent:@"students.sqlite"];
    // 将OC字符串 转成 C语言字符串
    const char *cfilename = filename.UTF8String;
    // 1.打开数据库（如果数据库文件不存在，sqlite3_open函数会自动创建数据库文件）
    int result = sqlite3_open(cfilename, &_db);
    if (result == SQLITE_OK) { // 打开成功
        NSLog(@"成功打开数据库");
        
        // 2.创表
        const char *sql = "CREATE TABLE IF NOT EXISTS t_student (id integer PRIMARY KEY AUTOINCREMENT, name text NOT NULL, age integer NOT NULL);";
        char *erroMsg = NULL;
        result = sqlite3_exec(self.db, sql, NULL, NULL, &erroMsg);
        if (result == SQLITE_OK) {
            NSLog(@"成功创表");
        } else {
//            printf("创表失败--%s--%s-%d", erroMsg, __FILE__, __LINE__);
            NSLog(@"创表失败--%s--%@-%d", erroMsg, [NSString stringWithUTF8String:__FILE__], __LINE__);
        }
    } else {
        NSLog(@"打开数据库失败");
    }
}

- (IBAction)insert {
    for (int i = 0; i<20; i++) {
        // 1.拼接SQL语句
        NSString *name = [NSString stringWithFormat:@"Jack-%d", arc4random_uniform(100)];
        int age = arc4random_uniform(20) + 30;
        NSString *sql = [NSString stringWithFormat:@"INSERT INTO t_student (name, age) VALUES ('%@', %d);", name, age];
        
        // 2.执行SQL语句
        char *erroMsg = NULL;
        sqlite3_exec(self.db, sql.UTF8String, NULL, NULL, &erroMsg);
        if (erroMsg) {
            NSLog(@"插入数据失败--%s", erroMsg);
        } else {
            NSLog(@"成功插入数据");
        }
    }
}

- (IBAction)update {
    
}

- (IBAction)delete {
    
}

- (IBAction)select {
    const char *sql = "SELECT id, name, age FROM t_student WHERE age <= 30;";
    // 进行查询前的准备工作
    // -1 代表系统会自动计算SQL语句的长度
    // sqlite3_stmt：用来取数据
    sqlite3_stmt *stmt = NULL;
    if (sqlite3_prepare_v2(self.db, sql, -1, &stmt, NULL) == SQLITE_OK) { // SQL语句没有问题
        NSLog(@"查询语句没有问题");
        
        // 每调一次sqlite3_step函数，stmt就会指向下一条记录
        while (sqlite3_step(stmt) == SQLITE_ROW) { // 找到一条记录
            // 取出数据
            
            // 取出第0列字段的值（int类型的值）
            int ID = sqlite3_column_int(stmt, 0);
            
            // 取出第1列字段的值（tex类型的值）
            const unsigned char *name = sqlite3_column_text(stmt, 1);
            
            // 取出第2列字段的值（int类型的值）
            int age = sqlite3_column_int(stmt, 2);
            
            NSLog(@"%d %s %d", ID, name, age);
        }
    } else {
        NSLog(@"查询语句有问题");
    }
}
@end
