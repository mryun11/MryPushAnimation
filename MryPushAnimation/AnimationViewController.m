//
//  AnimationViewController.m
//  MryPushAnimation
//
//  Created by mryun11 on 15/8/20.
//  Copyright (c) 2015年 mryun11. All rights reserved.
//

#import "AnimationViewController.h"

@interface AnimationViewController ()

@end

@implementation AnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.view.frame];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.image = [UIImage imageNamed:@"pic"];
    [self.view addSubview:imageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
