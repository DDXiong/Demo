//
//  main.m
//  Demo04_Block
//
//  Created by tarena on 15/9/2.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        __block int age = 10;
        void(^myBlock)() = ^{
            NSLog(@"age = %d",age);
        
        };
        age = 20;
        myBlock();
    }
    return 0;
}




