//
//  LGTalkViewController.m
//  TalkDemo
//
//  Created by 李光 on 16/11/14.
//  Copyright © 2016年 Firstlight. All rights reserved.
//
#define ScreenF [UIScreen mainScreen]
#define ScreenY CGRectGetMaxY([UIScreen mainScreen].bounds)
#define ScreenX CGRectGetMaxX([UIScreen mainScreen].bounds)
#import "LGTalkViewController.h"
#import "LGTalkTableView.h"
#import "LGTalkBottomView.h"

@interface LGTalkViewController ()

@property (readonly,nonatomic,strong)LGTalkTableView *talkTable;
@property (nonatomic,strong)LGTalkBottomView *bottomView;

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
-(void)createDefaultUI
{
    [self.navigationController.navigationBar setHidden:NO];
    
}



@end
