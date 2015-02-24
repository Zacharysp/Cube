//
//  ICTeamPosterDataHolder.h
//  IntegrityCubes
//
//  Created by Bhuvan Sharma on 10/04/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ICTeamPosterDataHolder : NSObject
@property(nonatomic,assign)BOOL isCubeRcvSelected;
@property(nonatomic,assign)BOOL isCubeSendSelected;
@property(nonatomic,assign)NSInteger intUserId;
@property(nonatomic,strong)NSString *strUserName;
@property(nonatomic,strong)NSString *strUserImage;
@property(nonatomic,assign)NSInteger countReceivedCube;
@property(nonatomic,assign)NSInteger countPostedCube;
@property(nonatomic,strong)NSMutableArray *arrReceivedCube;
@property(nonatomic,strong)NSMutableArray *arrPostedCube;

@end
