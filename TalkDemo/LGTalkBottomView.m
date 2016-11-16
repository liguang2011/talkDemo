//
//  LGTalkBottomView.m
//  TalkDemo
//
//  Created by 李光 on 16/11/14.
//  Copyright © 2016年 Firstlight. All rights reserved.
//

#import "LGTalkBottomView.h"
#import "LGSendMessageView.h"

@interface LGTalkBottomView()<UITextViewDelegate>

/** chotBox的顶部边线 */
@property (nonatomic, strong) UIView *topLine;
/** 录音按钮 */
@property (nonatomic, strong) UIButton *voiceButton;
/** 表情按钮 */
@property (nonatomic, strong) UIButton *faceButton;
/** (+)按钮 */
@property (nonatomic, strong) UIButton *moreButton;
/** 按住说话 */
@property (nonatomic, strong) UIButton *talkButton;

@property (nonatomic, strong) UITextView *textView;

@end
@implementation LGTalkBottomView

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
        [self createDefualtUI];
    }
    return self;
}

-(void)createDefualtUI
{
    [self setBackgroundColor:IColor(241, 241, 248)];
    [self addSubview:self.topLine];
    [self addSubview:self.voiceButton];
    [self addSubview:self.textView];
    [self addSubview:self.faceButton];
    [self addSubview:self.moreButton];
//    [self addSubview:self.talkButton];
}
-(void)btnClick : (UIButton *)sender
{
    
    switch (sender.tag) {
        case 10://face
            
            break;
         
        case 11://send
            
            break;
        case 12://more
            
            break;
        default:
            break;
    }
    
    
}


#pragma mark - Getter and Setter

- (UIView *) topLine
{
    if (_topLine == nil) {
        _topLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 0.5)];
        [_topLine setBackgroundColor:IColor(165, 165, 165)];
    }
    return _topLine;
}

- (UIButton *) voiceButton
{
    if (_voiceButton == nil) {
        _voiceButton = [[UIButton alloc] initWithFrame:CGRectMake(0, (HEIGHT_TABBAR - CHATBOX_BUTTON_WIDTH) / 2, CHATBOX_BUTTON_WIDTH, CHATBOX_BUTTON_WIDTH)];
        [_voiceButton setImage:[UIImage imageNamed:@"ToolViewInputVoice"] forState:UIControlStateNormal];
        [_voiceButton setImage:[UIImage imageNamed:@"ToolViewInputVoiceHL"] forState:UIControlStateHighlighted];
        [_voiceButton addTarget:self action:@selector(voiceButtonDown:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _voiceButton;
}

- (UIButton *) moreButton
{
    if (_moreButton == nil) {
        _moreButton = [[UIButton alloc] initWithFrame:CGRectMake(App_Frame_Width - CHATBOX_BUTTON_WIDTH, (HEIGHT_TABBAR - CHATBOX_BUTTON_WIDTH) / 2, CHATBOX_BUTTON_WIDTH, CHATBOX_BUTTON_WIDTH)];
        [_moreButton setImage:[UIImage imageNamed:@"TypeSelectorBtn_Black"] forState:UIControlStateNormal];
        [_moreButton setImage:[UIImage imageNamed:@"TypeSelectorBtnHL_Black"] forState:UIControlStateHighlighted];
        [_moreButton addTarget:self action:@selector(moreButtonDown:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _moreButton;
}

- (UIButton *) faceButton
{
    if (_faceButton == nil) {
        _faceButton = [[UIButton alloc] initWithFrame:CGRectMake(self.moreButton.frame.origin.x - CHATBOX_BUTTON_WIDTH, (HEIGHT_TABBAR - CHATBOX_BUTTON_WIDTH) / 2, CHATBOX_BUTTON_WIDTH, CHATBOX_BUTTON_WIDTH)];
        [_faceButton setImage:[UIImage imageNamed:@"ToolViewEmotion"] forState:UIControlStateNormal];
        [_faceButton setImage:[UIImage imageNamed:@"ToolViewEmotionHL"] forState:UIControlStateHighlighted];
        [_faceButton addTarget:self action:@selector(faceButtonDown:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _faceButton;
}

- (UITextView *) textView
{
    if (_textView == nil) {
        _textView = [[UITextView alloc] initWithFrame:self.talkButton.frame];
        [_textView setFont:[UIFont systemFontOfSize:16.0f]];
        [_textView.layer setMasksToBounds:YES];
        [_textView.layer setCornerRadius:4.0f];
        [_textView.layer setBorderWidth:0.5f];
        [_textView.layer setBorderColor:self.topLine.backgroundColor.CGColor];
        [_textView setScrollsToTop:NO];
        [_textView setReturnKeyType:UIReturnKeySend];
        [_textView setDelegate:self];
    }
    return _textView;
}

- (UIButton *) talkButton
{
    if (_talkButton == nil) {
        _talkButton = [[UIButton alloc] initWithFrame:CGRectMake(self.voiceButton.x + self.voiceButton.width + 4, self.height * 0.13, self.faceButton.x - self.voiceButton.x - self.voiceButton.width - 8, HEIGHT_TEXTVIEW)];
        [_talkButton setTitle:@"按住 说话" forState:UIControlStateNormal];
        [_talkButton setTitle:@"松开 结束" forState:UIControlStateHighlighted];
        [_talkButton setTitleColor:[UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:1.0] forState:UIControlStateNormal];
//        [_talkButton setBackgroundImage:[UIImage gxz_imageWithColor:[UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:0.5]] forState:UIControlStateHighlighted];
        [_talkButton setBackgroundColor:[UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:0.5]];
        [_talkButton.titleLabel setFont:[UIFont boldSystemFontOfSize:16.0f]];
        [_talkButton.layer setMasksToBounds:YES];
        [_talkButton.layer setCornerRadius:4.0f];
        [_talkButton.layer setBorderWidth:0.5f];
        [_talkButton.layer setBorderColor:self.topLine.backgroundColor.CGColor];
        [_talkButton setHidden:YES];
//        [_talkButton addTarget:self action:@selector(talkButtonDown:) forControlEvents:UIControlEventTouchDown];
//        [_talkButton addTarget:self action:@selector(talkButtonUpInside:) forControlEvents:UIControlEventTouchUpInside];
//        [_talkButton addTarget:self action:@selector(talkButtonUpOutside:) forControlEvents:UIControlEventTouchUpOutside];
//        [_talkButton addTarget:self action:@selector(talkButtonTouchCancel:) forControlEvents:UIControlEventTouchCancel];
//        [_talkButton addTarget:self action:@selector(talkButtonDragOutside:) forControlEvents:UIControlEventTouchDragOutside];
//        [_talkButton addTarget:self action:@selector(talkButtonDragInside:) forControlEvents:UIControlEventTouchDragInside];
    }
    return _talkButton;
}

-(void)voiceButtonDown:(id)sender
{
    
}

-(void)moreButtonDown:(id)sender
{
    
}

-(void)faceButtonDown:(id)sender
{
    
}
@end
