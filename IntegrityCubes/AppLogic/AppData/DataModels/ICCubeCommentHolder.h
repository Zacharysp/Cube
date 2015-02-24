//
//  ICCubeCommentHolder.h
//  IntegrityCubes
//
//  Created by Bhuvan Sharma on 22/03/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ICCubeCommentHolder : NSObject

@property(nonatomic,strong)NSString *strCommentPosterId;
@property(nonatomic,strong)NSString *strCubeComment;
@property(nonatomic,strong)NSString *strCommentPosterName;
@property(nonatomic,strong)NSString *strCommentPosterImageUrl;
@property(nonatomic,strong)UIImage  *imgCommentPosterImage;


@end
