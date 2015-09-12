//
//  PaintingView.m
//  Demo0_Homework_Painting
//
//  Created by tarena on 15/4/2.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "PaintingView.h"
#import "DrawPath.h"

@interface PaintingView ()
@property(nonatomic,strong)NSMutableArray *allPaths;
@property(nonatomic)CGPoint startPoint;
@end

@implementation PaintingView

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //创建路径
    UITouch *touch = [touches anyObject];
    self.startPoint = [touch locationInView:self];
    DrawPath *p = [[DrawPath alloc]init];
    p.setting = [[Setting alloc]init];
    if (self.currentSetting.rubber) {
        p.path = [UIBezierPath bezierPath];
        [p.path moveToPoint:self.startPoint];
        p.setting.lineWidth = 7;
        p.setting.lineColor = [UIColor whiteColor];
    }else{
        p.setting.lineWidth = self.currentSetting.lineWidth;
        p.setting.lineColor = self.currentSetting.lineColor;
    }
    [self.allPaths addObject:p];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    //设计路径
    UITouch *touch = [touches anyObject];
    CGPoint endPoint = [touch locationInView:self];
    //取出最后的路径对象
    DrawPath *p = [self.allPaths lastObject];
    if (self.currentSetting.rubber) {
        [p.path addLineToPoint:endPoint];
    }else{
        p.path = [UIBezierPath bezierPathWithRect:CGRectMake(self.startPoint.x, self.startPoint.y, endPoint.x-self.startPoint.x, endPoint.y - self.startPoint.y)];
    }
    [self setNeedsDisplay];
}


- (void)drawRect:(CGRect)rect
{
    //绘制路径
    for (DrawPath *p in self.allPaths) {
        p.path.lineWidth = p.setting.lineWidth;
        [p.setting.lineColor setStroke];
        [p.path stroke];
    }
}






- (NSMutableArray *)allPaths{
    if (!_allPaths) {
        _allPaths  = [NSMutableArray array];
    }
    return _allPaths;
}




@end
