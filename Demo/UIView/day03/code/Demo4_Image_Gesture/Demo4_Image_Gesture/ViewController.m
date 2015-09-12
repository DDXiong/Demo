//
//  ViewController.m
//  Demo4_Image_Gesture
//
//  Created by tarena on 15/7/21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong)UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建imagemView
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Elephant.jpg"]];
    self.imageView = imageView;
    [self.view addSubview:imageView];
    //设置初始状态
    [self loadImageView];
    
    //对imageView添加手势
    imageView.userInteractionEnabled = YES;
    UIPanGestureRecognizer *panGR = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    [self.imageView addGestureRecognizer:panGR];
    
    UIPinchGestureRecognizer *pinchGR = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinch:)];
    [self.imageView addGestureRecognizer:pinchGR];
    
    UIRotationGestureRecognizer *rotationGR = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(rotation:)];
    [self.imageView addGestureRecognizer:rotationGR];
    
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    tapGR.numberOfTapsRequired = 2;
    [self.imageView addGestureRecognizer:tapGR];
    
}

-(void)loadImageView{
    //设置中心点
    //self.imageView.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    self.imageView.center = self.view.center;
    
    CGFloat scaleX = self.view.bounds.size.width/self.imageView.bounds.size.width;
    CGFloat scaleY = self.view.bounds.size.height/self.imageView.bounds.size.height;
    //设置缩放
    self.imageView.transform = CGAffineTransformMakeScale(MIN(scaleX, scaleY), MIN(scaleX, scaleY));
}

-(void)pan:(UIPanGestureRecognizer *)gr{
    //第一种方式：修改中心点实现位移
//    CGPoint translation = [gr translationInView:self.view];
//    CGPoint center = self.imageView.center;
//    center.x+=translation.x;
//    center.y+=translation.y;
//    self.imageView.center= center;
//    [gr setTranslation:CGPointZero inView:self.view];
    //第二种方式：修改transform实现位移
    // 读取位移值时，需要确定一个坐标系
    // 读取imageView坐标系下的值，
    // 则用于修改imageView坐标系下的transform
    
    // 读取self.view坐标系下的值
    // 则需要用于修改self.view坐标系下的center属性
    CGPoint translation = [gr translationInView:self.imageView];
    self.imageView.transform = CGAffineTransformTranslate(self.imageView.transform, translation.x, translation.y);
    [gr setTranslation:CGPointZero inView:self.imageView];
    
}

-(void)tap:(UITapGestureRecognizer *)gr{
    [self loadImageView];
    
}




@end
