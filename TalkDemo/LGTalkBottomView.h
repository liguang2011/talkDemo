//
//  LGTalkBottomView.h
//  TalkDemo
//
//  Created by 李光 on 16/11/14.
//  Copyright © 2016年 Firstlight. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LGTalkBottomViewDelegate <NSObject>

// change chatBox height
- (void)didChangeChatBoxHeight:(CGFloat)height;
/**
 *  send text message
 *
 *  @param chatboxViewController chatboxViewController
 *  @param messageStr            text
 */
- (void)sendTextMessage:(NSString *)messageStr;
/**
 *  send image message
 *
 *  @param chatboxViewController ICChatBoxViewController
 *  @param image                 image
 *  @param imgPath               image path
 */
- (void) sendImageMessage:(UIImage *)image imagePath:(NSString *)imgPath;

/**
 *  send voice message
 *
 *  @param chatboxViewController ICChatBoxViewController
 *  @param voicePath             voice path
 */
- (void) sendVoiceMessage:(NSString *)voicePath;

- (void) voiceDidStartRecording;
// voice太短
- (void) voiceRecordSoShort;

- (void) voiceWillDragout:(BOOL)inside;

- (void) voiceDidCancelRecording;


//- (void) chatBoxViewController:(ICChatBoxViewController *)chatboxViewController
//          didVideoViewAppeared:(ICVideoView *)videoView;
//
//
//- (void) chatBoxViewController:(ICChatBoxViewController *)chatboxViewController sendVideoMessage:(NSString *)videoPath;
//
//- (void) chatBoxViewController:(ICChatBoxViewController *)chatboxViewController sendFileMessage:(NSString *)fileName;

@end
@interface LGTalkBottomView : UIView

@property (nonatomic, assign)id<LGTalkBottomViewDelegate>delegate;
@property (nonatomic, assign) ICChatBoxStatus status;
@property (nonatomic, strong) ICChatBoxMoreView *chatBoxMoreView;

@end
