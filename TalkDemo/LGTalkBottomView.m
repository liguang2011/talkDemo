//
//  LGTalkBottomView.m
//  TalkDemo
//
//  Created by 李光 on 16/11/14.
//  Copyright © 2016年 Firstlight. All rights reserved.
//

#import "LGTalkBottomView.h"
@interface LGTalkBottomView()



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
    //表情
    UIButton *faceButton = [UIButton buttonWithType:UIButtonTypeCustom];
    CGFloat faceBtnX = 0;
    CGFloat faceBtnY = 0;
    CGFloat faceBtnW = TalkBottomH;
    CGFloat faceBtnH = self.frame.size.height;
    faceButton.frame = CGRectMake(faceBtnX, faceBtnY, faceBtnW, faceBtnH);
    faceButton.backgroundColor = [UIColor blueColor];
    [faceButton setTitle:@"Face" forState:UIControlStateNormal];
    faceButton.titleLabel.font = FontDefault14;
    [faceButton setTintColor:[UIColor yellowColor]];
    [self addSubview:faceButton];
    faceButton.tag = 10;
    [faceButton addTarget:nil action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    //编辑
    UITextView *textView = [[UITextView alloc]init];
    CGFloat textViewX = CGRectGetMaxX(faceButton.frame) + 15;
    CGFloat textViewY = 0;
    CGFloat textViewW = 150;
    CGFloat textViewH = self.frame.size.height;
    textView.frame = CGRectMake(textViewX, textViewY, textViewW, textViewH);
    textView.backgroundColor = [UIColor whiteColor];
    textView.textColor = [UIColor blackColor];
    textView.layer.cornerRadius = textViewH / 2;
    textView.layer.masksToBounds = YES;
    [self addSubview: textView];
    
    //发送
    UIButton *sendButton = [UIButton buttonWithType:UIButtonTypeCustom];
    CGFloat sendButtonX = CGRectGetMaxX(textView.frame) + 10;
    CGFloat sendButtonY = 0;
    CGFloat sendButtonW = TalkBottomH;
    CGFloat sendButtonH = self.frame.size.height;
    sendButton.frame = CGRectMake(sendButtonX, sendButtonY, sendButtonW, sendButtonH);
    sendButton.backgroundColor = [UIColor blueColor];
    [sendButton setTitle:@"Send" forState:UIControlStateNormal];
    sendButton.titleLabel.font = FontDefault14;
    [sendButton setTintColor:[UIColor yellowColor]];
    sendButton.titleLabel.textColor = [UIColor yellowColor];
    [self addSubview:sendButton];
    sendButton.tag = 11;
    [sendButton addTarget:nil action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    //更多
    UIButton *moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
    CGFloat moreButtonX = CGRectGetMaxX(sendButton.frame) + 10;
    CGFloat moreButtonY = 0;
    CGFloat moreButtonW = TalkBottomH;
    CGFloat moreButtonH = self.frame.size.height;
    moreButton.frame = CGRectMake(moreButtonX, moreButtonY, moreButtonW, moreButtonH);
    moreButton.backgroundColor = [UIColor blueColor];
    [moreButton setTitle:@"More" forState:UIControlStateNormal];
    moreButton.titleLabel.font = FontDefault14;
    [moreButton setTintColor:[UIColor yellowColor]];
    [self addSubview:moreButton];
    moreButton.tag = 12;
    [moreButton addTarget:nil action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)btnClick : (UIButton *)sender
{
    switch (sender.tag) {
        case 10:
            
            break;
         
        case 11:
            
            break;
        case 12:
            
            break;
        default:
            break;
    }
    
    
}


@end
