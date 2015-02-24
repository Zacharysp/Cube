 //
//  ICRestIntraction.m
//  IntegrityCubes
//
//  Created by aditi on 13/03/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//

#import "ICRestIntraction.h"

@implementation ICRestIntraction
+(id)sharedManager{
    
    if (!restIntraction) {
        
        restIntraction = [ICRestIntraction new];
        
    }
    return  restIntraction;
}

- (id)init
{
    if (self = [super init])
    {
        NSString *strUrlLogin = URL_LOGIN;
        urlLogin = [[NSURL alloc]initWithString:strUrlLogin];
        
        NSString *strUrlUserDetail=URL_USER_DETAIL;
        urlUserDetail=[[NSURL alloc]initWithString:strUrlUserDetail];
        
        NSString *strForget = URL_FORGOT_PASSWORD;
        urlForget = [[NSURL alloc]initWithString:strForget];
        
        NSString *strPostCube = URL_CUBE_POST;
        urlPostCube = [[NSURL alloc]initWithString:strPostCube];
        
        NSString *strTeamOrPersonList = URL_TEAM_PERSON_LIST;
        urlEmployeeOrTeam = [[NSURL alloc]initWithString:strTeamOrPersonList];
        
        NSString *strCubeList = URL_CUBE_LIST;
        urlCubeList = [[NSURL alloc]initWithString:strCubeList];
        
        NSString *strCubeFeedList = URL_CUBE_FEED_LIST;
        urlCubeFeedList = [[NSURL alloc]initWithString:strCubeFeedList];
      
        NSString *strCubeComment = URL_CUBE_COMMENT_LIST;
        urlCubeCommentList = [[NSURL alloc]initWithString:strCubeComment];
        
        NSString *strCubeFeedPostComment = URL_CUBE_FEED_POST_COMMENT;
        urlCubeFeedPostComment = [[NSURL alloc]initWithString:strCubeFeedPostComment];
        
        NSString *strCubeFeedPostLike = URL_CUBE_FEED_POST_LIKE;
        urlCubeFeedPostLike = [[NSURL alloc]initWithString:strCubeFeedPostLike];
        
        NSString *strCubeRecent = URL_CUBE_RECENT;
        urlCubeRecent = [[NSURL alloc]initWithString:strCubeRecent];
        
        NSString *strCubeReceivedMyFeedList = URL_CUBE_RECEIVED_MY_FEED_LIST;
        urlCubeReceivedMyFeedList = [[NSURL alloc]initWithString:strCubeReceivedMyFeedList];
        
        NSString *strCubeSentMyFeedList = URL_CUBE_SENT_MY_FEED_LIST;
        urlCubeSentMyFeedList = [[NSURL alloc]initWithString:strCubeSentMyFeedList];

        NSString *strTeamList = URL_TEAM_LIST;
        urlTeamList = [[NSURL alloc]initWithString:strTeamList];
        
        NSString *strTeamDetail =URL_TEAM_DETAIL;
        urlTeamDetail=[[NSURL alloc]initWithString:strTeamDetail];
        
        NSString *strTeamPosterDetail=URL_TEAM_POSTER_DETAIL;
        urlTeamPosterDetail=[[NSURL alloc]initWithString:strTeamPosterDetail];
        
        NSString *strCubePiaChartValue = URL_CUBE_PIACHART_VALUE;
        urlCubePiaChartValue = [[NSURL alloc]initWithString:strCubePiaChartValue];
        
        NSString *strCubePiaChartDivision = URL_CUBE_PIACHART_DIVISION;
        urlCubePiaChartDivision = [[NSURL alloc]initWithString:strCubePiaChartDivision];
        
        NSString *strCubePiaChartTeam =URL_CUBE_PIACHART_TEAM;
        urlCubePiaChartTeam=[[NSURL alloc]initWithString:strCubePiaChartTeam];
        
        NSString *strCubeChartOverTime=URL_CUBE_CHAT_OVERTIME;
        urlCubeChartOverTime=[[NSURL alloc]initWithString:strCubeChartOverTime];
        
        NSString *strCubeOfTheWeek=URL_CUBE_OF_THE_WEEK;
        urlCubeOfTheWeek=[[NSURL alloc]initWithString:strCubeOfTheWeek];
        
        NSString *strMostRcvCubesByPerson=URL_MOST_RCV_CUBES_BY_PERSON;
        urlMostRcvCubesByPerson=[[NSURL alloc]initWithString:strMostRcvCubesByPerson];
        
        NSString *strMostSentCubesByPerson=URL_MOST_SENT_CUBES_BY_PERSON;
        urlMostSentCubesByPerson=[[NSURL alloc]initWithString:strMostSentCubesByPerson];
        
        NSString *strMostRcvCubesByTeam=URL_MOST_RCV_CUBES_BY_TEAM;
        urlMostRcvCubesByTeam=[[NSURL alloc]initWithString:strMostRcvCubesByTeam];
        
        NSString *strNoUserActivity=URL_NO_USER_ACTIVITY;
        urlNoUserActivity=[[NSURL alloc]initWithString:strNoUserActivity];
        
        NSString *strCubeTranslator=URL_CUBE_TRANSLATOR;
        urlCubeTranslator=[[NSURL alloc]initWithString:strCubeTranslator];
        
        NSString *strChangePassword=URL_CHANGE_PASSWORD;
        urlChangePassword=[[NSURL alloc]initWithString:strChangePassword];
        
        NSString *strEditLink=URL_EDIT_LINK;
        urlEditLink=[[NSURL alloc]initWithString:strEditLink];
        
        NSString *strDeleteCubeFeed=URL_DELETE_CUBE_FEED;
        urlDeleteCubeFeed=[[NSURL alloc]initWithString:strDeleteCubeFeed];
        
        NSString *strSearchOrViewProfile=URL_SEARCH_OR_VIEW_PROFILE;
        urlSearchOrViewProfile=[[NSURL alloc]initWithString:strSearchOrViewProfile];
        
        NSString *strDeleteComment=URL_DELETE_COMMENT;
        urlDeleteComment=[[NSURL alloc]initWithString:strDeleteComment];
        
        NSString *strNotificationList=URL_CUBE_NOTIFICATION_SERVER_LIST;
        urlNotificationServerList=[[NSURL alloc]initWithString:strNotificationList];
        
        NSString *strLogout=URL_LOGOUT;
        urlLogout=[[NSURL alloc]initWithString:strLogout];
      
        NSString *strnotificationsetting=URL_NOTIFICATION_SETTING;
        urlNotificationSetting=[[NSURL alloc]initWithString:strnotificationsetting];
        
        NSString *strNotificationUpdateSetting=URL_NOTIFICATION_UPDATE_SETTING;
        urlNotificationUpdateSetting=[[NSURL alloc]initWithString:strNotificationUpdateSetting];
        
        NSString *strSearchCubeFeedList=URL_SEARCH_CUBE_FEED_LIST;
        urlSearchCubeFeedList=[[NSURL alloc]initWithString:strSearchCubeFeedList];
        
     }
    
    return self;
}

#pragma mark - LOGIN
-(void)requestForLogin:(NSMutableDictionary*)info
{    
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:urlLogin];
    
    NSString *userEmail = [info valueForKey:@"user_email"];
    NSString *userPassword = [info valueForKey:@"user_password"];
   
    [request setPostValue:[[NSUserDefaults standardUserDefaults] valueForKey:KEY_DEVICE_TOKEN] forKey:@"deviceid"];
    [request setPostValue:userEmail forKey:@"user_email"];
    [request setPostValue:userPassword forKey:@"user_password"];
   
    [request setDelegate:self];
    [request setDidFailSelector:@selector(requestLoginFail:)];
    [request setDidFinishSelector:@selector(requestLoginSuccess:)];
    [request startAsynchronous];
}

-(void)requestLoginFail:(ASIFormDataRequest*)request{
    
    dispatch_async(dispatch_get_main_queue(), ^
                   {
                       [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_LOGIN_FAILED object:@"unable to login at this movement."];
                   });
}

-(void)requestLoginSuccess:(ASIFormDataRequest*)request{
    
    NSString *responseString = [request responseString];
    responseString = [[responseString componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]] componentsJoinedByString:@""];
    responseString = [responseString stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    SBJSON *parser=[[SBJSON alloc]init];
    
    NSDictionary *results = [parser objectWithString:responseString error:nil];
    NSMutableDictionary *responseDict = ((NSMutableDictionary *)[results objectForKey:@"response"]);
    NSMutableArray *dataArr=((NSMutableArray*)[responseDict objectForKey:@"data"]);
    NSMutableDictionary *loginDetailDict=(NSMutableDictionary*)[dataArr objectAtIndex:0];
    NSInteger status_code = [[responseDict valueForKey:@"status_code"] integerValue];
        
        if (status_code==200) {
            
            loginDHolder = [ICLoginDataHolder new];
            loginDHolder.icUserId =   [[loginDetailDict valueForKey:@"user_id"] integerValue];
            loginDHolder.strBamBooId = [loginDetailDict valueForKey:@"bambooId"];
            loginDHolder.strFirstName =[loginDetailDict valueForKey:@"user_firstname"];
            loginDHolder.strLastName = [loginDetailDict valueForKey:@"user_lastname"] ;
            loginDHolder.strUserName = [loginDetailDict valueForKey:@"user_name"];
            loginDHolder.strUserType = [loginDetailDict valueForKey:@"user_type"];
            loginDHolder.strUserImageUrl =[loginDetailDict valueForKey:@"image"];
            loginDHolder.strDivision = [loginDetailDict valueForKey:@"division"];
            loginDHolder.strEmail =    [loginDetailDict valueForKey:@"email"];
            loginDHolder.strPhone =    [loginDetailDict valueForKey:@"phone"];
            loginDHolder.strJobTitle = [loginDetailDict valueForKey:@"jobtitle"];
            loginDHolder.strState =    [loginDetailDict valueForKey:@"state"];
            loginDHolder.strCity =     [loginDetailDict valueForKey:@"city"];
            loginDHolder.arrTeamId =   [loginDetailDict valueForKey:@"teamData"];
            
            dispatch_async(dispatch_get_main_queue(), ^
                           {
                               [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_LOGIN_SUCCESS object:loginDHolder];
                           });
        }else{
            
            NSString *errMsg = [responseDict objectForKey:@"message"];
            dispatch_async(dispatch_get_main_queue(), ^
                           {
                               [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_LOGIN_FAILED object:errMsg];
                           });
        }

    
}
#pragma mark - USER_DETAIL

-(void)requestForUserDetail:(NSMutableDictionary*)info
{
    
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:urlUserDetail];
    
    NSString *userId = [info valueForKey:@"user_id"];
    
    [request setPostValue:userId forKey:@"user_id"];
    
    [request setDelegate:self];
    [request setDidFailSelector:@selector(requestUserDetailFail:)];
    [request setDidFinishSelector:@selector(requestUserDetailSuccess:)];
    [request startAsynchronous];
}

-(void)requestUserDetailFail:(ASIFormDataRequest*)request{
    
    dispatch_async(dispatch_get_main_queue(), ^
                   {
                       [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_USER_DETAIL_FAILED object:@"unable to Update Detail at this movement."];
                   });
}

-(void)requestUserDetailSuccess:(ASIFormDataRequest*)request{
    
    NSString *responseString = [request responseString];
    responseString = [[responseString componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]] componentsJoinedByString:@""];
    responseString = [responseString stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    SBJSON *parser=[[SBJSON alloc]init];
    
    NSDictionary *results = [parser objectWithString:responseString error:nil];
    NSMutableDictionary *responseDict = ((NSMutableDictionary *)[results objectForKey:@"response"]);
    NSMutableArray *dataArr=((NSMutableArray*)[responseDict objectForKey:@"data"]);
   
        NSMutableDictionary *loginDetailDict=(NSMutableDictionary*)[dataArr objectAtIndex:0];
        NSInteger status_code = [[responseDict valueForKey:@"status_code"] integerValue];
        
        if (status_code==200) {
            
            //loginDHolder = [ICLoginDataHolder new];
            
            loginDHolder.icUserId =   [[loginDetailDict valueForKey:@"user_id"] integerValue];
            loginDHolder.strBamBooId = [loginDetailDict valueForKey:@"bambooId"];
            loginDHolder.strFirstName =[loginDetailDict valueForKey:@"user_firstname"];
            loginDHolder.strLastName = [loginDetailDict valueForKey:@"user_lastname"] ;
            loginDHolder.strUserName = [loginDetailDict valueForKey:@"user_name"];
            loginDHolder.strUserType = [loginDetailDict valueForKey:@"user_type"];
            loginDHolder.strUserImageUrl =[loginDetailDict valueForKey:@"image"];
            loginDHolder.strDivision = [loginDetailDict valueForKey:@"division"];
            loginDHolder.strEmail =    [loginDetailDict valueForKey:@"email"];
            loginDHolder.strPhone =    [loginDetailDict valueForKey:@"phone"];
            loginDHolder.strJobTitle = [loginDetailDict valueForKey:@"jobtitle"];
            loginDHolder.strState =    [loginDetailDict valueForKey:@"state"];
            loginDHolder.strCity =     [loginDetailDict valueForKey:@"city"];
            loginDHolder.arrTeamId =   [loginDetailDict valueForKey:@"teamData"];
            
            dispatch_async(dispatch_get_main_queue(), ^
                           {
                               [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_USER_DETAIL_SUCCESS object:loginDHolder];
                           });
        }else{
            
            NSString *errMsg = [responseDict objectForKey:@"message"];
            dispatch_async(dispatch_get_main_queue(), ^
                           {
                               [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_USER_DETAIL_FAILED object:errMsg];
                           });
        }
    
}


#pragma mark - FORGOT_PWD
-(void)requestForForgotPwd:(NSMutableDictionary*)info{
    
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:urlForget];
    
    NSString *userEmail = [info valueForKey:@"user_email"];
    
    [request setPostValue:userEmail forKey:@"user_email"];
    
    [request setDelegate:self];
    [request setDidFailSelector:@selector(requestForgotPwdFail:)];
    [request setDidFinishSelector:@selector(requestForgotPwdSuccess:)];
    [request startAsynchronous];
    
}
-(void)requestForgotPwdFail:(ASIFormDataRequest*)request{
    dispatch_async(dispatch_get_main_queue(), ^
                   {
                       [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_FORGOT_PWD_FAILED object:@"Something went wrong,try again !"];
                   });
    
}

-(void)requestForgotPwdSuccess:(ASIFormDataRequest*)request{
    
    NSString *responseString = [request responseString];
    responseString = [[responseString componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]] componentsJoinedByString:@""];
    responseString = [responseString stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    SBJSON *parser=[[SBJSON alloc]init];
    
    NSDictionary *results = [parser objectWithString:responseString error:nil];
    NSMutableDictionary *responseDict = ((NSMutableDictionary *)[results objectForKey:@"response"]);
    NSInteger statusCode = [[responseDict valueForKey:@"status_code"] integerValue];
    if (statusCode==200) {
        
        
        NSString *successMsg = [responseDict objectForKey:@"message"];
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_FORGOT_PWD_SUCCESS object:successMsg];
                       });
        
        
        
    }else{
        
        NSString *errMsg = [responseDict objectForKey:@"error_msg"];
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_FORGOT_PWD_FAILED object:errMsg];
                       });
    }
    
    
}


#pragma mark - LIST_TEAM_PERSON

-(void)requestForListTeamOrEmployee
{
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:urlEmployeeOrTeam];
    [request setPostValue:[NSString stringWithFormat:@"%ld",(long)loginDHolder.icUserId] forKey:@"user_id"];
    
    [request setDelegate:self];
    [request setDidFailSelector:@selector(requestListTeamEmployeeFail:)];
    [request setDidFinishSelector:@selector(requestListTeamEmployeeSuccess:)];
    [request startAsynchronous];
}

-(void)requestListTeamEmployeeFail:(ASIFormDataRequest*)request{
    
    dispatch_async(dispatch_get_main_queue(), ^
                   {
                       [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_LIST_TEAM_EMPLOYEE__FAILED object:@"unable to get list at this movement."];
                   });
}

-(void)requestListTeamEmployeeSuccess:(ASIFormDataRequest*)request
{
    NSString *responseString = [request responseString];
    responseString = [[responseString componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]] componentsJoinedByString:@""];
    responseString = [responseString stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    SBJSON *parser=[[SBJSON alloc]init];
    
    NSDictionary *results = [parser objectWithString:responseString error:nil];
    NSMutableDictionary *responseDict = ((NSMutableDictionary *)[results objectForKey:@"response"]);
    NSMutableDictionary *dataDict=((NSMutableDictionary*)[responseDict objectForKey:@"data"]);
    NSMutableArray *arrPersonListDetail=((NSMutableArray*)[dataDict objectForKey:@"persondetail"]);
    NSMutableArray *arrTeamListDetail=((NSMutableArray*)[dataDict objectForKey:@"teamdetail"]);
    NSInteger status_code = [[responseDict valueForKey:@"status_code"] integerValue];
    
   
    
    if (status_code==200)
    {
        
        NSMutableDictionary *dictTeamOrPersonList=[[NSMutableDictionary alloc]init];
        NSMutableArray *arrTeamList=[[NSMutableArray alloc]init];
        NSMutableArray *arrPersonList=[[NSMutableArray alloc]init];
        
        for (int i=0;i<arrPersonListDetail.count ; i++)
        {
            ICTeamOrPersonListHolder *personDHolder = [ICTeamOrPersonListHolder new];
            personDHolder.strPersonFirstName = [[arrPersonListDetail objectAtIndex:i] valueForKey:@"firstname"];
            personDHolder.strPersonLastName = [[arrPersonListDetail objectAtIndex:i] valueForKey:@"lastname"];
            personDHolder.strPersonUserId =[[arrPersonListDetail objectAtIndex:i] valueForKey:@"user_id"];
            personDHolder.strPersonImageUrl = [[arrPersonListDetail objectAtIndex:i] valueForKey:@"user_image"];
            personDHolder.strRecordType=[[arrPersonListDetail objectAtIndex:i]valueForKey:@"record_type"];

            [arrPersonList addObject:personDHolder];
            
        }
        
        for (int i=0; i<arrTeamListDetail.count; i++)
        {
            ICTeamOrPersonListHolder *teamDHolder = [ICTeamOrPersonListHolder new];
            teamDHolder.strTeamId = [[arrTeamListDetail objectAtIndex:i] valueForKey:@"team_id"];
            teamDHolder.strTeamName = [[arrTeamListDetail objectAtIndex:i] valueForKey:@"team_name"];
            teamDHolder.strTeamImageUrl =[[arrTeamListDetail objectAtIndex:i] valueForKey:@"team_image"];
            teamDHolder.strRecordType=[[arrTeamListDetail objectAtIndex:i]valueForKey:@"record_type"];
            [arrTeamList addObject:teamDHolder];

        }
        
        [dictTeamOrPersonList setValue:arrPersonList forKey:@"personList"];
        [dictTeamOrPersonList setValue:arrTeamList forKey:@"teamList"];

        
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_LIST_TEAM_EMPLOYEE_SUCCESS object:dictTeamOrPersonList];
                       });
    }
    else
    {
        
        NSString *errMsg = [responseDict objectForKey:@"message"];
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_LIST_TEAM_EMPLOYEE__FAILED object:errMsg];
                       });
    }
    
}


#pragma mark - LIST_CUBE

-(void)requestForListCube
{
    
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:urlCubeList];
    
    [request setDelegate:self];
    [request setDidFailSelector:@selector(requestListCubeFail:)];
    [request setDidFinishSelector:@selector(requestListCubeSuccess:)];
    [request startAsynchronous];
}

-(void)requestListCubeFail:(ASIFormDataRequest*)request{
    
    dispatch_async(dispatch_get_main_queue(), ^
                   {
                       [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_LIST_CUBE_FAILED object:@"Unable to get cube list at this movement."];
                   });
}

-(void)requestListCubeSuccess:(ASIFormDataRequest*)request{
    
    NSString *responseString = [request responseString];
    responseString = [[responseString componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]] componentsJoinedByString:@""];
    responseString = [responseString stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    SBJSON *parser=[[SBJSON alloc]init];
    
    NSDictionary *results = [parser objectWithString:responseString error:nil];
    NSMutableDictionary *responseDict = ((NSMutableDictionary *)[results objectForKey:@"response"]);
      NSMutableArray *arrCubeListDetail=((NSMutableArray*)[responseDict objectForKey:@"data"]);
   
    NSInteger status_code = [[responseDict valueForKey:@"status_code"] integerValue];
    
    if (status_code==200)
    {
        
        NSMutableArray *arrCubeList=[[NSMutableArray alloc]init];
        for (int i=0;i<arrCubeListDetail.count ; i++)
        {
            ICCubeAwardHolder *cubeDHolder = [ICCubeAwardHolder new];
            cubeDHolder.strCubeId = [[arrCubeListDetail objectAtIndex:i] valueForKey:@"cube_id"];
            cubeDHolder.strCubeTitle = [[arrCubeListDetail objectAtIndex:i] valueForKey:@"cube_title"];
            cubeDHolder.strCubeValue =[[arrCubeListDetail objectAtIndex:i] valueForKey:@"cube_value"];
            cubeDHolder.strCubeImageUrl = [[arrCubeListDetail objectAtIndex:i] valueForKey:@"cube_image"] ;
            
            [arrCubeList addObject:cubeDHolder];
            
        }
                
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_LIST_CUBE_SUCCESS object:arrCubeList];
                       });
    }else{
        
        NSString *errMsg = [responseDict objectForKey:@"message"];
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_LIST_CUBE_FAILED object:errMsg];
                       });
    }
    
}


#pragma mark - LIST_CUBE_FEED_COMMENT

-(void)requestForListCubeFeedComments:(NSMutableDictionary*)info
{    
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:urlCubeFeedList];
    [request setPostValue:[NSString stringWithFormat:@"%ld",(long)loginDHolder.icUserId] forKey:@"user_id"];
    [request setPostValue:[info valueForKey:@"page_id"] forKey:@"page_id"];
    
    [request setDelegate:self];
    [request setDidFailSelector:@selector(requestListCubeFeedCommentsFail:)];
    [request setDidFinishSelector:@selector(requestListCubeFeedCommentsSuccess:)];
    [request startAsynchronous];
}


-(void)requestListCubeFeedCommentsFail:(ASIFormDataRequest*)request{
    
    dispatch_async(dispatch_get_main_queue(), ^
                   {
                       [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_CUBE_FEED_LIST_FAILED object:@"unable to get cube feed cooments at this movement."];
                   });
}

-(void)requestListCubeFeedCommentsSuccess:(ASIFormDataRequest*)request
{    
    NSString *responseString = [request responseString];
    responseString = [[responseString componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]] componentsJoinedByString:@""];
    responseString = [responseString stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    SBJSON *parser=[[SBJSON alloc]init];
    
    NSDictionary *results = [parser objectWithString:responseString error:nil];
    NSMutableDictionary *responseDict = ((NSMutableDictionary *)[results objectForKey:@"response"]);
    NSMutableArray *arrCubeCommentListDetail=((NSMutableArray*)[responseDict objectForKey:@"data"]);
    
    NSInteger status_code = [[responseDict valueForKey:@"status_code"] integerValue];
    
    if (status_code==200)
    {
        
        NSMutableArray *arrCubeFeedCommentsList=[[NSMutableArray alloc]init];
        for (int i=0;i<arrCubeCommentListDetail.count ; i++)
        {
            ICCubeFeedCommentHolder *cubeCommentDHolder = [ICCubeFeedCommentHolder new];
            
            cubeCommentDHolder.strCubeFeedId = [[arrCubeCommentListDetail objectAtIndex:i] valueForKey:@"cubefeed_id"];
            cubeCommentDHolder.strCubeId = [[arrCubeCommentListDetail objectAtIndex:i] valueForKey:@"cube_id"];
             cubeCommentDHolder.strCubeType = [[arrCubeCommentListDetail objectAtIndex:i] valueForKey:@"cube_type"];
            cubeCommentDHolder.strComment =[[arrCubeCommentListDetail objectAtIndex:i] valueForKey:@"comment"];
            cubeCommentDHolder.strCubeImageUrl = [[arrCubeCommentListDetail objectAtIndex:i] valueForKey:@"cube_image"] ;
            cubeCommentDHolder.strCubePosterImageUrl = [[arrCubeCommentListDetail objectAtIndex:i] valueForKey:@"poster_image"];
            cubeCommentDHolder.strCubeRecievedImageUrl = [[arrCubeCommentListDetail objectAtIndex:i] valueForKey:@"receiver_image"];
            cubeCommentDHolder.strCubePostrId =[[arrCubeCommentListDetail objectAtIndex:i] valueForKey:@"cube_postedby"];
            cubeCommentDHolder.strCubeRecievedId = [[arrCubeCommentListDetail objectAtIndex:i] valueForKey:@"cube_receivedby"] ;
            cubeCommentDHolder.strTotalComments = [[[arrCubeCommentListDetail objectAtIndex:i] valueForKey:@"total_comments"] integerValue];
            cubeCommentDHolder.likestatus =[[[arrCubeCommentListDetail objectAtIndex:i] valueForKey:@"like_status"] integerValue];
            cubeCommentDHolder.strTotalLike = [[[arrCubeCommentListDetail objectAtIndex:i] valueForKey:@"total_like"] integerValue];
            cubeCommentDHolder.strCubePosterName =[[arrCubeCommentListDetail objectAtIndex:i] valueForKey:@"cube_poster_name"];
            cubeCommentDHolder.strCubeRecievedName = [[arrCubeCommentListDetail objectAtIndex:i] valueForKey:@"cube_receiver_name"] ;
            
            cubeCommentDHolder.intReceiverId=[[[arrCubeCommentListDetail objectAtIndex:i]valueForKey:@"cube_receivedby"]integerValue];
            
              cubeCommentDHolder.intSenderId=[[[arrCubeCommentListDetail objectAtIndex:i]valueForKey:@"cube_postedby"]integerValue];
            cubeCommentDHolder.strCubePostedDate=[[arrCubeCommentListDetail objectAtIndex:i]valueForKey:@"cube_posteddate"];
            
//            cubeCommentDHolder.strCubeTitle = [[arrCubeCommentListDetail objectAtIndex:i] valueForKey:@"cube_title"] ;
//            cubeCommentDHolder.strCubeValue = [[arrCubeCommentListDetail objectAtIndex:i] valueForKey:@"cube_value"] ;
            
            [arrCubeFeedCommentsList addObject:cubeCommentDHolder];
            
        }
        
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_CUBE_FEED_LIST_SUCCESS object:arrCubeFeedCommentsList];
                       });
    }else{
        
        NSString *errMsg = [responseDict objectForKey:@"message"];
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_CUBE_FEED_LIST_FAILED object:errMsg];
                       });
    }
    
}


#pragma mark - LIST_CUBE_COMMENTS

-(void)requestForListCubeComment:(NSMutableDictionary*)info
{
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:urlCubeCommentList];
    NSString *pageId=[info valueForKey:@"page_id"];
    NSString *notificationId =[info valueForKey:@"notificationId"];
    NSString *cubeFeedId=[info valueForKey:@"cubeFeedId"];
   
    [request setPostValue:pageId forKey:@"page_id"];
    [request setPostValue:[NSString stringWithFormat:@"%ld",(long)loginDHolder.icUserId] forKey:@"user_id"];
    [request setPostValue:cubeFeedId forKey:@"cubefeed_id"];
       
    [request setUserInfo:[NSDictionary dictionaryWithObjectsAndKeys:cubeFeedId,@"cubeFeedId",
                          notificationId,@"notificationId",
                          nil]];
    [request setDelegate:self];
    [request setDidFailSelector:@selector(requestListCubeCommentFail:)];
    [request setDidFinishSelector:@selector(requestListCubeCommentSuccess:)];
    [request startAsynchronous];
}

-(void)requestListCubeCommentFail:(ASIFormDataRequest*)request{
    
    dispatch_async(dispatch_get_main_queue(), ^
                   {
                       [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_CUBE_COMMENT_LIST_FAILED object:@"unable to get cube list at this movement."];
                   });
}

-(void)requestListCubeCommentSuccess:(ASIFormDataRequest*)request{
    
    NSString *responseString = [request responseString];
    responseString = [[responseString componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]] componentsJoinedByString:@""];
    responseString = [responseString stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    SBJSON *parser=[[SBJSON alloc]init];
    
    NSDictionary *results = [parser objectWithString:responseString error:nil];
    NSMutableDictionary *responseDict = ((NSMutableDictionary *)[results objectForKey:@"response"]);
    NSMutableDictionary *CubeCommentDetail=((NSMutableDictionary*)[responseDict objectForKey:@"data"]);
    
    NSInteger status_code = [[responseDict valueForKey:@"status_code"] integerValue];
    NSInteger notification_id =[[request.userInfo valueForKey:@"notificationId"]integerValue];
//    NSString *str=[request.userInfo valueForKey:@"cubeFeedId"];
    if (status_code==200)
    {
        ICCubeFeedCommentHolder *commentDHolder = [ICCubeFeedCommentHolder new];
        commentDHolder.strCubeFeedId = [CubeCommentDetail valueForKey:@"cubefeed_id"];
        commentDHolder.strCubeId = [CubeCommentDetail valueForKey:@"cube_id"];
        commentDHolder.strComment =[CubeCommentDetail valueForKey:@"comment"];
        commentDHolder.strCubeImageUrl = [CubeCommentDetail valueForKey:@"cube_image"] ;
        commentDHolder.strCubePosterImageUrl = [CubeCommentDetail valueForKey:@"poster_image"];
        commentDHolder.strCubeRecievedImageUrl = [CubeCommentDetail valueForKey:@"receiver_image"];
        commentDHolder.strCubePostrId =[CubeCommentDetail valueForKey:@"cube_postedby"];
        commentDHolder.strCubeRecievedId = [CubeCommentDetail valueForKey:@"cube_receivedby"] ;
        
        commentDHolder.strTotalComments = [[CubeCommentDetail valueForKey:@"total_comments"] integerValue];
        commentDHolder.likestatus =[[CubeCommentDetail valueForKey:@"like_status"] integerValue];
        commentDHolder.strTotalLike = [[CubeCommentDetail valueForKey:@"total_like"] integerValue];
        commentDHolder.strCubePosterName =[CubeCommentDetail valueForKey:@"cube_poster_name"];
        commentDHolder.strCubeRecievedName = [CubeCommentDetail valueForKey:@"cube_receiver_name"] ;
        commentDHolder.strCubeTitle = [CubeCommentDetail valueForKey:@"cube_title"] ;
        commentDHolder.strCubeValue = [CubeCommentDetail valueForKey:@"cube_value"] ;
        commentDHolder.arrCommentData = [CubeCommentDetail valueForKey:@"commentData"];
        
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_CUBE_COMMENT_LIST_SUCCESS object:commentDHolder];
                       });
    }
    else if(status_code==404)
    {
        [[ICDataBaseInteraction databaseInteractionManager] deleteNotification:notification_id];
        
         NSString *errMsg = @"Post Deleted.";

        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           NSMutableDictionary *info = [NSMutableDictionary dictionary];
                           [info setValue:[request.userInfo valueForKey:@"cubeFeedId"] forKey:@"cubeFeed_id"];
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_CUBE_FEED_DELETED object:info];
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_CUBE_COMMENT_LIST_FAILED object:errMsg];
                           
                       });
    }else{
        
        NSString *errMsg = [responseDict objectForKey:@"message"];
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_CUBE_COMMENT_LIST_FAILED object:errMsg];
                       });
    }
}

#pragma mark - CUBE_SINGLE_POST

-(void)requestForPostCube:(NSMutableDictionary *)info{
    
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:urlPostCube];
    
    NSString *posterId = [info valueForKey:@"poster_id"];
    NSString *receiverId = [info valueForKey:@"receiver_id"];
    NSString *cubeType = [info valueForKey:@"cube_type"];
    NSString *cubeId = [info valueForKey:@"cube_id"];
    NSString *cubeComments = [info valueForKey:@"cube_comments"];
    NSString *postedTime = [info valueForKey:@"posted_time"];
    
    
    [request setPostValue:posterId forKey:@"poster_id"];
    [request setPostValue:receiverId forKey:@"receiver_id"];
    [request setPostValue:cubeType forKey:@"cube_type"];
    [request setPostValue:cubeId forKey:@"cube_id"];
    [request setPostValue:cubeComments forKey:@"cube_comments"];
    [request setPostValue:postedTime forKey:@"posted_time"];
    
    [request setDelegate:self];
    [request setDidFailSelector:@selector(requestPostCubeFail:)];
    [request setDidFinishSelector:@selector(requestPostCubeSuccess:)];
    [request startAsynchronous];
    
}
-(void)requestPostCubeFail:(ASIFormDataRequest*)request{
    
    NSException *e;
    NSLog(@"%@",e);
    dispatch_async(dispatch_get_main_queue(), ^
                   {
                       [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_CUBE_POST_FAILED object:@"Something went wrong,try again !"];
                   });
    
}

-(void)requestPostCubeSuccess:(ASIFormDataRequest*)request{
    
    NSString *responseString = [request responseString];
    responseString = [[responseString componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]] componentsJoinedByString:@""];
    responseString = [responseString stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    SBJSON *parser=[[SBJSON alloc]init];
    
    NSDictionary *results = [parser objectWithString:responseString error:nil];
    NSMutableDictionary *responseDict = ((NSMutableDictionary *)[results objectForKey:@"response"]);
    NSInteger statusCode = [[responseDict valueForKey:@"status_code"] integerValue];
    if (statusCode==200)
    {        
        NSString *successMsg = [responseDict objectForKey:@"message"];
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_CUBE_POST_SUCCESS object:successMsg];
                       });
        
    }else{
        
        NSString *errMsg = [responseDict objectForKey:@"error_msg"];
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_CUBE_POST_FAILED object:errMsg];
                       });
    }
    
}
#pragma mark - CUBE_MULTIPLE_POST

-(void)requestForMultiplePostCube:(NSMutableDictionary *)info{
    
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:urlPostCube];
    
    NSString *posterId = [info valueForKey:@"poster_id"];
    NSString *receiverId = [info valueForKey:@"receiver_id"];
    NSString *cubeType = [info valueForKey:@"cube_type"];
    NSString *cubeId = [info valueForKey:@"cube_id"];
    NSString *cubeComments = [info valueForKey:@"cube_comments"];
    NSString *postedTime = [info valueForKey:@"posted_time"];
    
    
    [request setPostValue:posterId forKey:@"poster_id"];
    [request setPostValue:receiverId forKey:@"receiver_id"];
    [request setPostValue:cubeType forKey:@"cube_type"];
    [request setPostValue:cubeId forKey:@"cube_id"];
    [request setPostValue:cubeComments forKey:@"cube_comments"];
    [request setPostValue:postedTime forKey:@"posted_time"];
    
    [request setDelegate:self];
    [request setDidFailSelector:@selector(requestPostCubeFail:)];
    [request setDidFinishSelector:@selector(requestPostCubeSuccess:)];
    [request startAsynchronous];
    
}
-(void)requestMultiplePostCubeFail:(ASIFormDataRequest*)request{
    
    NSException *e;
    NSLog(@"%@",e);
    dispatch_async(dispatch_get_main_queue(), ^
                   {
                       [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_CUBE_MULTIPLE_POST_FAILED object:@"Something went wrong,try again !"];
                   });
    
}

-(void)requestMultiplePostCubeSuccess:(ASIFormDataRequest*)request{
    
    NSString *responseString = [request responseString];
    responseString = [[responseString componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]] componentsJoinedByString:@""];
    responseString = [responseString stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    SBJSON *parser=[[SBJSON alloc]init];
    
    NSDictionary *results = [parser objectWithString:responseString error:nil];
    NSMutableDictionary *responseDict = ((NSMutableDictionary *)[results objectForKey:@"response"]);
    NSInteger statusCode = [[responseDict valueForKey:@"status_code"] integerValue];
    if (statusCode==200)
    {
        NSString *successMsg = [responseDict objectForKey:@"message"];
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_CUBE_MULTIPLE_POST_SUCCESS object:successMsg];
                       });
        
    }else{
        
        NSString *errMsg = [responseDict objectForKey:@"error_msg"];
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_CUBE_MULTIPLE_POST_FAILED object:errMsg];
                       });
    }
    
}

#pragma mark - CUBE_SINGLE_TEAM_POST
#pragma mark - CUBE_MULTIPLE_TEAM_POST
#pragma mark - CUBE_MULTIPLE_USER_AND_MULTIPLE_TEAM_POST
#pragma mark - CUBE_SINGLE_USER_AND_MULTIPLE_TEAM_POST
#pragma mark - CUBE_MULTIPLE_USER_AND_SINGLE_TEAM_POST
#pragma mark - CUBE_SINGLE_USER_AND_SINGLE_TEAM_POST


#pragma mark - CUBE_FEED_POST_COMMENT

-(void)requestForCubeFeedPostComment:(NSMutableDictionary *)info{
    
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:urlCubeFeedPostComment];
    
    NSString *cubeFeedId = [info valueForKey:@"cubeFeed_id"];
    NSString *UserId = [info valueForKey:@"user_id"];
    NSString *cubeComments = [info valueForKey:@"cube_comments"];
    
    [request setPostValue:cubeFeedId forKey:@"cube_postedid"];
    [request setPostValue:UserId forKey:@"user_id"];
    [request setPostValue:cubeComments forKey:@"comment"];
    [request setUserInfo:[NSDictionary dictionaryWithObjectsAndKeys:[info valueForKey:@"cubeFeed_id"],@"cubeFeed_id", nil]];
    
    [request setDelegate:self];
    [request setDidFailSelector:@selector(requestCubeFeedPostCommentFail:)];
    [request setDidFinishSelector:@selector(requestCubeFeedPostCommentSuccess:)];
    [request startAsynchronous];
    
}
-(void)requestCubeFeedPostCommentFail:(ASIFormDataRequest*)request{
    dispatch_async(dispatch_get_main_queue(), ^
                   {
                       [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_CUBE_FEED_POST_COMMENT_FAILED object:@"Something went wrong,try again !"];
                   });
    
}

-(void)requestCubeFeedPostCommentSuccess:(ASIFormDataRequest*)request{
    
    NSString *cubeFeedId = [request.userInfo valueForKey:@"cubeFeed_id"];
    NSString *responseString = [request responseString];
    responseString = [[responseString componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]] componentsJoinedByString:@""];
    responseString = [responseString stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    SBJSON *parser=[[SBJSON alloc]init];
    
    NSDictionary *results = [parser objectWithString:responseString error:nil];
    NSMutableDictionary *responseDict = ((NSMutableDictionary *)[results objectForKey:@"response"]);
    NSInteger statusCode = [[responseDict valueForKey:@"status_code"] integerValue];
    
    if (statusCode==200)
    {
        NSString *total_Comments=[responseDict objectForKey:@"total_comments"];
        NSString *successMsg = [responseDict objectForKey:@"message"];
        NSMutableDictionary *info = [NSMutableDictionary dictionary];
        [info setValue:successMsg forKey:@"message"];
        [info setValue:total_Comments forKey:@"totalComment"];
        [info setValue:cubeFeedId forKey:@"cubeFeed_id"];
        
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_CUBE_FEED_POST_COMMENT_SUCCESS object:info];
                       });

    }
    else
    {
        
        NSString *errMsg = [responseDict objectForKey:@"error_msg"];
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_CUBE_FEED_POST_COMMENT_FAILED object:errMsg];
                       });
    }
   
}

#pragma mark - CUBE_FEED_POST_LIKE

-(void)requestForCubeFeedPostLike:(NSMutableDictionary *)info{
    
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:urlCubeFeedPostLike];
    
    NSString *cubeFeedId = [info valueForKey:@"cubeFeed_id"];
    NSString *UserId = [info valueForKey:@"user_id"];
    
    [request setPostValue:cubeFeedId forKey:@"cube_postedid"];
    [request setPostValue:UserId forKey:@"user_id"];
    [request setUserInfo:[NSDictionary dictionaryWithObjectsAndKeys:[info valueForKey:@"cubeFeed_id"],@"cubeFeed_id", nil]];
    
    [request setDelegate:self];
    [request setDidFailSelector:@selector(requestCubeFeedPostLikeFail:)];
    [request setDidFinishSelector:@selector(requestCubeFeedPostLikeSuccess:)];
    [request startAsynchronous];
    
}
-(void)requestCubeFeedPostLikeFail:(ASIFormDataRequest*)request{
    dispatch_async(dispatch_get_main_queue(), ^
                   {
                       [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_CUBE_FEED_POST_LIKE_FAILED object:@"Something went wrong,try again !"];
                   });
    
}

-(void)requestCubeFeedPostLikeSuccess:(ASIFormDataRequest*)request{
    
    NSString *cubeFeedId = [request.userInfo valueForKey:@"cubeFeed_id"];
    NSString *responseString = [request responseString];
    responseString = [[responseString componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]] componentsJoinedByString:@""];
    responseString = [responseString stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    SBJSON *parser=[[SBJSON alloc]init];
    
    NSDictionary *results = [parser objectWithString:responseString error:nil];
    NSMutableDictionary *responseDict = ((NSMutableDictionary *)[results objectForKey:@"response"]);
    NSInteger statusCode = [[responseDict valueForKey:@"status_code"] integerValue];
    if (statusCode==200) {
        
        NSString *likeTotal = [responseDict objectForKey:@"total_like"];
        NSString *likeStatus = [responseDict objectForKey:@"like_status"];
        NSString *successMsg = [responseDict objectForKey:@"message"];
        NSMutableDictionary *info = [NSMutableDictionary dictionary];
        [info setValue:successMsg forKey:@"message"];
        [info setValue:likeTotal forKey:@"likeTotal"];
        [info setValue:likeStatus forKey:@"likeStatus"];
        [info setValue:cubeFeedId forKey:@"cubeFeed_id"];
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_CUBE_FEED_POST_LIKE_SUCCESS object:info];
                       });
                
    }else if(statusCode==404){
        
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           NSMutableDictionary *info = [NSMutableDictionary dictionary];
                           [info setValue:cubeFeedId forKey:@"cubeFeed_id"];
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_CUBE_FEED_DELETED object:info];
                       });
    }else{
        
        NSString *errMsg = [responseDict objectForKey:@"error_msg"];
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_CUBE_FEED_POST_LIKE_FAILED object:errMsg];
                       });
    }
}

#pragma mark - CUBE_RECENT

-(void)requestForCubeRecent:(NSMutableDictionary *)info{
    
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:urlCubeRecent];
    
    NSString *userId = [info valueForKey:@"user_id"];
    
    [request setPostValue:userId forKey:@"user_id"];
    
    [request setDelegate:self];
    [request setDidFailSelector:@selector(requestCubeRecentFail:)];
    [request setDidFinishSelector:@selector(requestCubeRecentSuccess:)];
    [request startAsynchronous];
    
}
-(void)requestCubeRecentFail:(ASIFormDataRequest*)request{
    dispatch_async(dispatch_get_main_queue(), ^
                   {
                       [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_CUBE_RECENT_FAILED object:@"Something went wrong,try again !"];
                   });
    
}

-(void)requestCubeRecentSuccess:(ASIFormDataRequest*)request{
    
    NSString *responseString = [request responseString];
    responseString = [[responseString componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]] componentsJoinedByString:@""];
    responseString = [responseString stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    SBJSON *parser=[[SBJSON alloc]init];
    
    NSDictionary *results = [parser objectWithString:responseString error:nil];
    NSMutableDictionary *responseDict = ((NSMutableDictionary *)[results objectForKey:@"response"]);
    NSMutableDictionary *sentCubeDataDict=((NSMutableDictionary*)[responseDict objectForKey:@"sent_cubedata"]);
    NSMutableDictionary *receivedCubeDataDict=((NSMutableDictionary*)[responseDict objectForKey:@"received_cubedata"]);
    NSMutableArray *arrSentCubeData =(NSMutableArray *)[sentCubeDataDict objectForKey:@"data"];
    NSMutableArray *arrReceivedCubeData=(NSMutableArray *)[receivedCubeDataDict objectForKey:@"data"];
//    NSMutableArray *arrSentCubeImage=(NSMutableArray *)[arrSentCubeData valueForKey:@"cube_image"];
//    NSMutableArray *arrReceivedCubeImage=(NSMutableArray *)[arrReceivedCubeData valueForKey:@"cube_image"];
    
    NSInteger status_code = [[responseDict valueForKey:@"status_code"] integerValue];
    
    if (status_code==200) {
        
        NSMutableDictionary *dictRcvSendRecentCube=[[NSMutableDictionary alloc]init];
        NSMutableArray *arrReceivedCubeDetail=[[NSMutableArray alloc]init];
        NSMutableArray *arrSentCubeDetail=[[NSMutableArray alloc]init];
        
        
    for (int i=0;i<arrReceivedCubeData.count ; i++)
    {
        ICCubeRecentHolder *receiveCubeDHolder=[[ICCubeRecentHolder alloc]init];
        
        
        receiveCubeDHolder.strCubeReceiverName=[receivedCubeDataDict objectForKey:@"receiver_name"];
        receiveCubeDHolder.imgCubeReceiver=[receivedCubeDataDict objectForKey:@"receiver_image"];
        receiveCubeDHolder.strCubeReceived=[receivedCubeDataDict objectForKey:@"received_cubes"];
        
        receiveCubeDHolder.strCubeFeedId = [[arrReceivedCubeData objectAtIndex:i]valueForKey:@"cubefeed_id"];
        receiveCubeDHolder.strCubeReceivedImageUrl = [[arrReceivedCubeData objectAtIndex:i]valueForKey:@"cube_image"];
        receiveCubeDHolder.strCubeTitle=[[arrReceivedCubeData objectAtIndex:i]valueForKey:@"cube_title"];
        receiveCubeDHolder.strCubeComment=[[arrReceivedCubeData objectAtIndex:i]valueForKey:@"cube_comments"];
        receiveCubeDHolder.strCubeSenderName=[[arrReceivedCubeData objectAtIndex:i]valueForKey:@"sender_name"];
        receiveCubeDHolder.imgCubeSender=[[arrReceivedCubeData objectAtIndex:i]valueForKey:@"sender_image"];
        
        [arrReceivedCubeDetail addObject:receiveCubeDHolder];
                
    }

    for (int i=0; i<arrSentCubeData.count; i++)
    {
        ICCubeRecentHolder *sentCubeDHolder=[[ICCubeRecentHolder alloc]init];
        
        sentCubeDHolder.strCubeSent=[sentCubeDataDict objectForKey:@"sent_cubedata"];
        sentCubeDHolder.strCubeSenderName=[sentCubeDataDict objectForKey:@"sender_name"];
        sentCubeDHolder.imgCubeSender=[sentCubeDataDict objectForKey:@"sender_image"];
        
        sentCubeDHolder.strCubeFeedId = [[arrSentCubeData objectAtIndex:i]valueForKey:@"cubefeed_id"];
        sentCubeDHolder.strCubeSentImageUrl = [[arrSentCubeData objectAtIndex:i]valueForKey:@"cube_image"];
        sentCubeDHolder.strCubeTitle=[[arrSentCubeData objectAtIndex:i]valueForKey:@"cube_title"];
        sentCubeDHolder.strCubeComment = [[arrSentCubeData objectAtIndex:i]valueForKey:@"cube_comments"];
        sentCubeDHolder.strCubeReceiverName=[[arrSentCubeData objectAtIndex:i]valueForKey:@"receiver_name"];
        sentCubeDHolder.imgCubeReceiver=[[arrSentCubeData objectAtIndex:i]valueForKey:@"receiver_image"];

      
        [arrSentCubeDetail addObject:sentCubeDHolder];
        
    }
        
        [dictRcvSendRecentCube setValue:arrSentCubeDetail forKey:@"sentCube"];
        [dictRcvSendRecentCube setValue:arrReceivedCubeDetail forKey:@"receivedCube"];
        
        dispatch_async(dispatch_get_main_queue(), ^
               {
                   
                   [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_CUBE_RECENT_SUCCESS object:dictRcvSendRecentCube];
                   
               });
    }
    else
    {
        
        NSString *errMsg = [responseDict objectForKey:@"message"];
        dispatch_async(dispatch_get_main_queue(), ^
               {
                   [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_CUBE_RECENT_FAILED object:errMsg];
               });
    }
    
}

#pragma mark - CUBE_RECEIVED_MY_FEED_LIST

-(void)requestForCubeReceivedMyFeedList:(NSMutableDictionary*)info
{
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:urlCubeReceivedMyFeedList];
    
     NSString *userId = [info valueForKey:@"user_id"];
     NSString *pageId=[info valueForKey:@"page_id"];
    
    [request setPostValue:userId forKey:@"user_id"];
    [request setPostValue:pageId forKey:@"page_id"];
    
    [request setDelegate:self];
    [request setDidFailSelector:@selector(requestCubeReceivedMyFeedListFail:)];
    [request setDidFinishSelector:@selector(requestCubeReceivedMyFeedListSuccess:)];
    [request startAsynchronous];
}

-(void)requestCubeReceivedMyFeedListFail:(ASIFormDataRequest*)request{
    
    dispatch_async(dispatch_get_main_queue(), ^
                   {
                       [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_CUBE_RECEIVED_MY_FEED_LIST_FAILED object:@"unable to get cube feed cooments at this movement."];
                   });
}

-(void)requestCubeReceivedMyFeedListSuccess:(ASIFormDataRequest*)request
{    
    NSString *responseString = [request responseString];
    responseString = [[responseString componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]] componentsJoinedByString:@""];
    responseString = [responseString stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    SBJSON *parser=[[SBJSON alloc]init];

    NSDictionary *results = [parser objectWithString:responseString error:nil];
    NSMutableDictionary *responseDict = ((NSMutableDictionary *)[results objectForKey:@"response"]);
    NSMutableDictionary *receivedFeedDataDict=((NSMutableDictionary*)[responseDict objectForKey:@"received_cubedata"]);

    NSMutableArray *arrReceivedFeed=(NSMutableArray *)[receivedFeedDataDict valueForKey:@"data"];
    
   NSInteger status_code = [[responseDict valueForKey:@"status_code"] integerValue];
    
if (status_code==200)
{
    NSMutableArray *arrMyReceiveCubeFeedList=[[NSMutableArray alloc]init];
    
    for (int i=0;i<arrReceivedFeed.count ; i++)
    {
        ICCubeFeedCommentHolder *cubeCommentDHolder = [ICCubeFeedCommentHolder new];
        cubeCommentDHolder.strCubeFeedId = [[arrReceivedFeed objectAtIndex:i] valueForKey:@"cubefeed_id"];
        cubeCommentDHolder.strCubeType=[[arrReceivedFeed objectAtIndex:i] valueForKey:@"cube_type"];
        cubeCommentDHolder.strCubeId = [[arrReceivedFeed objectAtIndex:i] valueForKey:@"cube_id"];
        cubeCommentDHolder.strComment =[[arrReceivedFeed objectAtIndex:i] valueForKey:@"cube_comments"];
        cubeCommentDHolder.strCubeImageUrl = [[arrReceivedFeed objectAtIndex:i] valueForKey:@"cube_image"] ;
        cubeCommentDHolder.strCubePosterImageUrl = [[arrReceivedFeed objectAtIndex:i] valueForKey:@"sender_image"];
        cubeCommentDHolder.strCubeRecievedImageUrl = [receivedFeedDataDict objectForKey:@"receiver_image"];
        cubeCommentDHolder.strCubePostrId =[[arrReceivedFeed objectAtIndex:i] valueForKey:@"cube_postedby"];
        cubeCommentDHolder.strCubeRecievedId = [[arrReceivedFeed objectAtIndex:i] valueForKey:@"cube_receivedby"] ;
        
        cubeCommentDHolder.strTotalComments = [[[arrReceivedFeed objectAtIndex:i] valueForKey:@"total_comments"]integerValue];
        cubeCommentDHolder.likestatus =[[[arrReceivedFeed objectAtIndex:i] valueForKey:@"like_status"] integerValue];
        cubeCommentDHolder.strTotalLike =[[[arrReceivedFeed objectAtIndex:i] valueForKey:@"total_like"]integerValue];
        cubeCommentDHolder.strCubePosterName =[[arrReceivedFeed objectAtIndex:i] valueForKey:@"sender_name"];
        cubeCommentDHolder.strCubeRecievedName = [receivedFeedDataDict objectForKey:@"receiver_name"];
        
        cubeCommentDHolder.intSenderId=[[[arrReceivedFeed objectAtIndex:i] valueForKey:@"sender_id"]integerValue];
        cubeCommentDHolder.intReceiverId=[[receivedFeedDataDict objectForKey:@"receiver_id"]integerValue];
        cubeCommentDHolder.strCubePostedDate=[[arrReceivedFeed objectAtIndex:i]valueForKey:@"cube_posteddate"];
        
//        cubeCommentDHolder.strCubeTitle = [[arrReceivedFeed objectAtIndex:i] valueForKey:@"cube_title"] ;
//        cubeCommentDHolder.strCubeValue = [[arrReceivedFeed objectAtIndex:i] valueForKey:@"cube_value"] ;
        
        [arrMyReceiveCubeFeedList addObject:cubeCommentDHolder];
        
    }
    
        dispatch_async(dispatch_get_main_queue(), ^
               {
                   [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_CUBE_RECEIVED_MY_FEED_LIST_SUCCESS object:arrMyReceiveCubeFeedList];
               });
    }else{
        
        NSString *errMsg = [responseDict objectForKey:@"message"];
        dispatch_async(dispatch_get_main_queue(), ^
               {
                   [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_CUBE_RECEIVED_MY_FEED_LIST_FAILED object:errMsg];
               });
      }
    
}

#pragma mark - CUBE_SENT_MY_FEED_LIST

-(void)requestForCubeSentMyFeedList:(NSMutableDictionary*)info
{
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:urlCubeSentMyFeedList];
    
    NSString *userId = [info valueForKey:@"user_id"];
    NSString *pageId=[info valueForKey:@"page_id"];
    
    [request setPostValue:userId forKey:@"user_id"];
    [request setPostValue:pageId forKey:@"page_id"];
    
    [request setDelegate:self];
    [request setDidFailSelector:@selector(requestCubeSentMyFeedListFail:)];
    [request setDidFinishSelector:@selector(requestCubeSentMyFeedListSuccess:)];
    [request startAsynchronous];
}

-(void)requestCubeSentMyFeedListFail:(ASIFormDataRequest*)request{
    
    dispatch_async(dispatch_get_main_queue(), ^
                   {
                       [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_CUBE_SENT_MY_FEED_LIST_FAILED object:@"unable to get cube feed cooments at this movement."];
                   });
}

-(void)requestCubeSentMyFeedListSuccess:(ASIFormDataRequest*)request
{
    
    NSString *responseString = [request responseString];
    responseString = [[responseString componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]] componentsJoinedByString:@""];
    responseString = [responseString stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    SBJSON *parser=[[SBJSON alloc]init];
    
    NSDictionary *results = [parser objectWithString:responseString error:nil];
    NSMutableDictionary *responseDict = ((NSMutableDictionary *)[results objectForKey:@"response"]);
    NSMutableDictionary *sentFeedDataDict=((NSMutableDictionary*)[responseDict objectForKey:@"sent_cubedata"]);
    NSMutableArray *arrSentFeed=(NSMutableArray *)[sentFeedDataDict valueForKey:@"data"];
    
    
    NSInteger status_code = [[responseDict valueForKey:@"status_code"] integerValue];
    
    if (status_code==200)
    {
        NSMutableArray *arrMySentCubeFeedList=[[NSMutableArray alloc]init];
        
        for (int i=0;i<arrSentFeed.count ; i++)
        {
            ICCubeFeedCommentHolder *cubeCommentDHolder = [ICCubeFeedCommentHolder new];
            cubeCommentDHolder.strCubeFeedId = [[arrSentFeed objectAtIndex:i] valueForKey:@"cubefeed_id"];
            cubeCommentDHolder.strCubeType=[[arrSentFeed objectAtIndex:i] valueForKey:@"cube_type"];
            cubeCommentDHolder.strCubeId = [[arrSentFeed objectAtIndex:i] valueForKey:@"cube_id"];
            cubeCommentDHolder.strComment =[[arrSentFeed objectAtIndex:i] valueForKey:@"cube_comments"];
            cubeCommentDHolder.strCubeImageUrl = [[arrSentFeed objectAtIndex:i] valueForKey:@"cube_image"] ;
            cubeCommentDHolder.strCubePosterImageUrl = [sentFeedDataDict objectForKey:@"sender_image"];
            cubeCommentDHolder.strCubeRecievedImageUrl = [[arrSentFeed objectAtIndex:i] valueForKey:@"receiver_image"];
            cubeCommentDHolder.strCubePostrId =[[arrSentFeed objectAtIndex:i] valueForKey:@"cube_postedby"];
            cubeCommentDHolder.strCubeRecievedId = [[arrSentFeed objectAtIndex:i] valueForKey:@"cube_receivedby"] ;
            
            cubeCommentDHolder.strTotalComments = [[[arrSentFeed objectAtIndex:i] valueForKey:@"total_comments"]integerValue];
            cubeCommentDHolder.likestatus =[[[arrSentFeed objectAtIndex:i] valueForKey:@"like_status"] integerValue];
            cubeCommentDHolder.strTotalLike =[[[arrSentFeed objectAtIndex:i] valueForKey:@"total_like"]integerValue];
            cubeCommentDHolder.strCubePosterName =[sentFeedDataDict objectForKey:@"sender_name"];
            cubeCommentDHolder.strCubeRecievedName = [[arrSentFeed objectAtIndex:i] valueForKey:@"receiver_name"] ;
            //        cubeCommentDHolder.strCubeTitle = [[arrSentFeed objectAtIndex:i] valueForKey:@"cube_title"] ;
            //        cubeCommentDHolder.strCubeValue = [[arrSentFeed objectAtIndex:i] valueForKey:@"cube_value"] ;
            
            cubeCommentDHolder.intReceiverId=[[[arrSentFeed objectAtIndex:i] valueForKey:@"receiver_id"]integerValue];
            cubeCommentDHolder.intSenderId=[[sentFeedDataDict objectForKey:@"sender_id"]integerValue];
             cubeCommentDHolder.strCubePostedDate=[[arrSentFeed objectAtIndex:i]valueForKey:@"cube_posteddate"];
            [arrMySentCubeFeedList addObject:cubeCommentDHolder];
            
        }
        
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_CUBE_SENT_MY_FEED_LIST_SUCCESS object:arrMySentCubeFeedList];
                       });
    }else{
        
        NSString *errMsg = [responseDict objectForKey:@"message"];
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_CUBE_SENT_MY_FEED_LIST_FAILED object:errMsg];
                       });
    }
    
}


#pragma mark - TEAM_LIST

-(void)requestForTeamList:(NSMutableDictionary *)info
{
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:urlTeamList];
    
    [request setDelegate:self];
    [request setDidFailSelector:@selector(requestTeamListFail:)];
    [request setDidFinishSelector:@selector(requestTeamListSuccess:)];
    [request startAsynchronous];
}

-(void)requestTeamListFail:(ASIFormDataRequest*)request{
    
    dispatch_async(dispatch_get_main_queue(), ^
                   {
                       [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_TEAM_LIST_FAILED object:@"unable to get Team List at this movement."];
                   });
}

-(void)requestTeamListSuccess:(ASIFormDataRequest*)request{
    
    NSString *responseString = [request responseString];
    responseString = [[responseString componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]] componentsJoinedByString:@""];
    responseString = [responseString stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    SBJSON *parser=[[SBJSON alloc]init];
    
    NSDictionary *results = [parser objectWithString:responseString error:nil];
    NSMutableDictionary *responseDict = ((NSMutableDictionary *)[results objectForKey:@"response"]);
    NSMutableArray *arrTeam=((NSMutableArray*)[responseDict objectForKey:@"data"]);
    
    NSInteger status_code = [[responseDict valueForKey:@"status_code"] integerValue];
    
    if (status_code==200) {
        
        NSMutableArray *arrTeamList=[[NSMutableArray alloc]init];
        
        for (int i=0; i<arrTeam.count; i++) {
            
            ICTeamListDataHolder *teamListDHolder = [ICTeamListDataHolder new];
            teamListDHolder.intTeamId =   [[[arrTeam objectAtIndex:i]valueForKey:@"team_id"]integerValue];
            teamListDHolder.strTeamDescription = [[arrTeam objectAtIndex:i]valueForKey:@"team_description"];
            teamListDHolder.strTeamName =[[arrTeam objectAtIndex:i] valueForKey:@"team_name"];
            teamListDHolder.strTeamImageUrl = [[arrTeam objectAtIndex:i] valueForKey:@"team_image"];
            
            [arrTeamList addObject:teamListDHolder];
            
        }
        
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_TEAM_LIST_SUCCESS object:arrTeamList];
                       });
    }else{
        
        NSString *errMsg = [responseDict objectForKey:@"message"];
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_TEAM_LIST_FAILED object:errMsg];
                       });
    }
    
}

#pragma mark - TEAM_DETAIL

-(void)requestForTeamDetail:(NSMutableDictionary *)info
{
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:urlTeamDetail];
    
    NSString *strTeamId=[info valueForKey:@"team_id"];
    [request setPostValue:strTeamId forKey:@"team_id"];
    
    [request setDelegate:self];
    [request setDidFailSelector:@selector(requestTeamDetailFail:)];
    [request setDidFinishSelector:@selector(requestTeamDetailSuccess:)];
    [request startAsynchronous];
}

-(void)requestTeamDetailFail:(ASIFormDataRequest*)request{
    
    dispatch_async(dispatch_get_main_queue(), ^
                   {
                       [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_TEAM_DETAIL_FAILED object:@"unable to get Team Detail List at this movement."];
                   });
}

-(void)requestTeamDetailSuccess:(ASIFormDataRequest*)request{
    
    NSString *responseString = [request responseString];
    responseString = [[responseString componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]] componentsJoinedByString:@""];
    responseString = [responseString stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    SBJSON *parser=[[SBJSON alloc]init];
    
    NSDictionary *results = [parser objectWithString:responseString error:nil];
    NSMutableDictionary *responseDict = (NSMutableDictionary *)[results objectForKey:@"response"];
    NSMutableDictionary *teamDetailDict=(NSMutableDictionary*)[responseDict objectForKey:@"data"];
    NSMutableArray *arrTeamReceivedCubeData=(NSMutableArray*)[teamDetailDict objectForKey:@"receivedCubesData"];
    
    NSInteger status_code = [[responseDict valueForKey:@"status_code"] integerValue];
    
    NSMutableArray *arrTeamDetail=[[NSMutableArray alloc]init];
    
    if (status_code==200) {
        
        ICTeamListDataHolder *teamDetailDHolder = [ICTeamListDataHolder new];
        teamDetailDHolder.intTeamId =   [[teamDetailDict valueForKey:@"team_id"]integerValue];
        teamDetailDHolder.strTeamDescription = [teamDetailDict valueForKey:@"team_description"];
        teamDetailDHolder.strTeamName =[teamDetailDict valueForKey:@"team_name"];
        teamDetailDHolder.strTeamImageUrl = [teamDetailDict valueForKey:@"team_image"];
        teamDetailDHolder.intTeamReceivedCube=[[teamDetailDict valueForKey:@"received_cubes"]integerValue];
        teamDetailDHolder.arrTeamReceivedCube=arrTeamReceivedCubeData;
        
//        NSMutableArray *arrReceivedCubeImage=[[NSMutableArray alloc]init];
        
//        for (int i=0;i<arrTeamReceivedCubeData.count;i++)
//        {
//            teamDetailDHolder.strTeamReceivedCubeImage=[[arrTeamReceivedCubeData objectAtIndex:i] valueForKey:@"cube_image"];
//            [arrReceivedCubeImage addObject:teamDetailDHolder.strTeamReceivedCubeImage];
//            teamDetailDHolder.arrTeamReceivedCubeImage =arrReceivedCubeImage;
//            
//        }
        
        [arrTeamDetail addObject:teamDetailDHolder];
        
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_TEAM_DETAIL_SUCCESS object:arrTeamDetail];
                       });
    }else{
        
        NSString *errMsg = [responseDict objectForKey:@"message"];
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_TEAM_DETAIL_FAILED object:errMsg];
                       });
    }
    
}

#pragma mark - TEAM_POSTER_DETAIL

-(void)requestForTeamPosterDetail:(NSMutableDictionary *)info
{
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:urlTeamPosterDetail];
    
    NSString *strTeamId=[info valueForKey:@"team_id"];
    
    [request setPostValue:strTeamId forKey:@"team_id"];
    
    [request setDelegate:self];
    [request setDidFailSelector:@selector(requestTeamPosterDetailFail:)];
    [request setDidFinishSelector:@selector(requestTeamPosterDetailSuccess:)];
    [request startAsynchronous];
}

-(void)requestTeamPosterDetailFail:(ASIFormDataRequest*)request{
    
    dispatch_async(dispatch_get_main_queue(), ^
                   {
                       [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_TEAM_POSTER_DETAIL_FAILED object:@"unable to get Poster Detail List at this movement."];
                   });
}

-(void)requestTeamPosterDetailSuccess:(ASIFormDataRequest*)request{
    
    NSString *responseString = [request responseString];
    responseString = [[responseString componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]] componentsJoinedByString:@""];
    responseString = [responseString stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    SBJSON *parser=[[SBJSON alloc]init];
    
    NSDictionary *results = [parser objectWithString:responseString error:nil];
    NSMutableDictionary *responseDict = (NSMutableDictionary *)[results objectForKey:@"response"];
    NSMutableArray *arrTeamPosterDataTemp=(NSMutableArray*)[responseDict objectForKey:@"data"];
    NSInteger status_code = [[responseDict valueForKey:@"status_code"] integerValue];
    
    if (status_code==200)
    {
        NSMutableArray *arrTeamPosterDate=[[NSMutableArray alloc]init];
        for (int i=0; i<arrTeamPosterDataTemp.count; i++)
        {
            ICTeamPosterDataHolder *teamPosterDHolder=[[ICTeamPosterDataHolder alloc]init];
            
            teamPosterDHolder.strUserName=[[arrTeamPosterDataTemp objectAtIndex:i] valueForKey:@"user_name"];
            teamPosterDHolder.intUserId = [[[arrTeamPosterDataTemp objectAtIndex:i] valueForKey:@"user_id"] integerValue];
            teamPosterDHolder.strUserImage=[[arrTeamPosterDataTemp objectAtIndex:i] valueForKey:@"user_image"];
            
            teamPosterDHolder.countReceivedCube = [[[arrTeamPosterDataTemp objectAtIndex:i] valueForKey:@"received_cubes"] integerValue];
            teamPosterDHolder.countPostedCube=[[[arrTeamPosterDataTemp objectAtIndex:i] valueForKey:@"posted_cubes"] integerValue];
            
           teamPosterDHolder.arrPostedCube = [[arrTeamPosterDataTemp objectAtIndex:i]
                                              valueForKey:@"posted_data"];
           teamPosterDHolder.arrReceivedCube = [[arrTeamPosterDataTemp objectAtIndex:i]                                                                  valueForKey:@"received_data"];
            teamPosterDHolder.isCubeRcvSelected=YES;
            
            [arrTeamPosterDate addObject:teamPosterDHolder];
        }
        
        
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_TEAM_POSTER_DETAIL_SUCCESS object:arrTeamPosterDate];
                       });
    }else{
        
        NSString *errMsg = [responseDict objectForKey:@"message"];
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_TEAM_POSTER_DETAIL_FAILED object:errMsg];
                       });
    }
    
}

#pragma mark - CUBE_PIACHART_VALUE

-(void)requestForCubePiaChartValue:(NSMutableDictionary*)info
{
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:urlCubePiaChartValue];
    
    if (info==nil)
    {
    }
    else
    {
        NSString *strStartDate=[info valueForKey:@"start_date"];
        NSString *strEndDate=[info valueForKey:@"end_date"];
        
        [request setPostValue:strStartDate forKey:@"startdate"];
        [request setPostValue:strEndDate forKey:@"enddate"];

    }
    
    
    [request setDelegate:self];
    [request setDidFailSelector:@selector(requestCubePiaChartValueFail:)];
    [request setDidFinishSelector:@selector(requestCubePiaChartValueSuccess:)];
    [request startAsynchronous];
}

-(void)requestCubePiaChartValueFail:(ASIFormDataRequest*)request{
    
    dispatch_async(dispatch_get_main_queue(), ^
                   {
                       [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_CUBE_PIACHAT_VALUE_FAILED object:@"Unable to make piachart at this movement."];
                   });
}

-(void)requestCubePiaChartValueSuccess:(ASIFormDataRequest*)request{
    
    NSString *responseString = [request responseString];
    responseString = [[responseString componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]] componentsJoinedByString:@""];
    responseString = [responseString stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    SBJSON *parser=[[SBJSON alloc]init];
    
    NSDictionary *results = [parser objectWithString:responseString error:nil];
    NSMutableDictionary *responseDict = (NSMutableDictionary *)[results objectForKey:@"response"];
    NSMutableDictionary *teamDetailDict=(NSMutableDictionary*)[responseDict objectForKey:@"data"];
    NSMutableArray *arrChartDetails=(NSMutableArray*)[teamDetailDict objectForKey:@"cubeByValueData"];
    
    NSInteger status_code = [[responseDict valueForKey:@"status_code"] integerValue];
    if (status_code==200)
    {
        NSString *strTotalValues=(NSString *)[teamDetailDict objectForKey:@"total_cubes"];
        NSMutableDictionary *piaChartDict=[NSMutableDictionary new];
        NSMutableArray *arrPiaChartFillItems=[[NSMutableArray alloc]init];
        
        for (int i=0;i<arrChartDetails.count;i++)
        {
            ICCommonChartDataHolder *ChartValueHoder = [ICCommonChartDataHolder new];

            ChartValueHoder.strPiaChartTitle=[[arrChartDetails objectAtIndex:i] valueForKey:@"cube_title"];
            ChartValueHoder.piaChartValue=[[[arrChartDetails objectAtIndex:i] valueForKey:@"cube_count"]
                                           integerValue];
             ChartValueHoder.icHexColor=[[arrChartDetails objectAtIndex:i] valueForKey:@"cube_color"];

           
            [arrPiaChartFillItems addObject:ChartValueHoder];
        }
        [piaChartDict setObject:arrPiaChartFillItems forKey:@"chartValues"];
        [piaChartDict setObject:strTotalValues forKey:@"total_Cubes"];

        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_CUBE_PIACHAT_VALUE_SUCCESS object:piaChartDict];
                       });
    }else{
        
        NSString *errMsg = [responseDict objectForKey:@"message"];
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_CUBE_PIACHAT_VALUE_FAILED object:errMsg];
                       });
    }
    
}

#pragma mark - CUBE_PIACHART_TEAM

-(void)requestForCubePiaChartTeam:(NSMutableDictionary*)info
{
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:urlCubePiaChartTeam];
    
    if (info==nil)
    {
    }
    else
    {
        NSString *strStartDate=[info valueForKey:@"start_date"];
        NSString *strEndDate=[info valueForKey:@"end_date"];
        
        [request setPostValue:strStartDate forKey:@"startdate"];
        [request setPostValue:strEndDate forKey:@"enddate"];
        
    }
    
    [request setDelegate:self];
    [request setDidFailSelector:@selector(requestCubePiaChartTeamFail:)];
    [request setDidFinishSelector:@selector(requestCubePiaChartTeamSuccess:)];
    [request startAsynchronous];
}

-(void)requestCubePiaChartTeamFail:(ASIFormDataRequest*)request{
    
    dispatch_async(dispatch_get_main_queue(), ^
                   {
                       [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_CUBE_PIACHAT_TEAM_FAILED object:@"Unable to make piachart at this movement."];
                   });
}

-(void)requestCubePiaChartTeamSuccess:(ASIFormDataRequest*)request{
    
    NSString *responseString = [request responseString];
    responseString = [[responseString componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]] componentsJoinedByString:@""];
    responseString = [responseString stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    SBJSON *parser=[[SBJSON alloc]init];
    
    NSDictionary *results = [parser objectWithString:responseString error:nil];
    NSMutableDictionary *responseDict = (NSMutableDictionary *)[results objectForKey:@"response"];
    NSMutableDictionary *teamDetailDict=(NSMutableDictionary*)[responseDict objectForKey:@"data"];
    NSMutableArray *arrChartDetails=(NSMutableArray*)[teamDetailDict objectForKey:@"cubeByTeamData"];
    
    NSInteger status_code = [[responseDict valueForKey:@"status_code"] integerValue];
    if (status_code==200)
    {
        NSString *strTotalValues=(NSString *)[teamDetailDict objectForKey:@"total_cubes"];
        NSMutableDictionary *piaChartDict=[NSMutableDictionary new];
        NSMutableArray *arrPiaChartFillItems=[[NSMutableArray alloc]init];
        
        for (int i=0;i<arrChartDetails.count;i++)
        {
            ICCommonChartDataHolder *ChartValueHoder = [ICCommonChartDataHolder new];
            
            ChartValueHoder.strPiaChartTitle=[[arrChartDetails objectAtIndex:i] valueForKey:@"team_name"];
            ChartValueHoder.piaChartValue=[[[arrChartDetails objectAtIndex:i] valueForKey:@"cube_count"]
                                           integerValue];
             ChartValueHoder.icHexColor=[[arrChartDetails objectAtIndex:i] valueForKey:@"team_color"];
            
            
            [arrPiaChartFillItems addObject:ChartValueHoder];
        }
        [piaChartDict setObject:arrPiaChartFillItems forKey:@"chartValues"];
        [piaChartDict setObject:strTotalValues forKey:@"total_Cubes"];

        
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_CUBE_PIACHAT_TEAM_SUCCESS object:piaChartDict];
                       });
    }
    else
    {
        
        NSString *errMsg = [responseDict objectForKey:@"message"];
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_CUBE_PIACHAT_TEAM_FAILED object:errMsg];
                       });
    }
    
}

#pragma mark - CUBE_PIACHART_DIVISION

-(void)requestForCubePiaChartDivision:(NSMutableDictionary*)info
{
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:urlCubePiaChartDivision];
    
    NSString *strStartDate=[info valueForKey:@"start_date"];
    NSString *strEndDate=[info valueForKey:@"end_date"];
    
    [request setPostValue:strStartDate forKey:@"startdate"];
    [request setPostValue:strEndDate forKey:@"enddate"];
    
    [request setDelegate:self];
    [request setDidFailSelector:@selector(requestCubePiaChartDivisionFail:)];
    [request setDidFinishSelector:@selector(requestCubePiaChartDivisionSuccess:)];
    [request startAsynchronous];
}

-(void)requestCubePiaChartDivisionFail:(ASIFormDataRequest*)request{
    
    dispatch_async(dispatch_get_main_queue(), ^
                   {
                       [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_CUBE_PIACHAT_DIVISION_FAILED object:@"unable to get Team Detail List at this movement."];
                   });
}

-(void)requestCubePiaChartDivisionSuccess:(ASIFormDataRequest*)request{
    
    NSString *responseString = [request responseString];
    responseString = [[responseString componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]] componentsJoinedByString:@""];
    responseString = [responseString stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    SBJSON *parser=[[SBJSON alloc]init];
    
    NSDictionary *results = [parser objectWithString:responseString error:nil];
    NSMutableDictionary *responseDict = (NSMutableDictionary *)[results objectForKey:@"response"];
    NSMutableDictionary *teamDetailDict=(NSMutableDictionary*)[responseDict objectForKey:@"data"];
    NSMutableArray *arrChartDetails=(NSMutableArray*)[teamDetailDict objectForKey:@"cubeByDivisionData"];
    
    NSInteger status_code = [[responseDict valueForKey:@"status_code"] integerValue];
    if (status_code==200)
    {
        NSString *strTotalValues=(NSString *)[teamDetailDict objectForKey:@"total_cubes"];
        NSMutableDictionary *piaChartDict=[NSMutableDictionary new];
        NSMutableArray *arrPiaChartFillItems=[[NSMutableArray alloc]init];
        
        for (int i=0;i<arrChartDetails.count;i++)
        {
            ICCommonChartDataHolder *ChartValueHoder = [ICCommonChartDataHolder new];
            
            ChartValueHoder.strPiaChartTitle=[[arrChartDetails objectAtIndex:i] valueForKey:@"division_name"];
            ChartValueHoder.piaChartValue=[[[arrChartDetails objectAtIndex:i] valueForKey:@"cube_count"] integerValue];
            
             ChartValueHoder.icHexColor=[[arrChartDetails objectAtIndex:i] valueForKey:@"division_color"];
            [arrPiaChartFillItems addObject:ChartValueHoder];
        }
        [piaChartDict setObject:arrPiaChartFillItems forKey:@"chartValues"];
        [piaChartDict setObject:strTotalValues forKey:@"total_Cubes"];
       
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_CUBE_PIACHAT_DIVISION_SUCCESS object:piaChartDict];
                       });
    }
    else{
        
        NSString *errMsg = [responseDict objectForKey:@"message"];
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_CUBE_PIACHAT_DIVISION_FAILED object:errMsg];
                       });
    }
    
}

#pragma mark - CUBE_CHART_OVERTIME

-(void)requestForCubeChartOverTime:(NSMutableDictionary*)info
{
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:urlCubeChartOverTime];
    
    if (info==nil)
    {
    }
    else
    {
        NSString *strStartDate=[info valueForKey:@"start_date"];
        NSString *strEndDate=[info valueForKey:@"end_date"];
        
        [request setPostValue:strStartDate forKey:@"startdate"];
        [request setPostValue:strEndDate forKey:@"enddate"];
        
    }
    
    [request setDelegate:self];
    [request setDidFailSelector:@selector(requestCubeChartOverTimeFail:)];
    [request setDidFinishSelector:@selector(requestCubeChartOverTimeSuccess:)];
    [request startAsynchronous];
}

-(void)requestCubeChartOverTimeFail:(ASIFormDataRequest*)request{
    
    dispatch_async(dispatch_get_main_queue(), ^
                   {
                       [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_CUBE_CHART_OVERTIME_FAILED object:@"Unable to make overtime chart at this movement."];
                   });
}

-(void)requestCubeChartOverTimeSuccess:(ASIFormDataRequest*)request{
    
    NSString *responseString = [request responseString];
    responseString = [[responseString componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]] componentsJoinedByString:@""];
    responseString = [responseString stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    SBJSON *parser=[[SBJSON alloc]init];
    
    NSDictionary *results = [parser objectWithString:responseString error:nil];
    NSMutableDictionary *responseDict = (NSMutableDictionary *)[results objectForKey:@"response"];
    NSMutableDictionary *teamDetailDict=(NSMutableDictionary*)[responseDict objectForKey:@"data"];
    NSMutableArray *arrChartDetails=(NSMutableArray*)[teamDetailDict objectForKey:@"cubeOverTimeData"];
    
    NSInteger status_code = [[responseDict valueForKey:@"status_code"] integerValue];
    if (status_code==200)
    {
        NSString *strTotalValues=(NSString *)[teamDetailDict objectForKey:@"total_cubes"];
        NSMutableDictionary *piaChartDict=[NSMutableDictionary new];
        NSMutableArray *arrMonths=[[NSMutableArray alloc]init];
        NSMutableArray *arrCubeCount=[[NSMutableArray alloc]init];
        
        for (int i=0;i<arrChartDetails.count;i++)
        {
            NSString *strMonth=[[arrChartDetails objectAtIndex:i] valueForKey:@"time"];
            NSString *strCube_count=[[arrChartDetails objectAtIndex:i] valueForKey:@"cube_count"];
            
            
            [arrMonths addObject:strMonth];
            [arrCubeCount addObject:strCube_count];
        }
        [piaChartDict setObject:arrMonths forKey:@"months"];
        [piaChartDict setObject:arrCubeCount forKey:@"cubeCount"];
        [piaChartDict setObject:strTotalValues forKey:@"total_Cubes"];
        
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_CUBE_CHART_OVERTIME_SUCCESS object:piaChartDict];
                       });
    }else{
        
        NSString *errMsg = [responseDict objectForKey:@"message"];
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_CUBE_CHART_OVERTIME_FAILED object:errMsg];
                       });
    }
}

#pragma mark - CUBE_OF_THE_WEEK

-(void)requestForCubeOfTheWeek:(NSMutableDictionary *)info
{
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:urlCubeOfTheWeek];
    
    NSString *strStartDate=[info valueForKey:@"start_date"];
    NSString *strEndDate=[info valueForKey:@"end_date"];
    
    [request setPostValue:strStartDate forKey:@"startdate"];
    [request setPostValue:strEndDate forKey:@"enddate"];
    
    [request setDelegate:self];
    [request setDidFailSelector:@selector(requestCubeOfTheWeekFail:)];
    [request setDidFinishSelector:@selector(requestCubeOfTheWeekSuccess:)];
    [request startAsynchronous];
}

-(void)requestCubeOfTheWeekFail:(ASIFormDataRequest*)request{
    
    dispatch_async(dispatch_get_main_queue(), ^
                   {
                       [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_CUBE_OF_THE_WEEK_FAILED object:@"unable to get data at this movement."];
                   });
}

-(void)requestCubeOfTheWeekSuccess:(ASIFormDataRequest*)request{
    
    NSString *responseString = [request responseString];
    responseString = [[responseString componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]] componentsJoinedByString:@""];
    responseString = [responseString stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    SBJSON *parser=[[SBJSON alloc]init];
    
    NSDictionary *results = [parser objectWithString:responseString error:nil];
    NSMutableDictionary *responseDict = ((NSMutableDictionary *)[results objectForKey:@"response"]);
    NSMutableDictionary *cubeOfTheWeekDict=((NSMutableDictionary*)[responseDict objectForKey:@"data"]);
    
    NSInteger status_code = [[responseDict valueForKey:@"status_code"] integerValue];
    
    if (status_code==200) {
      
        ICCubeOfTheWeekDHolder *cubeOfTheWeekDHolder=[ICCubeOfTheWeekDHolder new];
        if (cubeOfTheWeekDict.count>0)
        {
            cubeOfTheWeekDHolder.strCubeFeedId    = [cubeOfTheWeekDict valueForKey:@"cubefeed_id"];
            cubeOfTheWeekDHolder.strUserName      = [cubeOfTheWeekDict valueForKey:@"user_name"];
            cubeOfTheWeekDHolder.strUserImageUrl  = [cubeOfTheWeekDict valueForKey:@"user_image"];
            cubeOfTheWeekDHolder.strCubeTitle     = [cubeOfTheWeekDict valueForKey:@"cube_title"] ;
            cubeOfTheWeekDHolder.strCubeImageUrl  = [cubeOfTheWeekDict valueForKey:@"cube_image"];
            cubeOfTheWeekDHolder.strTotalCube     = [cubeOfTheWeekDict valueForKey:@"total_cube"];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_CUBE_OF_THE_WEEK_SUCCESS object:cubeOfTheWeekDHolder];
                       });
    }else{
        
        NSString *errMsg = [responseDict objectForKey:@"message"];
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_CUBE_OF_THE_WEEK_FAILED object:errMsg];
                       });
    }
    
}
#pragma mark - MOST_RECEIVED_CUBES_BY_PERSON

-(void)requestForMostRcvCubesByPerson:(NSMutableDictionary *)info
{
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:urlMostRcvCubesByPerson];
    
    NSString *strStartDate=[info valueForKey:@"start_date"];
    NSString *strEndDate=[info valueForKey:@"end_date"];
    
    [request setPostValue:strStartDate forKey:@"startdate"];
    [request setPostValue:strEndDate forKey:@"enddate"];
    
    [request setDelegate:self];
    [request setDidFailSelector:@selector(requestMostRcvCubesByPersonFail:)];
    [request setDidFinishSelector:@selector(requestMostRcvCubesByPersonSuccess:)];
    [request startAsynchronous];
}

-(void)requestMostRcvCubesByPersonFail:(ASIFormDataRequest*)request{
    
    dispatch_async(dispatch_get_main_queue(), ^
                   {
                       [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_MOST_RCV_CUBE_BY_PERSON_FAILED object:@"unable to get received cubes at this movement."];
                   });
}

-(void)requestMostRcvCubesByPersonSuccess:(ASIFormDataRequest*)request{
    
    NSString *responseString = [request responseString];
    responseString = [[responseString componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]] componentsJoinedByString:@""];
    responseString = [responseString stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    SBJSON *parser=[[SBJSON alloc]init];
    
    NSDictionary *results = [parser objectWithString:responseString error:nil];
    NSMutableDictionary *responseDict = ((NSMutableDictionary *)[results objectForKey:@"response"]);
    NSMutableDictionary *mostRcvCubesDict=((NSMutableDictionary*)[responseDict objectForKey:@"data"]);
    NSMutableArray *arrMostRcvCubesByPerson=(NSMutableArray *)[mostRcvCubesDict objectForKey:@"receivedData"];
    
    NSInteger status_code = [[responseDict valueForKey:@"status_code"] integerValue];
    NSInteger strRank;
    if (status_code==200) {
        
        NSMutableArray *arrMostRcvCubesByPersonList=[[NSMutableArray alloc]init];
        
        for (int i=0;i<arrMostRcvCubesByPerson.count;i++)
        {
            ICMostCubesRcvSentDHolder *mostRcvCubesHolder=[ICMostCubesRcvSentDHolder new];
            mostRcvCubesHolder.intUserId = [[[arrMostRcvCubesByPerson objectAtIndex:i]  valueForKey:@"user_id"]integerValue];
            mostRcvCubesHolder.strUserName   = [[arrMostRcvCubesByPerson objectAtIndex:i]valueForKey:@"user_name"];
            mostRcvCubesHolder.strUserImageUrl  = [[arrMostRcvCubesByPerson objectAtIndex:i]  valueForKey:@"user_image"];
            mostRcvCubesHolder.strUserCubeCount =[[arrMostRcvCubesByPerson objectAtIndex:i]valueForKey:@"cube_count"];
           
            NSString *tempCubeCount = nil;
            ICMostCubesRcvSentDHolder *tempRcvCubesHolder =nil;
            
            if (i>0)
            {
                tempCubeCount = [[arrMostRcvCubesByPerson objectAtIndex:i-1]valueForKey:@"cube_count"];
                tempRcvCubesHolder = [arrMostRcvCubesByPerson objectAtIndex:i-1];
               
            }
            if (!tempCubeCount) {
                
                mostRcvCubesHolder.strUserRank = @"1";
                strRank=[[NSString stringWithFormat:@"%@",mostRcvCubesHolder.strUserRank]integerValue];
                
            }else{
                
                if ([mostRcvCubesHolder.strUserCubeCount isEqualToString:tempCubeCount]) {
                    
                    mostRcvCubesHolder.strUserRank=[NSString stringWithFormat:@"%ld",(long)strRank];;
                    
                }else{
                    
                    mostRcvCubesHolder.strUserRank = [NSString stringWithFormat:@"%d",strRank+1];
                    strRank=[[NSString stringWithFormat:@"%@",mostRcvCubesHolder.strUserRank]integerValue];
                }
            }
            
            [arrMostRcvCubesByPersonList addObject:mostRcvCubesHolder];
        }
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_MOST_RCV_CUBE_BY_PERSON_SUCCESS object:arrMostRcvCubesByPersonList];
                       });
    }else{
        
        NSString *errMsg = [responseDict objectForKey:@"message"];
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_MOST_RCV_CUBE_BY_PERSON_FAILED object:errMsg];
                       });
    }
    
}
#pragma mark - MOST_SENT_CUBES_BY_PERSON

-(void)requestForMostSentCubesByPerson:(NSMutableDictionary *)info
{
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:urlMostSentCubesByPerson];
    
    NSString *strStartDate=[info valueForKey:@"start_date"];
    NSString *strEndDate=[info valueForKey:@"end_date"];
    
    [request setPostValue:strStartDate forKey:@"startdate"];
    [request setPostValue:strEndDate forKey:@"enddate"];
    
    [request setDelegate:self];
    [request setDidFailSelector:@selector(requestMostSentCubesByPersonFail:)];
    [request setDidFinishSelector:@selector(requestMostSentCubesByPersonSuccess:)];
    [request startAsynchronous];
}

-(void)requestMostSentCubesByPersonFail:(ASIFormDataRequest*)request{
    
    dispatch_async(dispatch_get_main_queue(), ^
                   {
                       [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_MOST_SENT_CUBE_BY_PERSON_FAILED object:@"unable to get received cubes at this movement."];
                   });
}

-(void)requestMostSentCubesByPersonSuccess:(ASIFormDataRequest*)request{
    
    NSString *responseString = [request responseString];
    responseString = [[responseString componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]] componentsJoinedByString:@""];
    responseString = [responseString stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    SBJSON *parser=[[SBJSON alloc]init];
    
    NSDictionary *results = [parser objectWithString:responseString error:nil];
    NSMutableDictionary *responseDict = ((NSMutableDictionary *)[results objectForKey:@"response"]);
    NSMutableDictionary *mostSentCubesDict=((NSMutableDictionary*)[responseDict objectForKey:@"data"]);
    NSMutableArray *arrMostSentCubesByPerson=(NSMutableArray *)[mostSentCubesDict objectForKey:@"sentData"];
    
    NSInteger status_code = [[responseDict valueForKey:@"status_code"] integerValue];
    NSInteger strRank;
    if (status_code==200) {
        
        NSMutableArray *arrMostSentCubesByPersonList=[[NSMutableArray alloc]init];
        
        for (int i=0;i<arrMostSentCubesByPerson.count;i++) {
            
            ICMostCubesRcvSentDHolder *mostSentCubesHolder=[ICMostCubesRcvSentDHolder new];
            
            mostSentCubesHolder.intUserId = [[[arrMostSentCubesByPerson objectAtIndex:i]  valueForKey:@"user_id"]integerValue];
            mostSentCubesHolder.strUserName   = [[arrMostSentCubesByPerson objectAtIndex:i]valueForKey:@"user_name"];
            mostSentCubesHolder.strUserImageUrl = [[arrMostSentCubesByPerson objectAtIndex:i]valueForKey:@"user_image"];
            mostSentCubesHolder.strUserCubeCount=[[arrMostSentCubesByPerson objectAtIndex:i]valueForKey:@"cube_count"];
            
            NSString *tempCubeCount = nil;
            ICMostCubesRcvSentDHolder *tempRcvCubesHolder =nil;
            
            if (i>0)
            {
                tempCubeCount = [[arrMostSentCubesByPerson objectAtIndex:i-1]valueForKey:@"cube_count"];
                tempRcvCubesHolder = [arrMostSentCubesByPerson objectAtIndex:i-1];
                
            }
            if (!tempCubeCount) {
                
                mostSentCubesHolder.strUserRank = @"1";
                strRank=[[NSString stringWithFormat:@"%@",mostSentCubesHolder.strUserRank]integerValue];
                
            }else{
                
                if ([mostSentCubesHolder.strUserCubeCount isEqualToString:tempCubeCount]) {
                    
                    mostSentCubesHolder.strUserRank=[NSString stringWithFormat:@"%ld",(long)strRank];;
                    
                }else{
                    
                    mostSentCubesHolder.strUserRank = [NSString stringWithFormat:@"%ld",strRank+1];
                    strRank=[[NSString stringWithFormat:@"%@",mostSentCubesHolder.strUserRank]integerValue];
                }
            }

            [arrMostSentCubesByPersonList addObject:mostSentCubesHolder];
            
        }
        
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_MOST_SENT_CUBE_BY_PERSON_SUCCESS object:arrMostSentCubesByPersonList];
                       });
    }else{
        
        NSString *errMsg = [responseDict objectForKey:@"message"];
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_MOST_SENT_CUBE_BY_PERSON_FAILED object:errMsg];
                       });
    }
    
}
#pragma mark - MOST_RECEIVED_CUBES_BY_TEAM

-(void)requestForMostRcvCubesByTeam:(NSMutableDictionary *)info
{
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:urlMostRcvCubesByTeam];
    
    NSString *strStartDate=[info valueForKey:@"start_date"];
    NSString *strEndDate=[info valueForKey:@"end_date"];
    
    [request setPostValue:strStartDate forKey:@"startdate"];
    [request setPostValue:strEndDate forKey:@"enddate"];
    
    [request setDelegate:self];
    [request setDidFailSelector:@selector(requestMostRcvCubesByTeamFail:)];
    [request setDidFinishSelector:@selector(requestMostRcvCubesByTeamSuccess:)];
    [request startAsynchronous];
}

-(void)requestMostRcvCubesByTeamFail:(ASIFormDataRequest*)request{
    
    dispatch_async(dispatch_get_main_queue(), ^
                   {
                       [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_MOST_RCV_CUBE_BY_TEAM_FAILED object:@"unable to get received cubes at this movement."];
                   });
}

-(void)requestMostRcvCubesByTeamSuccess:(ASIFormDataRequest*)request{
    
    NSString *responseString = [request responseString];
    responseString = [[responseString componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]] componentsJoinedByString:@""];
    responseString = [responseString stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    SBJSON *parser=[[SBJSON alloc]init];
    
    NSDictionary *results = [parser objectWithString:responseString error:nil];
    NSMutableDictionary *responseDict = ((NSMutableDictionary *)[results objectForKey:@"response"]);
    NSMutableDictionary *mostRcvCubesDict=((NSMutableDictionary*)[responseDict objectForKey:@"data"]);
    NSMutableArray *arrMostRcvCubesByTeam=(NSMutableArray *)[mostRcvCubesDict objectForKey:@"receivedData"];
    
    NSInteger status_code = [[responseDict valueForKey:@"status_code"] integerValue];
     NSInteger strRank;
    if (status_code==200) {
        
        NSMutableArray *arrMostRcvCubesByTeamList=[[NSMutableArray alloc]init];
        
        for (int i=0;i<arrMostRcvCubesByTeam.count;i++)
        {
            ICMostCubesRcvSentDHolder *mostRcvCubesHolder=[ICMostCubesRcvSentDHolder new];
            
            mostRcvCubesHolder.intTeamId = [[[arrMostRcvCubesByTeam objectAtIndex:i]  valueForKey:@"team_id"]integerValue];
            mostRcvCubesHolder.strTeamName   = [[arrMostRcvCubesByTeam objectAtIndex:i]valueForKey:@"team_name"];
            mostRcvCubesHolder.strTeamImageUrl  = [[arrMostRcvCubesByTeam objectAtIndex:i]  valueForKey:@"team_image"];
            mostRcvCubesHolder.strTeamCubeCount =[[arrMostRcvCubesByTeam objectAtIndex:i]valueForKey:@"cube_count"];
            
            NSString *tempCubeCount = nil;
            ICMostCubesRcvSentDHolder *tempRcvCubesHolder =nil;
            
            if (i>0)
            {
                tempCubeCount = [[arrMostRcvCubesByTeam objectAtIndex:i-1]valueForKey:@"cube_count"];
                tempRcvCubesHolder = [arrMostRcvCubesByTeam objectAtIndex:i-1];
                
            }
            if (!tempCubeCount) {
                
                mostRcvCubesHolder.strUserRank = @"1";
                strRank=[[NSString stringWithFormat:@"%@",mostRcvCubesHolder.strUserRank]integerValue];
                
            }else{
                
                if ([mostRcvCubesHolder.strTeamCubeCount isEqualToString:tempCubeCount]) {
                    
                    mostRcvCubesHolder.strUserRank=[NSString stringWithFormat:@"%ld",(long)strRank];;
                    
                }else{                    
                    mostRcvCubesHolder.strUserRank = [NSString stringWithFormat:@"%ld",strRank+1];
                    strRank=[[NSString stringWithFormat:@"%@",mostRcvCubesHolder.strUserRank]integerValue];
                }
            }
            
            [arrMostRcvCubesByTeamList addObject:mostRcvCubesHolder];
            
        }
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_MOST_RCV_CUBE_BY_TEAM_SUCCESS object:arrMostRcvCubesByTeamList];
                       });
    }else{
        
        NSString *errMsg = [responseDict objectForKey:@"message"];
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_MOST_RCV_CUBE_BY_TEAM_FAILED object:errMsg];
                       });
    }
    
}
#pragma mark - NO_USER_ACTIVITY

-(void)requestForNoUserActivity:(NSMutableDictionary *)info
{
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:urlNoUserActivity];
    
    NSString *strStartDate=[info valueForKey:@"start_date"];
    NSString *strEndDate=[info valueForKey:@"end_date"];
    
    [request setPostValue:strStartDate forKey:@"startdate"];
    [request setPostValue:strEndDate forKey:@"enddate"];
    
    [request setDelegate:self];
    [request setDidFailSelector:@selector(requestNoUserActivityFail:)];
    [request setDidFinishSelector:@selector(requestNoUserActivitySuccess:)];
    [request startAsynchronous];
}

-(void)requestNoUserActivityFail:(ASIFormDataRequest*)request{
    
    dispatch_async(dispatch_get_main_queue(), ^
                   {
                       [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_NO_USER_ACTIVITY_FAILED object:@"unable to get data at this movement."];
                   });
}

-(void)requestNoUserActivitySuccess:(ASIFormDataRequest*)request{
    
    NSString *responseString = [request responseString];
    responseString = [[responseString componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]] componentsJoinedByString:@""];
    responseString = [responseString stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    SBJSON *parser=[[SBJSON alloc]init];
    
    NSDictionary *results = [parser objectWithString:responseString error:nil];
    NSMutableDictionary *responseDict = ((NSMutableDictionary *)[results objectForKey:@"response"]);
    NSMutableDictionary *noUserActivityDict=((NSMutableDictionary*)[responseDict objectForKey:@"data"]);
    NSMutableArray *arrNoCubeSent=(NSMutableArray *)[noUserActivityDict objectForKey:@"sentData"];
    NSMutableArray *arrNoCubeRcv=(NSMutableArray *)[noUserActivityDict objectForKey:@"receivedData"];
    
    NSInteger status_code = [[responseDict valueForKey:@"status_code"] integerValue];
    
    if (status_code==200) {
        
        NSMutableArray *arrNoCubeRcvList=[[NSMutableArray alloc]init];
        NSMutableArray *arrNoCubeSentList=[[NSMutableArray alloc]init];
        NSMutableDictionary *dictNoUserActivityList=[[NSMutableDictionary alloc]init];
        
        for (int i=0;i<arrNoCubeRcv.count;i++)
        {
            ICMostCubesRcvSentDHolder *noCubeRcvDHolder=[ICMostCubesRcvSentDHolder new];
            noCubeRcvDHolder.intUserId=[[[arrNoCubeRcv objectAtIndex:i]valueForKey:@"user_id"]integerValue];
            noCubeRcvDHolder.strUserName=[[arrNoCubeRcv objectAtIndex:i]valueForKey:@"user_name"];
            noCubeRcvDHolder.strUserImageUrl=[[arrNoCubeRcv objectAtIndex:i]valueForKey:@"user_image"];
            
            [arrNoCubeRcvList addObject:noCubeRcvDHolder];
            
        }
        for (int i=0;i<arrNoCubeSent.count;i++)
        {
            ICMostCubesRcvSentDHolder *noCubeSentDHolder=[ICMostCubesRcvSentDHolder new];
            noCubeSentDHolder.intUserId=[[[arrNoCubeSent objectAtIndex:i]valueForKey:@"user_id"]integerValue];
            noCubeSentDHolder.strUserName=[[arrNoCubeSent objectAtIndex:i]valueForKey:@"user_name"];
            noCubeSentDHolder.strUserImageUrl=[[arrNoCubeSent objectAtIndex:i]valueForKey:@"user_image"];
            
            [arrNoCubeSentList addObject:noCubeSentDHolder];
            
        }
        
        [dictNoUserActivityList setValue:arrNoCubeRcvList forKey:@"noCubeReceive"];
        [dictNoUserActivityList setValue:arrNoCubeSentList forKey:@"noCubeSent"];
        
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_NO_USER_ACTIVITY_SUCCESS object:dictNoUserActivityList];
                       });
    }else{
        
        NSString *errMsg = [responseDict objectForKey:@"message"];
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_NO_USER_ACTIVITY_FAILED object:errMsg];
                       });
    }
    
}

#pragma mark - CUBE_TRANSLATOR

-(void)requestForCubeTranslator:(NSMutableDictionary *)info
{
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:urlCubeTranslator];
    
    [request setDelegate:self];
    [request setDidFailSelector:@selector(requestCubeTranslatorFail:)];
    [request setDidFinishSelector:@selector(requestCubeTranslatorSuccess:)];
    [request startAsynchronous];
}

-(void)requestCubeTranslatorFail:(ASIFormDataRequest*)request{
    
    dispatch_async(dispatch_get_main_queue(), ^
                   {
                       [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_CUBE_TRANSLATOR_FAILED object:@"unable to get data at this movement."];
                   });
}

-(void)requestCubeTranslatorSuccess:(ASIFormDataRequest*)request
{    
    NSString *responseString = [request responseString];
    responseString = [[responseString componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]] componentsJoinedByString:@""];
    responseString = [responseString stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    SBJSON *parser=[[SBJSON alloc]init];
    
    NSDictionary *results = [parser objectWithString:responseString error:nil];
    NSMutableDictionary *responseDict = ((NSMutableDictionary *)[results objectForKey:@"response"]);
    NSMutableArray *arrCubeTitleData=((NSMutableArray*)[responseDict objectForKey:@"data"]);
    
    NSInteger status_code = [[responseDict valueForKey:@"status_code"] integerValue];
    
    NSMutableArray *arrCubeTranslatorData=[[NSMutableArray alloc]init];
    
    if (status_code==200)
    {
        
        for (int i=0; i<arrCubeTitleData.count; i++) {
            
            ICCubeTranslatorDHolder *cubeTranslatorDHolder=[ICCubeTranslatorDHolder new];
            
            cubeTranslatorDHolder.strCubeDescription=[[arrCubeTitleData objectAtIndex:i]valueForKey:@"cube_description"];
            cubeTranslatorDHolder.strCubeImage=[[arrCubeTitleData objectAtIndex:i]valueForKey:@"cube_image"];
            cubeTranslatorDHolder.strCubeTitle=[[arrCubeTitleData objectAtIndex:i]valueForKey:@"cube_title"];
            cubeTranslatorDHolder.arrJobExample= [[arrCubeTitleData objectAtIndex:i] valueForKey:@"job_title_description"];
            
            [arrCubeTranslatorData addObject:cubeTranslatorDHolder];
            
        }
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_CUBE_TRANSLATOR_SUCCESS object:arrCubeTranslatorData];
                       });
    }else{
        
        NSString *errMsg = [responseDict objectForKey:@"message"];
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_CUBE_TRANSLATOR_FAILED object:errMsg];
                       });
    }
    
}

#pragma mark - CHANGE_PASSWORD

-(void)requestForChangePassword:(NSMutableDictionary*)info{
    
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:urlChangePassword];
    
    NSString *userId = [info valueForKey:@"userid"];
    NSString *oldPassword=[info valueForKey:@"oldPassword"];
    NSString *newPassword = [info valueForKey:@"newPassword"];
    
    [request setPostValue:userId forKey:@"user_id"];
    
    [request setPostValue:oldPassword forKey:@"old_password"];
     [request setPostValue:newPassword forKey:@"password"];
    
    [request setDelegate:self];
    [request setDidFailSelector:@selector(requestChangePasswordFail:)];
    [request setDidFinishSelector:@selector(requestChangePasswordSuccess:)];
    [request startAsynchronous];
    
}
-(void)requestChangePasswordFail:(ASIFormDataRequest*)request{
    dispatch_async(dispatch_get_main_queue(), ^
                   {
                       [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_CHANGE_PWD_FAILED object:@"Something went wrong,try again !"];
                   });
    
}

-(void)requestChangePasswordSuccess:(ASIFormDataRequest*)request{
    
    NSString *responseString = [request responseString];
    responseString = [[responseString componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]] componentsJoinedByString:@""];
    responseString = [responseString stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    SBJSON *parser=[[SBJSON alloc]init];
    
    NSDictionary *results = [parser objectWithString:responseString error:nil];
    NSMutableDictionary *responseDict = ((NSMutableDictionary *)[results objectForKey:@"response"]);
    NSInteger statusCode = [[responseDict valueForKey:@"status_code"] integerValue];
    if (statusCode==200)
    {
        NSString *successMsg = [responseDict objectForKey:@"message"];
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_CHANGE_PWD_SUCCESS object:successMsg];
                       });
    }
    else
    {
        
        NSString *errMsg = [responseDict objectForKey:@"error_msg"];
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_CHANGE_PWD_FAILED object:errMsg];
                       });
    }
    
    
}

#pragma mark - EDIT_LINK

-(void)requestForEditLink:(NSMutableDictionary*)info
{
    
    NSString *strFac;
    NSString *strTwi;
    NSString *strLin;
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:urlEditLink];
    
    NSString *userId = [info valueForKey:@"userid"];
    NSString *strFacebook = [info valueForKey:@"facebook"];
    NSString *strTwitter = [info valueForKey:@"twitter"];
    NSString *strLinkedin = [info valueForKey:@"linkedin"];
    if (![strFacebook isEqualToString:@""])
    {
        strFac=@"Y";
    }
    else
    {
        strFac=@"N";
    }
    if (![strTwitter isEqualToString:@""])
    {
        strTwi=@"Y";
    }
    else
    {
        strTwi=@"N";
    }
    if (![strLinkedin isEqualToString:@""])
    {
        strLin=@"Y";
    }
    else
    {
        strLin=@"N";
    }
    
    
    [request setPostValue:userId forKey:@"user_id"];
    [request setPostValue:strFacebook forKey:@"facebook"];
    [request setPostValue:strTwitter forKey:@"twitter"];
    [request setPostValue:strLinkedin forKey:@"linkedin"];
    [request setUserInfo:[NSDictionary dictionaryWithObjectsAndKeys:strFac,@"facebook",strTwi,@"twitter",strLin,@"linkedin",nil]];
    
    [request setDelegate:self];
    [request setDidFailSelector:@selector(requestEditLinkFail:)];
    [request setDidFinishSelector:@selector(requestEditLinkSuccess:)];
    [request startAsynchronous];
    
}
-(void)requestEditLinkFail:(ASIFormDataRequest*)request{
    dispatch_async(dispatch_get_main_queue(), ^
                   {
                       [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_EDIT_LINK_FAILED object:@"Something went wrong,try again !"];
                   });
    
}

-(void)requestEditLinkSuccess:(ASIFormDataRequest*)request{
    
    NSDictionary *dict=[request userInfo];
    NSString *responseString = [request responseString];
    responseString = [[responseString componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]] componentsJoinedByString:@""];
    responseString = [responseString stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    SBJSON *parser=[[SBJSON alloc]init];
    
    NSDictionary *results = [parser objectWithString:responseString error:nil];
    NSMutableDictionary *responseDict = ((NSMutableDictionary *)[results objectForKey:@"response"]);
    NSInteger statusCode = [[responseDict valueForKey:@"status_code"] integerValue];
    if (statusCode==200)
    {
        //  NSString *successMsg = [responseDict objectForKey:@"message"];
        
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName: NOTIFICATION_PROFILE_EDIT_LINK_SUCCESS object:dict];
                          
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_EDIT_LINK_SUCCESS object:dict];
                       });
    }
    else
    {
        
        NSString *errMsg = [responseDict objectForKey:@"error_msg"];
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_EDIT_LINK_FAILED object:errMsg];
                       });
    }
    
    
}
#pragma mark - DELETE_CUBE_FEED

-(void)requestForDeleteCubeFeed:(NSMutableDictionary*)info
{
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:urlDeleteCubeFeed];
    
    NSString *cubeFeedid = [info valueForKey:@"cubeFeed_id"];
    
    [request setPostValue:cubeFeedid forKey:@"cubefeed_id"];
    [request setPostValue:[NSString stringWithFormat:@"%ld",(long)loginDHolder.icUserId] forKey:@"user_id"];
    [request setUserInfo:[NSDictionary dictionaryWithObjectsAndKeys:[info valueForKey:@"cubeFeed_id"],@"cubeFeed_id", nil]];
    
    [request setDelegate:self];
    [request setDidFailSelector:@selector(requestDeleteCubeFeedFail:)];
    [request setDidFinishSelector:@selector(requestDeleteCubeFeedSuccess:)];
    [request startAsynchronous];
    
}
-(void)requestDeleteCubeFeedFail:(ASIFormDataRequest*)request{
    dispatch_async(dispatch_get_main_queue(), ^
                   {
                       [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_DELETE_CUBE_FEED_FAILED object:@"Something went wrong,try again !"];
                   });
    
}

-(void)requestDeleteCubeFeedSuccess:(ASIFormDataRequest*)request
{
    NSString *cubeFeedId = [request.userInfo valueForKey:@"cubeFeed_id"];
    NSString *responseString = [request responseString];
    responseString = [[responseString componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]] componentsJoinedByString:@""];
    responseString = [responseString stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    SBJSON *parser=[[SBJSON alloc]init];
    
    NSDictionary *results = [parser objectWithString:responseString error:nil];
    NSMutableDictionary *responseDict = ((NSMutableDictionary *)[results objectForKey:@"response"]);
    NSInteger statusCode = [[responseDict valueForKey:@"status_code"] integerValue];
    if (statusCode==200)
    {
        // NSString *successMsg = [responseDict objectForKey:@"message"];
        NSMutableDictionary *info = [NSMutableDictionary dictionary];
        
        [info setValue:cubeFeedId forKey:@"cubeFeed_id"];
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_DELETE_CUBE_FEED_SUCCESS object:info];
                       });
    }
    else
    {
        
        NSString *errMsg = [responseDict objectForKey:@"error_msg"];
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_DELETE_CUBE_FEED_FAILED object:errMsg];
                       });
    }
}
#pragma mark - DELETE_COMMENT

-(void)requestForDeleteComment:(NSMutableDictionary *)info
{
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:urlDeleteComment];
    
    NSString *strCommentId = [info valueForKey:@"commentid"];
    NSString *strCubefeedId = [info valueForKey:@"cubeFeed_id"];
    
    [request setPostValue:strCommentId forKey:@"comment_id"];
    [request setPostValue:strCubefeedId forKey:@"cubefeed_id"];
    [request setPostValue:[NSString stringWithFormat:@"%ld",(long)loginDHolder.icUserId] forKey:@"user_id"];
    [request setUserInfo:[NSDictionary dictionaryWithObjectsAndKeys:[info valueForKey:@"cubeFeed_id"],@"cubeFeed_id",[info valueForKey:@"commentid"],@"commentid",nil]];
    
    [request setDelegate:self];
    [request setDidFailSelector:@selector(requestDeleteCommentFail:)];
    [request setDidFinishSelector:@selector(requestDeleteCommentSuccess:)];
    [request startAsynchronous];
    
}
-(void)requestDeleteCommentFail:(ASIFormDataRequest*)request{
    dispatch_async(dispatch_get_main_queue(), ^
                   {
                       [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_DELETE_COMMENT_FAILED object:@"Something went wrong,try again !"];
                   });
    
}

-(void)requestDeleteCommentSuccess:(ASIFormDataRequest*)request
{
    NSString *cubeFeedId = [request.userInfo valueForKey:@"cubeFeed_id"];
    NSString *commentId = [request.userInfo valueForKey:@"commentid"];
    NSString *responseString = [request responseString];
    responseString = [[responseString componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]] componentsJoinedByString:@""];
    responseString = [responseString stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    SBJSON *parser=[[SBJSON alloc]init];
    
    NSDictionary *results = [parser objectWithString:responseString error:nil];
    NSMutableDictionary *responseDict = ((NSMutableDictionary *)[results objectForKey:@"response"]);
    NSMutableDictionary *datadict=(NSMutableDictionary *)[responseDict objectForKey:@"data"];
    NSInteger statusCode = [[responseDict valueForKey:@"status_code"] integerValue];
    if (statusCode==200)
    {
        // NSString *successMsg = [responseDict objectForKey:@"message"];
        NSMutableDictionary *info = [NSMutableDictionary dictionary];
        
        [info setValue:commentId forKey:@"commentId"];
        [info setValue:cubeFeedId forKey:@"cubeFeed_id"];
        [info setValue:[datadict objectForKey:@"total_comments"] forKey:@"totalComment"];
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_DELETE_COMMENT_SUCCESS object:info];
                       });
    }
    else
    {
        
        NSString *errMsg = [responseDict objectForKey:@"error_msg"];
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_DELETE_COMMENT_FAILED object:errMsg];
                       });
    }
    
    
}


#pragma mark - SEARCH_OR_VIEW_PROFILE

-(void)requestForSearchOrViewProfile:(NSMutableDictionary*)info
{
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:urlSearchOrViewProfile];
    
    NSString *cubeType = [info valueForKey:@"searchType"];
    NSString *searchId = [info valueForKey:@"searchId"];
    
    [request setPostValue:cubeType forKey:@"cube_type"];
    [request setPostValue:searchId forKey:@"search_id"];
    
    [request setUserInfo:[NSDictionary dictionaryWithObjectsAndKeys:searchId,@"search_id",
                          nil]];
    
    [request setDelegate:self];
    [request setDidFailSelector:@selector(requestSearchOrViewProfileFail:)];
    [request setDidFinishSelector:@selector(requestSearchOrViewProfileSuccess:)];
    [request startAsynchronous];
    
}
-(void)requestSearchOrViewProfileFail:(ASIFormDataRequest*)request{
    dispatch_async(dispatch_get_main_queue(), ^
                   {
                       [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_SEARCH_OR_VIEW_PROFILE_FAILED object:@"Something went wrong,try again !"];
                   });
    
}

-(void)requestSearchOrViewProfileSuccess:(ASIFormDataRequest*)request
{
    NSString *responseString = [request responseString];
    responseString = [[responseString componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]] componentsJoinedByString:@""];
    responseString = [responseString stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    SBJSON *parser=[[SBJSON alloc]init];
    
    NSDictionary *results = [parser objectWithString:responseString error:nil];
    NSMutableDictionary *responseDict = ((NSMutableDictionary *)[results objectForKey:@"response"]);
    
    NSMutableDictionary *profileDataDict=((NSMutableDictionary *)[responseDict objectForKey:@"data"]);
    
    NSMutableDictionary *sentCubeDataDict=((NSMutableDictionary*)[responseDict objectForKey:@"sent_cubedata"]);
    NSMutableDictionary *receivedCubeDataDict=((NSMutableDictionary*)[responseDict objectForKey:@"received_cubedata"]);
    NSMutableArray *arrSentCubeData =(NSMutableArray *)[sentCubeDataDict objectForKey:@"data"];
    NSMutableArray *arrReceivedCubeData=(NSMutableArray *)[receivedCubeDataDict objectForKey:@"data"];
    NSInteger statusCode = [[responseDict valueForKey:@"status_code"] integerValue];
    
    
    if (statusCode==200)
    {
        NSMutableDictionary *dictProfileData=[[NSMutableDictionary alloc]init];
        NSMutableArray *arrReceivedCubeDetail=[[NSMutableArray alloc]init];
        NSMutableArray *arrSentCubeDetail=[[NSMutableArray alloc]init];
        NSMutableArray *arrProfileDetail=[[NSMutableArray alloc]init];
        
        ICLoginDataHolder *profileDetailDHolder = [ICLoginDataHolder new];
        ICTeamListDataHolder *teamDetailDholder=[ICTeamListDataHolder new];
        
            profileDetailDHolder.strUserName = [profileDataDict valueForKey:@"name"];
            profileDetailDHolder.strUserImageUrl =[profileDataDict valueForKey:@"image"];
            profileDetailDHolder.strDivision = [profileDataDict valueForKey:@"division"];
            profileDetailDHolder.strEmail =    [profileDataDict valueForKey:@"email"];
            profileDetailDHolder.strPhone =    [profileDataDict valueForKey:@"phone"];
            profileDetailDHolder.strJobTitle = [profileDataDict valueForKey:@"jobtitle"];
            profileDetailDHolder.strState =    [profileDataDict valueForKey:@"state"];
            profileDetailDHolder.strCity =     [profileDataDict valueForKey:@"city"];
            profileDetailDHolder.arrTeamId =   [profileDataDict valueForKey:@"teamData"];
            profileDetailDHolder.icUserId =    [[profileDataDict valueForKey:@"user_id"]integerValue];
            profileDetailDHolder.strUserType = [profileDataDict valueForKey:@"cube_type"];
        
            teamDetailDholder.strTeamName=[profileDataDict valueForKey:@"team_name"];
            teamDetailDholder.strTeamImageUrl=[profileDataDict valueForKey:@"team_image"];
            teamDetailDholder.strTeamDescription=[profileDataDict valueForKey:@"team_description"];
            teamDetailDholder.intTeamId = [[request.userInfo valueForKey:@"search_id"]integerValue];

            [arrProfileDetail addObject:profileDetailDHolder];
        
        for (int i=0;i<arrReceivedCubeData.count ; i++)
        {
            ICCubeRecentHolder *receiveCubeDHolder=[[ICCubeRecentHolder alloc]init];
            
            receiveCubeDHolder.strCubeReceiverName=[receivedCubeDataDict objectForKey:@"receiver_name"];
            receiveCubeDHolder.imgCubeReceiver=[receivedCubeDataDict objectForKey:@"receiver_image"];
            receiveCubeDHolder.strCubeReceived=[receivedCubeDataDict objectForKey:@"received_cubes"];
            
            receiveCubeDHolder.strCubeReceivedImageUrl = [[arrReceivedCubeData objectAtIndex:i]valueForKey:@"cube_image"];
            receiveCubeDHolder.strCubeTitle=[[arrReceivedCubeData objectAtIndex:i]valueForKey:@"cube_title"];
            receiveCubeDHolder.strCubeComment=[[arrReceivedCubeData objectAtIndex:i]valueForKey:@"cube_comments"];
            receiveCubeDHolder.strCubeSenderName=[[arrReceivedCubeData objectAtIndex:i]valueForKey:@"sender_name"];
            receiveCubeDHolder.imgCubeSender=[[arrReceivedCubeData objectAtIndex:i]valueForKey:@"sender_image"];
            
            [arrReceivedCubeDetail addObject:receiveCubeDHolder];
            
        }
        
        for (int i=0; i<arrSentCubeData.count; i++)
        {
            ICCubeRecentHolder *sentCubeDHolder=[[ICCubeRecentHolder alloc]init];
            
            sentCubeDHolder.strCubeSent=[sentCubeDataDict objectForKey:@"sent_cubes"];
            sentCubeDHolder.strCubeSenderName=[sentCubeDataDict objectForKey:@"sender_name"];
            sentCubeDHolder.imgCubeSender=[sentCubeDataDict objectForKey:@"sender_image"];
            
            sentCubeDHolder.strCubeSentImageUrl = [[arrSentCubeData objectAtIndex:i]valueForKey:@"cube_image"];
            sentCubeDHolder.strCubeTitle=[[arrSentCubeData objectAtIndex:i]valueForKey:@"cube_title"];
            sentCubeDHolder.strCubeComment = [[arrSentCubeData objectAtIndex:i]valueForKey:@"cube_comments"];
            sentCubeDHolder.strCubeReceiverName=[[arrSentCubeData objectAtIndex:i]valueForKey:@"receiver_name"];
            sentCubeDHolder.imgCubeReceiver=[[arrSentCubeData objectAtIndex:i]valueForKey:@"receiver_image"];
            
            
            [arrSentCubeDetail addObject:sentCubeDHolder];
            
        }

        [dictProfileData setValue:arrSentCubeDetail forKey:@"sentCubeData"];
        [dictProfileData setValue:arrReceivedCubeDetail forKey:@"receivedCubeData"];
        [dictProfileData setValue:profileDetailDHolder forKey:@"profileData"];
        [dictProfileData setValue:teamDetailDholder forKey:@"teamData"];
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_SEARCH_OR_VIEW_PROFILE_SUCCESS object:dictProfileData];
                       });
    }
    else
    {
        
        NSString *errMsg = [responseDict objectForKey:@"error_msg"];
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_SEARCH_OR_VIEW_PROFILE_FAILED object:errMsg];
                       });
    }
}

#pragma mark - NOTIFICATION SERVER
-(void)requestForNotificationFromServer
{
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:urlNotificationServerList];
    NSString *strName=[[NSUserDefaults standardUserDefaults] valueForKey:KEY_NOTIFICATION_TIME];
    [request setPostValue:[NSString stringWithFormat:@"%ld",(long)loginDHolder.icUserId] forKey:@"user_id"];
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"Is_First_Notification"])
    {
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:KEY_NOTIFICATION_FIRST];
        [[NSUserDefaults standardUserDefaults] synchronize];
         [request setPostValue:@"1" forKey:@"is_first"];
    }
    else
    {
        [request setPostValue:@"0" forKey:@"is_first"];
    }
    if (strName.length>0)
    {
        [request setPostValue:[[NSUserDefaults standardUserDefaults] valueForKey:KEY_NOTIFICATION_TIME] forKey:@"active_time"];
    }
    [request setDelegate:self];
    [request setDidFailSelector:@selector(requestNotificationFail:)];
    [request setDidFinishSelector:@selector(requestNotificationSuccess:)];
    [request startAsynchronous];
    
}
-(void)requestNotificationFail:(ASIFormDataRequest*)request{
    dispatch_async(dispatch_get_main_queue(), ^
   {
       [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_NTCS_API_FAILED object:@"Something went wrong,try again !"];
   });
}

-(void)requestNotificationSuccess:(ASIFormDataRequest*)request
{
//   [[ICDataBaseInteraction databaseInteractionManager] deletePreviousComments];
    NSString *responseString = [request responseString];
    responseString = [[responseString componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]] componentsJoinedByString:@""];
    responseString = [responseString stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    SBJSON *parser=[[SBJSON alloc]init];
    
    NSDictionary *results = [parser objectWithString:responseString error:nil];
    NSMutableDictionary *responseDict = ((NSMutableDictionary *)[results objectForKey:@"response"]);
    NSMutableArray *arrServerNotification=(NSMutableArray *)[responseDict objectForKey:@"data"];
    NSInteger statusCode = [[responseDict valueForKey:@"status_code"] integerValue];
    if (statusCode==200)
    {
        NSString *strCurrentDate=[responseDict valueForKey:@"now_time"];
        [[NSUserDefaults standardUserDefaults] setValue:strCurrentDate forKey:KEY_NOTIFICATION_TIME];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        NSMutableArray *arrNotification = [NSMutableArray new];
        for (int i=0; i<arrServerNotification.count; i++)
        {
            ICNotificationHolder *holder=[ICNotificationHolder new];
            holder.strMessage=[[arrServerNotification objectAtIndex:i] valueForKey:@"message"];
            holder.strMessageId=[[arrServerNotification objectAtIndex:i] valueForKey:@"messageid"];
            holder.strMessageType=[[arrServerNotification objectAtIndex:i] valueForKey:@"messagetype"];
            holder.strNotificationId=[[arrServerNotification objectAtIndex:i] valueForKey:@"notification_id"];
            [arrNotification addObject:holder];

        }
    
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_NTCS_API_SUCCESS object:arrNotification];
                       });
    }
    else
    {
        
        NSString *errMsg = [responseDict objectForKey:@"error_msg"];
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_NTCS_API_FAILED object:errMsg];
                       });
    }
    
    
}
#pragma mark - Notification Setting

-(void)NotificationRequest
{
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:urlNotificationSetting];
    
    [request setPostValue:[NSString stringWithFormat:@"%ld",(long)loginDHolder.icUserId] forKey:@"user_id"];
    [request setDelegate:self];
    [request setDidFailSelector:@selector(NotificationRequestFail:)];
    [request setDidFinishSelector:@selector(NotificationRequestSuccess:)];
    [request startAsynchronous];
}

-(void)NotificationRequestFail:(ASIFormDataRequest*)request{
    
    dispatch_async(dispatch_get_main_queue(), ^
                   {
                       [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_SETTING_FAILED object:@"Unable to perform task at this movement."];
                   });
}

-(void)NotificationRequestSuccess:(ASIFormDataRequest*)request{
    
    NSString *responseString = [request responseString];
    responseString = [[responseString componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]] componentsJoinedByString:@""];
    responseString = [responseString stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    SBJSON *parser=[[SBJSON alloc]init];
    
    NSDictionary *results = [parser objectWithString:responseString error:nil];
    NSMutableDictionary *responseDict = ((NSMutableDictionary *)[results objectForKey:@"response"]);
    
    NSInteger status_code = [[responseDict valueForKey:@"status_code"] integerValue];
    
    if (status_code==200)
    {
        ICNotificationSettingHolder *notificationsettingHolder=[ICNotificationSettingHolder new];
         notificationsettingHolder.strPost = [responseDict valueForKey:@"push_notification_on_cube_post"];
           notificationsettingHolder.strLike = [responseDict valueForKey:@"push_notification_on_cube_like"];
         notificationsettingHolder.strCmt = [responseDict valueForKey:@"push_notification_on_cube_comment"];
         notificationsettingHolder.strTeamCube = [responseDict valueForKey:@"push_notification_on_team_cubed"];
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_SETTING_SUCCEESS object:notificationsettingHolder];
                       });

    }else{
        
        NSString *errMsg = [responseDict objectForKey:@"message"];
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_SETTING_FAILED  object:errMsg];
                       });
    }
}



#pragma mark - LOGOUT

-(void)requestForLogout
{
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:urlLogout];
    
    [request setPostValue:[NSString stringWithFormat:@"%ld",(long)loginDHolder.icUserId] forKey:@"user_id"];
    [request setDelegate:self];
    [request setDidFailSelector:@selector(requestLogoutFail:)];
    [request setDidFinishSelector:@selector(requestLogoutSuccess:)];
    [request startAsynchronous];
}

-(void)requestLogoutFail:(ASIFormDataRequest*)request{
    
    dispatch_async(dispatch_get_main_queue(), ^
                   {
                       [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_LOGOUT_FAILED object:@"Unable to get logout at this movement."];
                   });
}

-(void)requestLogoutSuccess:(ASIFormDataRequest*)request{
    
    NSString *responseString = [request responseString];
    responseString = [[responseString componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]] componentsJoinedByString:@""];
    responseString = [responseString stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    SBJSON *parser=[[SBJSON alloc]init];
    
    NSDictionary *results = [parser objectWithString:responseString error:nil];
    NSMutableDictionary *responseDict = ((NSMutableDictionary *)[results objectForKey:@"response"]);
      
    NSInteger status_code = [[responseDict valueForKey:@"status_code"] integerValue];
    
    if (status_code==200)
    {
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_LOGOUT_SUCCESS object:nil];
                       });
    }else{
        
        NSString *errMsg = [responseDict objectForKey:@"message"];
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_LOGOUT_FAILED object:errMsg];
                       });
    }
}

#pragma mark - LIST_SEARCH_CUBE_FEED

-(void)requestForListSearchCubeFeed:(NSMutableDictionary*)info
{
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:urlSearchCubeFeedList];
    NSString *recordType=[info valueForKey:@"record_type"];
    NSString *userId=[info valueForKey:@"user_id"];
    NSString *pageId=[info valueForKey:@"search_page_id"];
   
    [request setPostValue:userId forKey:@"id"];
    [request setPostValue:pageId forKey:@"pageno"];
    [request setPostValue:recordType forKey:@"type"];
 
    [request setDelegate:self];
    [request setDidFailSelector:@selector(requestListSearchCubeFeedFail:)];
    [request setDidFinishSelector:@selector(requestListSearchCubeFeedSuccess:)];
    [request startAsynchronous];
}


-(void)requestListSearchCubeFeedFail:(ASIFormDataRequest*)request{
    
    dispatch_async(dispatch_get_main_queue(), ^
                   {
                       [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_SEARCH_CUBE_FEED_LIST_FAILED object:@"unable to get cube feed at this movement."];
                   });
}

-(void)requestListSearchCubeFeedSuccess:(ASIFormDataRequest*)request
{
    NSString *responseString = [request responseString];
    responseString = [[responseString componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]] componentsJoinedByString:@""];
    responseString = [responseString stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    SBJSON *parser=[[SBJSON alloc]init];
    
    NSDictionary *results = [parser objectWithString:responseString error:nil];
    NSMutableDictionary *responseDict = ((NSMutableDictionary *)[results objectForKey:@"response"]);
    NSMutableArray *arrCubeCommentListDetail=((NSMutableArray*)[responseDict objectForKey:@"data"]);
    
    NSInteger status_code = [[responseDict valueForKey:@"status_code"] integerValue];
    
    if (status_code==200)
    {
        
        NSMutableArray *arrCubeFeedCommentsList=[[NSMutableArray alloc]init];
        for (int i=0;i<arrCubeCommentListDetail.count ; i++)
        {
            ICCubeFeedCommentHolder *cubeCommentDHolder = [ICCubeFeedCommentHolder new];
            
            cubeCommentDHolder.strCubeFeedId = [[arrCubeCommentListDetail objectAtIndex:i] valueForKey:@"cubefeed_id"];
            cubeCommentDHolder.strCubeId = [[arrCubeCommentListDetail objectAtIndex:i] valueForKey:@"cube_id"];
            cubeCommentDHolder.strCubeType = [[arrCubeCommentListDetail objectAtIndex:i] valueForKey:@"cube_type"];
            cubeCommentDHolder.strComment =[[arrCubeCommentListDetail objectAtIndex:i] valueForKey:@"comment"];
            cubeCommentDHolder.strCubeImageUrl = [[arrCubeCommentListDetail objectAtIndex:i] valueForKey:@"cube_image"] ;
            cubeCommentDHolder.strCubePosterImageUrl = [[arrCubeCommentListDetail objectAtIndex:i] valueForKey:@"poster_image"];
            cubeCommentDHolder.strCubeRecievedImageUrl = [[arrCubeCommentListDetail objectAtIndex:i] valueForKey:@"receiver_image"];
            cubeCommentDHolder.strCubePostrId =[[arrCubeCommentListDetail objectAtIndex:i] valueForKey:@"cube_postedby"];
            cubeCommentDHolder.strCubeRecievedId = [[arrCubeCommentListDetail objectAtIndex:i] valueForKey:@"cube_receivedby"] ;
            cubeCommentDHolder.strTotalComments = [[[arrCubeCommentListDetail objectAtIndex:i] valueForKey:@"total_comments"] integerValue];
            cubeCommentDHolder.likestatus =[[[arrCubeCommentListDetail objectAtIndex:i] valueForKey:@"like_status"] integerValue];
            cubeCommentDHolder.strTotalLike = [[[arrCubeCommentListDetail objectAtIndex:i] valueForKey:@"total_like"] integerValue];
            cubeCommentDHolder.strCubePosterName =[[arrCubeCommentListDetail objectAtIndex:i] valueForKey:@"cube_poster_name"];
            cubeCommentDHolder.strCubeRecievedName = [[arrCubeCommentListDetail objectAtIndex:i] valueForKey:@"cube_receiver_name"] ;
            
            cubeCommentDHolder.intReceiverId=[[[arrCubeCommentListDetail objectAtIndex:i]valueForKey:@"cube_receivedby"]integerValue];
            
            cubeCommentDHolder.intSenderId=[[[arrCubeCommentListDetail objectAtIndex:i]valueForKey:@"cube_postedby"]integerValue];
            cubeCommentDHolder.strCubePostedDate=[[arrCubeCommentListDetail objectAtIndex:i]valueForKey:@"cube_posteddate"];
            
            [arrCubeFeedCommentsList addObject:cubeCommentDHolder];
            
        }
        
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_SEARCH_CUBE_FEED_LIST_SUCCESS object:arrCubeFeedCommentsList];
                       });
    }else{
        
        NSString *errMsg = [responseDict objectForKey:@"message"];
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_SEARCH_CUBE_FEED_LIST_FAILED object:errMsg];
                       });
       }
}

#pragma mark - NotificationSettingUpdate

-(void)requestForNotificationSettingUpdate:(NSMutableDictionary*)info
{
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:urlNotificationUpdateSetting];
    
    NSString *cubePost = [info valueForKey:@"notify_post"];
    NSString *cubeLike = [info valueForKey:@"notify_like"];
    NSString *cubeComment = [info valueForKey:@"notify_comment"];
    NSString *teamCube = [info valueForKey:@"notify_TeamPost"];
    
    [request setPostValue:[NSString stringWithFormat:@"%ld",(long)loginDHolder.icUserId] forKey:@"user_id"];
   
 
    [request setPostValue:cubeComment forKey:@"push_notification_on_cube_comment"];
    [request setPostValue:cubePost forKey:@"push_notification_on_cube_post"];
    [request setPostValue:cubeLike forKey:@"push_notification_on_cube_like"];
    [request setPostValue:teamCube forKey:@"push_notification_on_team_cubed"];
    
    [request setDelegate:self];
    [request setDidFailSelector:@selector(requestNotificationUpdateSettingFail:)];
    [request setDidFinishSelector:@selector(requestNotificationUpdateSettingSuccess:)];
    [request startAsynchronous];
}

-(void)requestNotificationUpdateSettingFail:(ASIFormDataRequest*)request{
    
    dispatch_async(dispatch_get_main_queue(), ^
                   {
                       [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_SETTING_UPDATE_FAILED  object:@"unable to perform task at this movement."];
                   });
}
-(void)requestNotificationUpdateSettingSuccess:(ASIFormDataRequest*)request{
    
    NSString *responseString = [request responseString];
    responseString = [[responseString componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]] componentsJoinedByString:@""];
    responseString = [responseString stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    SBJSON *parser=[[SBJSON alloc]init];
    
    NSDictionary *results = [parser objectWithString:responseString error:nil];
    NSMutableDictionary *responseDict = ((NSMutableDictionary *)[results objectForKey:@"response"]);
    
    NSInteger status_code = [[responseDict valueForKey:@"status_code"] integerValue];
    
    if (status_code==200)
    {        
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_SETTING_UPDATE_SUCCESS object:nil];
                       });
    }else{
        
        NSString *errMsg = [responseDict objectForKey:@"message"];
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_SETTING_UPDATE_FAILED object:errMsg];
                       });
    }
}


@end



