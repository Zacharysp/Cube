//
//  ICMostCubesRcvSentDHolder.h
//  IntegrityCubes
//
//  Created by aditi on 14/04/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ICMostCubesRcvSentDHolder : NSObject{
    
}
@property(nonatomic,assign)NSInteger intUserId;
@property(nonatomic,strong)NSString *strUserName;
@property(nonatomic,strong)NSString *strUserImageUrl;
@property(nonatomic,strong)NSString *strUserCubeCount;

@property(nonatomic,assign)NSInteger intTeamId;
@property(nonatomic,strong)NSString *strTeamName;
@property(nonatomic,strong)NSString *strTeamImageUrl;
@property(nonatomic,strong)NSString *strTeamCubeCount;
@property(nonatomic,strong)NSString *strUserRank;
@end
