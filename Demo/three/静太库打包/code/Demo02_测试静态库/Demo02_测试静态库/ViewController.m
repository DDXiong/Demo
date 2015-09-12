//
//  ViewController.m
//  Demo02_测试静态库
//
//  Created by tarena on 15/8/28.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import "TRShare.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    NSLog(@"[%ld]",[TRShare sumWithNum1:1 andNum2:1]);
    
    self.imageView.image = [TRShare loadImage];
}

@end
