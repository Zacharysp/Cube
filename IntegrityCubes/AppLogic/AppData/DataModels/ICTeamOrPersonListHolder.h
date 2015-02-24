//
//  ICTeamOrPersonListHolder.h
//  IntegrityCubes
//
//  Created by Bhuvan Sharma on 21/03/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ICTeamOrPersonListHolder : NSObject

@property(nonatomic,strong)NSString *strPersonFirstName;
@property(nonatomic,strong)NSString *strPersonLastName;
@property(nonatomic,strong)NSString *strPersonUserId;
@property(nonatomic,strong)NSString *strPersonImageUrl;
@property(nonatomic,strong)NSString *strTeamName;
@property(nonatomic,strong)NSString *strTeamId;
@property(nonatomic,strong)NSString *strTeamImageUrl;
@property(nonatomic,strong)NSString *strRecordType;
@property(nonatomic,strong)UIImage  *imgPerson;
@property(nonatomic,strong)UIImage  *imgTeam;

@end
