//
//  ICRestIntraction.h
//  IntegrityCubes
//
//  Created by aditi on 13/03/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIFormDataRequest.h"
#import "JSON.h"
#import "ICCubeFeedCommentHolder.h"
#import "ICCubeCommentHolder.h"
#import "ICCubeRecentHolder.h"
#import "ICTeamListDataHolder.h"
#import "ICTeamPosterDataHolder.h"
#import "ICCommonChartDataHolder.h"
#import "ICCubeOfTheWeekDHolder.h"
#import "ICMostCubesRcvSentDHolder.h"
#import "ICCubeTranslatorDHolder.h"
#import "ICNotificationSettingHolder.h"
#import "ICNotificationUpdateSettingHolder.h"

@class ICRestIntraction;
ICRestIntraction *restIntraction;

@interface ICRestIntraction : NSObject
{
    NSString *strResponseGetPassword;
    NSString *strChangePasswordResponse;
    NSString *strSaveInformationResponse;
    
    NSURL *urlLogin;
    NSURL *urlLogout;
    NSURL *urlNotificationSetting;
    NSURL *urlNotificationUpdateSetting;
    NSURL *urlForget;
    NSURL *urlPostCube;
    NSURL *urlEditLink;
    NSURL *urlCubeList;
    NSURL *urlTeamList;
    NSURL *urlUserDetail;
    NSURL *urlCubeRecent;
    NSURL *urlTeamDetail;
    NSURL *urlCubeFeedList;
    NSURL *urlDeleteComment;
    NSURL *urlCubeOfTheWeek;
    NSURL *urlChangePassword;
    NSURL *urlDeleteCubeFeed;
    NSURL *urlEmployeeOrTeam;
    NSURL *urlNoUserActivity;
    NSURL *urlCubeTranslator;
    NSURL *urlCubeCommentList;
    NSURL *urlCubeFeedPostLike;
    NSURL *urlTeamPosterDetail;
    NSURL *urlCubePiaChartTeam;
    NSURL *urlCubePiaChartValue;
    NSURL *urlCubeChartOverTime;
    NSURL *urlCubeSentMyFeedList;
    NSURL *urlMostRcvCubesByTeam;
    NSURL *urlCubeFeedPostComment;
    NSURL *urlSearchOrViewProfile;
    NSURL *urlCubePiaChartDivision;
    NSURL *urlMostRcvCubesByPerson;
    NSURL *urlMostSentCubesByPerson;
    NSURL *urlCubeReceivedMyFeedList;
    NSURL *urlNotificationServerList;
    NSURL *urlSearchCubeFeedList;
}
+(id)sharedManager;

-(void)requestForLogin:(NSMutableDictionary*)info;
-(void)requestForNotificationSettingUpdate:(NSMutableDictionary*)info;
-(void)requestForPostCube:(NSMutableDictionary*)info;
-(void)requestForForgotPwd:(NSMutableDictionary*)info;
-(void)requestForUserDetail:(NSMutableDictionary*)info;
-(void)requestForChangePassword:(NSMutableDictionary*)info;

-(void)requestForListCube;
-(void)requestForListTeamOrEmployee;
-(void)requestForListCubeComment:(NSMutableDictionary*)info;
-(void)requestForListCubeFeedComments:(NSMutableDictionary*)info;
-(void)requestForListSearchCubeFeed:(NSMutableDictionary*)info;

-(void)requestForCubeRecent:(NSMutableDictionary *)info;
-(void)requestForCubeOfTheWeek:(NSMutableDictionary*)info;
-(void)requestForCubeTranslator:(NSMutableDictionary*)info;
-(void)requestForCubeFeedPostLike:(NSMutableDictionary*)info;
-(void)requestForCubePiaChartTeam:(NSMutableDictionary*)info;
-(void)requestForCubePiaChartValue:(NSMutableDictionary*)info;
-(void)requestForCubeChartOverTime:(NSMutableDictionary*)info;
-(void)requestForCubeSentMyFeedList:(NSMutableDictionary*)info;
-(void)requestForCubeFeedPostComment:(NSMutableDictionary*)info;
-(void)requestForCubePiaChartDivision:(NSMutableDictionary*)info;
-(void)requestForCubeReceivedMyFeedList:(NSMutableDictionary*)info;

-(void)requestForTeamList:(NSMutableDictionary*)info;
-(void)requestForTeamDetail:(NSMutableDictionary*)info;
-(void)requestForTeamPosterDetail:(NSMutableDictionary*)info;

-(void)requestForMostRcvCubesByTeam:(NSMutableDictionary*)info;
-(void)requestForMostRcvCubesByPerson:(NSMutableDictionary*)info;
-(void)requestForMostSentCubesByPerson:(NSMutableDictionary*)info;

-(void)requestForEditLink:(NSMutableDictionary*)info;
-(void)requestForDeleteComment:(NSMutableDictionary*)info;
-(void)requestForDeleteCubeFeed:(NSMutableDictionary*)info;
-(void)requestForNoUserActivity:(NSMutableDictionary*)info;
-(void)requestForSearchOrViewProfile:(NSMutableDictionary*)info;
-(void)requestForLogout;
-(void)NotificationRequest;
-(void)requestForNotificationFromServer;

@end
