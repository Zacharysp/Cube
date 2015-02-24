//
//  ICCubeFeedCell.m
//  IntegrityCubes
//
//  Created by user on 21/03/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//

#import "ICCubeFeedCell.h"

@implementation ICCubeFeedCell
@synthesize imgVCommentBox,imgVUserPoster,imgVCubeSender,imgVCubeReciever,imgVCube,lblNumberLike,lblLike,lblCubeSender,lblCubeReciever,lblCommentCount,lblCubeComments,lblCommentBtn,lblBackgroundCell,btnLikeComment,btnComment,btnLikeImg,btnCubeSender,btnCubeReceiver,btnFeedDelete,lblCubeDate;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
       
        //for background Label
        lblBackgroundCell = [[UILabel alloc]initWithFrame:CGRectMake(0, 2, 308 , 134)];
        lblBackgroundCell.backgroundColor=[UIColor whiteColor];
        lblBackgroundCell.layer.masksToBounds = NO;
        lblBackgroundCell.layer.cornerRadius=2.0f;
        lblBackgroundCell.layer.borderColor = [UIColor grayColor].CGColor;
        lblBackgroundCell.layer.borderWidth=0.1;
        
        //for Cube Sender's Image
        imgVCubeSender = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 35 , 35)];
        imgVCubeSender.layer.cornerRadius=2.0f;
            
        UIImageView *imgVArrow = [[UIImageView alloc]initWithFrame:CGRectMake(110, 24, 8, 8)];
        imgVArrow.image = [UIImage imageNamed:@"arrow.png"];
        
        ///for cube Reciever's Image
        imgVCubeReciever = [[UIImageView alloc]initWithFrame:CGRectMake(77, 10, 35, 35)];
        imgVCubeReciever.layer.cornerRadius=2.0f;
        
        //for cube image
        imgVCube=[[ICCubeImageView alloc]initWithFrame:CGRectMake(238, 10, 60, 60)];
        imgVCube.layer.cornerRadius=5.0;
        
        //for cube sender name
        lblCubeSender=[[UILabel alloc]initWithFrame:CGRectMake(2, 40, 65, 20)];
        [lblCubeSender setFont:[UIFont systemFontOfSize:9]];
        lblCubeSender.adjustsFontSizeToFitWidth=YES;
        lblCubeSender.textColor = [UIColor colorWithRed:70.0/2555 green:130.0/255 blue:180.0/255 alpha:1];
        lblCubeSender.textAlignment=NSTextAlignmentCenter;
        
        btnCubeSender=[[ICLikeCommentButton alloc]initWithFrame:CGRectMake(2, 10, 65, 46)];
//        btnCubeSender.backgroundColor = [UIColor redColor];
        
        //for cube receiver name
        lblCubeReciever=[[UILabel alloc]initWithFrame:CGRectMake(110, 40, 65, 20)];
        [lblCubeReciever setFont:[UIFont systemFontOfSize:9]];
        lblCubeReciever.adjustsFontSizeToFitWidth=YES;
        lblCubeReciever.textColor = [UIColor colorWithRed:70.0/2555 green:130.0/255 blue:180.0/255 alpha:1];
        lblCubeReciever.textAlignment=NSTextAlignmentCenter;
        
        btnCubeReceiver = [[ICLikeCommentButton alloc]initWithFrame:CGRectMake(110, 10, 65, 46)];
//        btnCubeReceiver.backgroundColor = [UIColor redColor];
        
        //for comments
        lblCubeComments=[[UILabel alloc]initWithFrame:CGRectMake(6, 60, 225, 50)];
        lblCubeComments.adjustsFontSizeToFitWidth=YES;
        lblCubeComments.minimumScaleFactor=0.3;
        [lblCubeComments setFont:[UIFont systemFontOfSize:10]];
        lblCubeComments.numberOfLines=3;
        lblCubeComments.textColor = [UIColor blackColor];
        lblCubeComments.lineBreakMode=YES;
               
        //for like image
        btnLikeImg = [[UIImageView alloc] initWithFrame:CGRectMake(8, 108, 15, 15)];
        btnLikeImg.image=[UIImage imageNamed:@"like.png"];

        //for cube like label
        lblLike=[[UILabel alloc]initWithFrame:CGRectMake(48, 106, 59, 20)];
        [lblLike setFont:[UIFont systemFontOfSize:12]];
        lblLike.text=@"Like";
        [lblLike setFont:[UIFont fontWithName:@"Helvetica" size:14]];
        lblLike.textColor = [UIColor colorWithRed:128.0/255 green:128.0/255 blue:128.0/255 alpha:1];
        
        //for like number Label
        lblNumberLike=[[UILabel alloc]initWithFrame:CGRectMake(30, 106, 30, 20)];
        [lblNumberLike setFont:[UIFont systemFontOfSize:12]];
        lblNumberLike.textColor = [UIColor blackColor];

        //for like btn
        btnLikeComment = [[ICLikeCommentButton alloc] initWithFrame:CGRectMake(6, 106, 100, 22)];
        [btnLikeComment setBackgroundColor:[UIColor colorWithRed:171.0/255 green:171.0/255 blue:171.0/255 alpha:0.09]];
        
        //for delete button
         btnFeedDelete=[[ICLikeCommentButton alloc] initWithFrame:CGRectMake(238, 75, 60, 20)];
        [btnFeedDelete setBackgroundColor:[UIColor colorWithRed:193.0/255 green:0 blue:33.0/255 alpha:1]];
        [btnFeedDelete setTitle:@"Delete" forState:UIControlStateNormal];
        [btnFeedDelete setTintColor:[UIColor whiteColor]];
        [btnFeedDelete.titleLabel setFont:[UIFont systemFontOfSize:12]];
        btnFeedDelete.layer.cornerRadius=2.0f;
        btnFeedDelete.showsTouchWhenHighlighted=YES;
        
        //comments image
        imgVCommentBox=[[UIImageView alloc]initWithFrame:CGRectMake(200, 108, 20, 20)];
        imgVCommentBox.image = [UIImage imageNamed:@"commentIphn.png"];
        
        //for cube commentbtn Label
        lblCommentBtn=[[UILabel alloc]initWithFrame:CGRectMake(240, 106, 70, 20)];
        [lblCommentBtn setFont:[UIFont systemFontOfSize:12]];
        lblCommentBtn.text=@"Comments";
        [lblCommentBtn setFont:[UIFont fontWithName:@"Helvetica" size:13]];
        lblCommentBtn.textColor = [UIColor colorWithRed:128.0/255 green:128.0/255 blue:128.0/255 alpha:1];
        
        //for comments count Label
        lblCommentCount=[[UILabel alloc]initWithFrame:CGRectMake(225, 106, 25, 20)];
        [lblCommentCount setFont:[UIFont systemFontOfSize:12]];
        
        //lblCommentCount.textAlignment=NSTextAlignmentCenter;
        lblCommentCount.textColor = [UIColor blackColor];
        
        //for lbl CubeDate
        lblCubeDate=[[UILabel alloc]initWithFrame:CGRectMake(55, 20, 55, 15)];
        lblCubeDate.textColor=[UIColor grayColor];
        [lblCubeDate setFont:[UIFont systemFontOfSize:8]];
        lblCubeDate.adjustsFontSizeToFitWidth=YES;
        lblCubeDate.minimumScaleFactor=0.4;
        
        //for comment button
        btnComment = [[ICLikeCommentButton alloc]initWithFrame:CGRectMake(195, 106, 106, 22)];
       [btnComment setBackgroundColor:[UIColor colorWithRed:171.0/255 green:171.0/255 blue:171.0/255 alpha:0.09]];
        
        [self.contentView addSubview:lblBackgroundCell];
        [self.contentView addSubview:imgVCubeSender];
        [self.contentView addSubview:imgVArrow];
        [self.contentView addSubview:imgVCubeReciever];
        [self.contentView addSubview:imgVCube];
        [self.contentView addSubview:lblCubeSender];
        [self.contentView addSubview:lblCubeReciever];
        [self.contentView addSubview:lblCubeComments];
        [self.contentView addSubview:lblLike];
        [self.contentView addSubview:lblCommentBtn];
        [self.contentView addSubview:lblCommentCount];
        [self.contentView addSubview:btnComment];
        [self.contentView addSubview:btnLikeComment];
        [self.contentView addSubview:imgVCommentBox];
        [self.contentView addSubview:lblNumberLike];
        [self.contentView addSubview:btnLikeImg];
        [self.contentView addSubview:btnCubeReceiver];
        [self.contentView addSubview:btnCubeSender];
        [self.contentView addSubview:btnFeedDelete];
        [self.contentView addSubview:lblCubeDate];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end


