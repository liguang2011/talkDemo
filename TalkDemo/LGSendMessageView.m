//
//  LGSendMessageView.m
//  TalkDemo
//
//  Created by 李光 on 16/11/15.
//  Copyright © 2016年 Firstlight. All rights reserved.
//

#import "LGSendMessageView.h"
#import "LGMsgContentView.h"

@interface LGSendMessageView()
@property (nonatomic,strong)UIImageView *headImage;
@property (nonatomic,strong)UILabel *nameLabel;
@property (nonatomic,strong)LGMsgContentView *msgContentView;
@end

@implementation LGSendMessageView

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
        [self createDeauftUI];
    }
    return self;
}

-(void)createDeauftUI
{
    _headImage = [[UIImageView alloc]init];
    _headImage.frame = CGRectMake(0, 0, HeadImageWidth, HeadImageWidth);
}

@end
