//
//  ViewController.m
//  TalkDemo
//
//  Created by 李光 on 16/11/14.
//  Copyright © 2016年 Firstlight. All rights reserved.
//
#import "ViewController.h"
#import "LGTalkViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self createDefaultUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)createDefaultUI
{
    UIButton *button = [[UIButton alloc]init];
    button.backgroundColor = [UIColor yellowColor];
    button.frame = CGRectMake(0, 200, ScreenX, 50);
    [button addTarget:nil action:@selector(Click) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"跳转" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
}

-(void)Click
{
    LGTalkViewController *talkVC = [[LGTalkViewController alloc]init];
    [self.navigationController pushViewController:talkVC animated:YES];
}

@end
