//
//  ViewController.m
//  TestAnimation_旋转和组动画
//
//  Created by admin on 15-1-16.
//  Copyright (c) 2015年 ___CC___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,assign) int index;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
     self.index = 1;
     self.myImaView.image=[UIImage imageNamed: [NSString stringWithFormat:@"%d.jpg",self.index]];
}

//组合动画
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
         // 平移动画
         CABasicAnimation *a1 = [CABasicAnimation animation];
         a1.keyPath = @"transform.translation.y";
         a1.toValue = @(100);
         // 缩放动画
         CABasicAnimation *a2 = [CABasicAnimation animation];
         a2.keyPath = @"transform.scale";
         a2.toValue = @(0.0);
         // 旋转动画
         CABasicAnimation *a3 = [CABasicAnimation animation];
         a3.keyPath = @"transform.rotation";
         a3.toValue = @(M_PI_2);
    
         // 组动画
         CAAnimationGroup *groupAnima = [CAAnimationGroup animation];
    
         groupAnima.animations = @[a1, a2, a3];
    
         //设置组动画的时间
         groupAnima.duration = 2;
         groupAnima.fillMode = kCAFillModeForwards;
         groupAnima.removedOnCompletion = NO;
    
        [self.myImaView.layer addAnimation:groupAnima forKey:nil];
}



- (IBAction)nextIma:(id)sender {
    self.index++;
    if (self.index>5) {
        self.index=1;
    }
    self.myImaView.image=[UIImage imageNamed: [NSString stringWithFormat:@"%d.jpg",self.index]];
    
    //创建核心动画
    CATransition *ca=[CATransition animation];
    //告诉要执行什么动画
    //设置过度效果
    ca.type=@"cube";
    //设置动画的过度方向（向左）
    ca.subtype=kCATransitionFromLeft;
    //设置动画的时间
    ca.duration=2.0;
    //添加动画
    [self.myImaView.layer addAnimation:ca forKey:nil];
}

- (IBAction)preIma:(id)sender {
    
    self.index--;
    if (self.index<1) {
        self.index=5;
             }
         self.myImaView.image=[UIImage imageNamed: [NSString stringWithFormat:@"%d.jpg",self.index]];
    
         //创建核心动画
         CATransition *ca=[CATransition animation];
         //告诉要执行什么动画
         //设置过度效果
         ca.type=@"cube";
         //设置动画的过度方向（向左）
         ca.subtype=kCATransitionFromLeft;
         //设置动画的时间
         ca.duration=2.0;
         //添加动画
         [self.myImaView.layer addAnimation:ca forKey:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
