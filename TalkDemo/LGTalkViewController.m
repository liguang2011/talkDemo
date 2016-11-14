//
//  LGTalkViewController.m
//  TalkDemo
//
//  Created by 李光 on 16/11/14.
//  Copyright © 2016年 Firstlight. All rights reserved.
//

#import "LGTalkViewController.h"
#import "LGTalkTableView.h"
#import "LGTalkBottomView.h"

@interface LGTalkViewController ()<UITableViewDelegate>

@property (readonly,nonatomic,strong)LGTalkTableView *talkTable;
@property (nonatomic,strong)LGTalkBottomView *bottomView;
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
    
    //聊天界面
    if (!_talkTable) {
        _talkTable = [[LGTalkTableView alloc]init];
        _talkTable.frame = CGRectMake(0, CGRectGetMaxY(_navRect), ScreenX - 10, ScreenY - CGRectGetMaxY(_navRect) - TalkBottomH);
        //_talkTable.separatorStyle = NO;//分界线
        self.automaticallyAdjustsScrollViewInsets = NO;
        [self.view addSubview:_talkTable];
    }
    //底部编辑
    if (!_bottomView) {
        _bottomView = [[LGTalkBottomView alloc]init];
        _bottomView.backgroundColor = [UIColor blackColor];
        _bottomView.frame = CGRectMake(0, ScreenY - TalkBottomH, ScreenX, TalkBottomH);
        [self.view addSubview:_bottomView];
    }

}


#pragma mark tableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}



@end
