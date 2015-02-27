//
//  ViewController.h
//  TestAnimation_旋转和组动画
//
//  Created by admin on 15-1-16.
//  Copyright (c) 2015年 ___CC___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *myImaView;

- (IBAction)nextIma:(id)sender;
- (IBAction)preIma:(id)sender;

@end

