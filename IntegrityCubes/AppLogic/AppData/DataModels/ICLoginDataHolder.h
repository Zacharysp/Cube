//
//  ICLoginDataHolder.h
//  IntegrityCubes
//
//  Created by aditi on 21/03/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ICLoginDataHolder : NSObject
{
    
}
@property(nonatomic,assign)NSInteger icUserId;
@property(nonatomic,strong)NSString *strBamBooId;
@property(nonatomic,strong)NSString *strFirstName;
@property(nonatomic,strong)NSString *strLastName;
@property(nonatomic,strong)NSString *strUserName;
@property(nonatomic,strong)NSString *strUserType;
@property(nonatomic,strong)NSString *strUserImageUrl;
@property(nonatomic,strong)NSString *strDivision;
@property(nonatomic,strong)NSString *strJobTitle;
@property(nonatomic,strong)NSString *strEmail;
@property(nonatomic,strong)NSString *strPhone;
@property(nonatomic,strong)NSString *strState;
@property(nonatomic,strong)NSString *strCity;
@property(nonatomic,strong)NSMutableArray *arrTeamId;
@property(nonatomic,strong)UIImage *imgUser;



@end
