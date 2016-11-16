//
//  LGTalkViewController.m
//  TalkDemo
//
//  Created by 李光 on 16/11/14.
//  Copyright © 2016年 Firstlight. All rights reserved.
//

#import "LGTalkViewController.h"
#import "LGTalkMainView.h"

@interface LGTalkViewController ()

@property (nonatomic,assign)CGRect navRect;
@end

@implementation LGTalkViewController

-(CGRect)navRect
{
    _navRect = self.navigationController.navigationBar.frame;
    return _navRect;
}

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
    self.navRect = self.navigationController.navigationBar.frame;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    LGTalkMainView *talkMainView = [[LGTalkMainView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_navRect), ScreenX, ScreenY - CGRectGetMaxY(_navRect))];
    [self.view addSubview: talkMainView];
    
}

-(void)setGroup:(XZGroup *)group
{
    _group = group;
    if (!_group) {
        self.title = self.group.gName;
    }
}











#pragma mark - Getter and Setter

//- (ICChatBoxViewController *) chatBoxVC
//{
//    if (_chatBoxVC == nil) {
//        _chatBoxVC = [[ICChatBoxViewController alloc] init];
//        [_chatBoxVC.view setFrame:CGRectMake(0,APP_Frame_Height-HEIGHT_TABBAR, App_Frame_Width, APP_Frame_Height)];
//        _chatBoxVC.delegate = self;
//    }
//    return _chatBoxVC;
//}


@end
