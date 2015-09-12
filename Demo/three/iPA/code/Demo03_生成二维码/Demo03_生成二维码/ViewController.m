//
//  ViewController.m
//  Demo03_生成二维码
//
//  Created by tarena on 15/8/31.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import <CoreImage/CoreImage.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1. 创建二维码滤镜
    CIFilter *filer = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    
    //2.还原滤镜的初始设置
    [filer setDefaults];
    
    //3.将要隐藏在二维码中的字符串变成data
    NSData *data = [@"http://www.baidu.com" dataUsingEncoding:NSUTF8StringEncoding];
    
    //4.通过kvc(key value coding)设置滤镜，从而传入data，将来滤镜就把这个data变成二维码
//    Student *s1 = [Student  new];
//    s1.name = @"xxxx";
//    [s1 setName:@"xxxx"];
//    [s1 setValue: @"张三" forKey:@"name"];
    [filer setValue:data forKey:@"inputMessage"];
    
    //5.生成二维码
    CIImage *outputImage = [filer outputImage];
    
    UIImage *image = [UIImage imageWithCIImage:outputImage];
    
    //6.显示二维码图片
    self.imageView.image = image;
    
}

@end
