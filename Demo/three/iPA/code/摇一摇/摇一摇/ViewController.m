//
//  ViewController.m
//  摇一摇
//
//  Created by tarena on 15/8/31.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

/*开始摇一摇*/
- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSLog(@"motionBegan");
}

/*摇一摇结束(需要在这里处理摇晃动作结束后的代码)*/
- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    //不是摇一摇运动事件
    if (motion != UIEventSubtypeMotionShake) {
        return;
    }
    NSLog(@"motionEnded");
}

/*摇一摇取消(被中断，比如 突然来了电话)*/
- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSLog(@"motionCancel");
}





@end
