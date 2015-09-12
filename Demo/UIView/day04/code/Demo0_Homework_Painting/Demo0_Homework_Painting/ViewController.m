//
//  ViewController.m
//  Demo0_Homework_Painting
//
//  Created by tarena on 15/4/2.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import "PaintingView.h"
#import "Setting.h"

@interface ViewController ()
//  界面上的画板对象
@property (weak, nonatomic) IBOutlet PaintingView *paintingView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *colorSegmented;
@property (weak, nonatomic) IBOutlet UIStepper *widthStepper;
@property(nonatomic,strong)Setting *set;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.set.lineColor = [UIColor redColor];
    self.set.lineWidth = self.widthStepper.value;
    self.set.rubber = NO;
    self.paintingView.currentSetting = self.set;
    
}
- (IBAction)changeColor:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0:
            self.set.lineColor = [UIColor redColor];
            break;
        case 1:
            self.set.lineColor = [UIColor greenColor];
            break;
        case 2:
            self.set.lineColor = [UIColor blueColor];
            break;
        default:
            break;
    }
}
- (IBAction)changeLineWidth:(UIStepper *)sender {
    self.set.lineWidth = sender.value;
}

- (Setting *)set{
    if (!_set) {
        _set = [[Setting alloc]init];
    }
    return _set;
}

- (IBAction)isUseRubber:(UISwitch *)sender {
    self.set.rubber = sender.on;
}







@end
