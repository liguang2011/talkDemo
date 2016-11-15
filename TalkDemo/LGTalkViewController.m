//
//  LGTalkViewController.m
//  TalkDemo
//
//  Created by 李光 on 16/11/14.
//  Copyright © 2016年 Firstlight. All rights reserved.
//

#import "LGTalkViewController.h"
#import "LGTalkMainView.h"

@interface LGTalkViewController ()<UITableViewDelegate>

@property (nonatomic,assign)CGRect navRect;
@end

@implementation LGTalkViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self createDefaultUI];
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

-(CGRect)navRect
{
    _navRect = self.navigationController.navigationBar.frame;
    return _navRect;
}
-(void)createDefaultUI
{
    [self.navigationController.navigationBar setHidden:NO];
    self.navRect = self.navigationController.navigationBar.frame;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    LGTalkMainView *talkMainView = [[LGTalkMainView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_navRect), ScreenX, ScreenY - CGRectGetMaxY(_navRect))];
    [self.view addSubview: talkMainView];
    
}




@end