//
//  LGTalkMainView.m
//  TalkDemo
//
//  Created by LG on 2016/11/15.
//  Copyright © 2016年 Firstlight. All rights reserved.
//

#import "LGTalkMainView.h"
#import "LGTalkTableView.h"
#import "LGTalkBottomView.h"

@interface LGTalkMainView()
@property (readonly,nonatomic,strong)LGTalkTableView *talkTable;
@property (nonatomic,strong)LGTalkBottomView *bottomView;
@property (nonatomic,assign)CGRect keyBoardRect;

@end

@implementation LGTalkMainView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/




- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createDefaultUI];
    }
    return self;
}

-(void)createDefaultUI
{
    [self addNotifications];
    
    //聊天界面
    if (!_talkTable) {
        _talkTable = [[LGTalkTableView alloc]init];
        _talkTable.frame = CGRectMake(0, 0, ScreenX, ScreenY - TalkBottomH);
        //_talkTable.separatorStyle = NO;//分界线
        [self addSubview:_talkTable];
    }
    //底部编辑
    if (!_bottomView) {
        _bottomView = [[LGTalkBottomView alloc]initWithFrame:CGRectMake(0, self.frame.size.height - TalkBottomH, ScreenX, TalkBottomH)];
        _bottomView.backgroundColor = [UIColor blackColor];
        [self addSubview:_bottomView];
    }
    
}

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    CGPoint covPoint = [self convertPoint:point toView:self];
    
    
    CGRect bottomBarRect = self.bottomView.frame;
    
    BOOL PointInBottomBar = CGRectContainsPoint(bottomBarRect, covPoint);
    
    if (PointInBottomBar) {
        UIView *view = [super hitTest:point withEvent:event];
        return view;
    }
    
    
    static UIEvent *e = nil;
    
    if (e != nil && e == event) {
        e = nil;
        return [super hitTest:point withEvent:event];
    }
    
    e = event;
    
    BOOL textBeInput = NO;
    if (CGRectContainsPoint(self.keyBoardRect, covPoint)) {
        textBeInput = YES;
    }
    
    if (event.type == UIEventTypeTouches) {
        NSSet *touches = [event touchesForView:self];
        UITouch *touch = [touches anyObject];
        if (touch.phase == UITouchPhaseBegan) {
            if (_keyBoardRect.size.height > 0) {
                if (!textBeInput) {
                    [self endEditing:YES];
                }
            }
            NSLog(@"Touches began");
        }else if(touch.phase == UITouchPhaseEnded){
            NSLog(@"Touches Ended");
            
        }else if(touch.phase == UITouchPhaseCancelled){
            NSLog(@"Touches Cancelled");
            
        }else if (touch.phase == UITouchPhaseMoved){
            NSLog(@"Touches Moved");
            
        }
    }
    
    UIView *view = [super hitTest:point withEvent:event];
    return view;
}

-(void)addNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardHide:) name:UIKeyboardWillHideNotification object:nil];
    
}

-(void)adjustBottomViewShowKeyBoard
{

}

-(void)adjustMainViewShowKeyBoard
{
    
}


#pragma mark - 监听键盘弹出收起事件

-(void)keyBoardShow:(NSNotification *)notification
{
    CGRect keyBoardRect=[notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    self.keyBoardRect = keyBoardRect;
    CGFloat deltaY= keyBoardRect.size.height;
    [UIView animateWithDuration:[notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue] animations:^{
        self.bottomView.transform=CGAffineTransformMakeTranslation(0, -deltaY);
    }];
    
}

-(void)keyBoardHide:(NSNotification *)notification
{
    _keyBoardRect = CGRectMake(0, 0, 0, 0);
    [UIView animateWithDuration:[notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue] animations:^{
        self.bottomView.transform=CGAffineTransformIdentity;
    }];
    
}

#pragma mark tableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}

@end
