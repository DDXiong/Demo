//
//  main.m
//  生成SQL
//
//  Created by apple on 14-7-24.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSArray *names = @[@"西门抽血", @"西门抽筋", @"西门抽风", @"西门吹雪"];
        NSMutableString *sql = [NSMutableString string];
        for (int i = 0; i<200; i++) {
            int ID = i + 1;
            int age = arc4random_uniform(20) + 20;
            NSString *name = names[arc4random_uniform(names.count)];
            name = [name stringByAppendingFormat:@"-%d", arc4random_uniform(100)];
            [sql appendFormat:@"insert into t_student (id, name, age) values (%d, '%@', %d);\n", ID, name, age];
        }
        [sql writeToFile:@"/Users/apple/Desktop/students.sql" atomically:YES encoding:NSUTF8StringEncoding error:nil];
        NSLog(@"\n%@", sql);
    }
    return 0;
}

