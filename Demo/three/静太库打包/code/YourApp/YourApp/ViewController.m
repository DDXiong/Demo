//
//  ViewController.m
//  YourApp
//
//  Created by tarena on 15/8/28.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
//点击后调回到来的那个MyApp
- (IBAction)goBackMyApp:(id)sender {
    UIApplication *app = [UIApplication sharedApplication];
    
    NSString *backURL = [NSString stringWithFormat:@"%@://",self.backScheme];
    
    NSURL *url = [NSURL URLWithString:backURL];
    if ([app canOpenURL:url]) {
        [app openURL:url];
    }else{
        NSLog(@"跳回到myapp失败");
    }
    
}

//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    [self performSegueWithIdentifier:@"pushWhiteSegue" sender:nil];
//}






@end
