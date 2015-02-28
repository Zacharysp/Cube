//
//  ICCubeFeedCommentHolder.h
//  IntegrityCubes
//
//  Created by Bhuvan Sharma on 22/03/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ICCubeFeedCommentHolder : NSObject

@property(nonatomic,strong)NSString *strCubeId;
@property(nonatomic,strong)NSString *strCubeFeedId;
@property(nonatomic,strong)NSString *strCubeTitle;
@property(nonatomic,strong)NSString *strCubeValue;
@property(nonatomic,strong)NSString *strCubeImageUrl;
@property(nonatomic,strong)NSString *strComment;
@property(nonatomic,strong)NSString *strCubePostrId;
@property(nonatomic,strong)NSString *strCubePosterImageUrl;
@property(nonatomic,strong)NSString *strCubeRecievedId;
@property(nonatomic,strong)NSString *strCubeRecievedImageUrl;
@property(nonatomic,strong)NSString *strCubePosterName;
@property(nonatomic,strong)NSString *strCubeRecievedName;
@property(nonatomic,strong)NSString *strCubePostedDate;
@property(nonatomic,strong)NSString *strCubePostedType;

@property(nonatomic,strong)NSString *strCubeType;

@property(nonatomic,strong)UIImage  *imgCubeImage;
@property(nonatomic,strong)UIImage  *imgCubePosterImage;
@property(nonatomic,strong)UIImage  *imgCubeRecieverImage;

@property(nonatomic,assign)NSInteger strTotalComments;
@property(nonatomic,assign)NSInteger strTotalLike;
@property(nonatomic,assign)NSInteger likestatus;

@property(nonatomic,assign)NSInteger intSenderId;
@property(nonatomic,assign)NSInteger intReceiverId;

@property(nonatomic,strong)NSMutableArray *arrCommentData;




@end
