//
//  ICCubeFeedCell.h
//  IntegrityCubes
//
//  Created by user on 21/03/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICLikeCommentButton.h"
#import "ICCubeImageView.h"

@class ICCubeFeedCell;

@interface ICCubeFeedCell : UITableViewCell<UITextViewDelegate>

@property (nonatomic, strong)ICCubeImageView *imgVCube;
@property (nonatomic, strong)UIImageView *imgVCubeSender;
@property (nonatomic, strong)UIImageView *imgVCubeReciever;
@property (nonatomic, strong)UIImageView *imgVUserPoster;
@property (nonatomic, strong)UIImageView *imgVCommentBox;

@property (nonatomic, strong)UILabel *lblBackgroundCell;
@property (nonatomic, strong)UILabel *lblCubeSender;
@property (nonatomic, strong)UILabel *lblCubeReciever;
@property (nonatomic, strong)UILabel *lblCubeComments;
@property (nonatomic, strong)UILabel *lblLike;
@property (nonatomic, strong)UILabel *lblCommentBtn;
@property (nonatomic, strong)UILabel *lblCommentCount;
@property (nonatomic, strong)UILabel *lblNumberLike;
@property (nonatomic, strong)UILabel *lblCubeDate;

@property (nonatomic, strong)ICLikeCommentButton *btnCubeSender;
@property (nonatomic, strong)ICLikeCommentButton *btnCubeReceiver;
@property (nonatomic, strong)ICLikeCommentButton *btnFeedDelete;

@property (nonatomic, strong)ICLikeCommentButton *btnImageSender;
@property (nonatomic, strong)ICLikeCommentButton *btnImageReceiver;

@property (nonatomic, strong)ICLikeCommentButton *btnComment;
@property (nonatomic, strong)UIImageView *btnLikeImg;
@property (nonatomic, strong)ICLikeCommentButton *btnLikeComment;


@end
