//
//  ViewController.m
//  MryPushAnimation
//
//  Created by mryun11 on 15/8/20.
//  Copyright (c) 2015年 mryun11. All rights reserved.
//

#import "ViewController.h"
#import "AnimationViewController.h"
#import <QuartzCore/QuartzCore.h>

#define Screen_height   [[UIScreen mainScreen] bounds].size.height
#define Screen_width    [[UIScreen mainScreen] bounds].size.width
#define kDuration 0.6   // 动画持续时间(秒)

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,weak) UITableView *tableView;

@property (nonatomic,strong) NSMutableArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, Screen_width, Screen_height) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    self.tableView = tableView;
    [self.view addSubview:tableView];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *ID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    AnimationViewController *vc = [[AnimationViewController alloc]init];
    if (indexPath.row < 4) {
        //UIView Animation
        CGContextRef context = UIGraphicsGetCurrentContext();
        [UIView beginAnimations:nil context:context];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationDuration:kDuration];
        [self.navigationController pushViewController:vc animated:NO];
        switch (indexPath.row) {
            case 0:
                [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.navigationController.view cache:YES];
                break;
            case 1:
                [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.navigationController.view cache:YES];
                break;
            case 2:
                [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.navigationController.view cache:YES];
                break;
            case 3:
                [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.navigationController.view cache:YES];
                break;
            default:
                break;
        }
        [UIView commitAnimations];
    }else{
        //core animation
        CATransition *animation = [CATransition animation];
        animation.delegate = self;
        animation.duration = kDuration;
        animation.timingFunction = UIViewAnimationCurveEaseInOut;
        
        switch (indexPath.row) {
            case 4:
                animation.type = kCATransitionReveal;
                break;
            case 5:
                animation.type = kCATransitionMoveIn;
                break;
            case 6:
                animation.type = @"cube";
                break;
            case 7:
                animation.type = @"suckEffect";
                break;
            case 8:
                animation.type = @"rippleEffect";
                break;
            case 9:
                animation.type = @"pageCurl";
                break;
            case 10:
                animation.type = @"pageUnCurl";
                break;
            default:
                break;
        }
        animation.subtype = kCATransitionFromLeft;
        
        [self.navigationController pushViewController:vc animated:NO];
        [[self.navigationController.view layer] addAnimation:animation forKey:@"animation"];
    }
    
}

- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [NSMutableArray arrayWithArray:@[@"CurlUp",@"CurlDown",@"FlipFromLeft",@"FlipFromRight",@"Reveal",@"MoveIn",@"cube",@"suckEffect",@"rippleEffect",@"pageCurl",@"pageUnCurl"]];
    }
    return _dataSource;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
