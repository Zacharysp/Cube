//
//  ICConstants.h
//  IntegrityCubes
//
//  Created by aditi on 20/03/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//

//NSLOG
#if DEBUG
    #define ICLog(str, ...) NSLog(str, ##__VA_ARGS__)
#else
    #define ICLog(str,...)
#endif


//Condition
#define IS_IPHONE_5 ([[UIScreen mainScreen] bounds].size.height == 568)

//sections
#define SECTION_COMMENT_DELETE 0

//keys
#define KEY_CUBE_FEED_ID @"cubeFeed_id"
#define KEY_CUBE_COMMENT_ID @"cubeCommentId"
#define KEY_USER_ID @"userId"
#define KEY_USER_CITY @"strCity"
#define KEY_USER_EMAIL @"strEmail"
#define KEY_USER_PHONE @"strPhone"
#define KEY_USER_STATE @"strState"
#define KEY_USER_NAME @"strUserName"
#define KEY_USER_TYPE @"strUserType"
#define KEY_USER_TEAM_ID @"strTeamId"
#define KEY_DEVICE_TOKEN @"deviceToken"
#define KEY_USER_DIVISION @"strDivision"
#define KEY_USER_BAMBOO_ID @"strBamBooId"
#define KEY_USER_LAST_NAME @"strLastName"
#define KEY_USER_JOB_TITLE @"strJobTitle"
#define KEY_USER_FIRST_NAME @"strFirstName"
#define KEY_USER_IMG_URL @"strUserImageUrl"
#define KEY_NOTIFICATION_TIME @"notificationTime"
#define KEY_NOTIFICATION_FIRST @"notificationFirst"

#define KEY_FACEBOOK @"strFacebook"
#define KEY_FACEBOOK_LINK @"facebookLink"

#define KEY_TWITTER @"strTwitter"
#define KEY_TWITTER_LINK @"twitterLink"

#define KEY_LINKEDIN @"strLinkedin"
#define KEY_LINKEDIN_LINK @"linkedinLink"

//messages
#define MESSAGE_UNSUCCESSFUL @"Unsuccessful"
#define MESSAGE_CUBE_PICK @"Please pick a cube."
#define MESSAGE_WRITE_MESSAGE @"Write a message"
#define MESSAGE_CHARACTER_ERROR @"Max Characters:100"
#define MESSAGE_UNSUCCESSFUL_POST @"Post Unsuccessful."
#define MESSAGE_EMAIL_NOT_VALID @"Email id is not valid."
#define MESSAGE_LOGIN_ERROR @"Unable to login at right now."
#define MESSAGE_SUCCESSFUL_POST @"Message successfully post."
#define MESSAGE_NET_NOT_AVAILABLE @"Please connect to internet."
#define MESSAGE_CUBE_LIST_PROBLEM @"Cube list is not available."
#define MESSAGE_COMMENTBOX_BLANK_ERROR @"Message box can't be blank."
#define MESSAGE_COMMENT_USER_ERROR @"Person couldn't send cube himself."
#define MESSAGE_NEW_PASSWORD_SENT @"New password is sent to your email."
#define MESSAGE_COMMENT_ERROR @"Message can't be more than 300 characters."
#define MESSAGE_SELECT_PERSON_OR_TEAM_ERROR @"Please select person or team."

//Main urls
//#define URL_MAIN @"http://122.176.45.15:8080/integritycubes_test/api/"
//#define URL_MAIN @"http://122.176.45.15:8080/integritycubesdev/api/"

//#define URL_MAIN @"http://122.176.45.15:8080/integritycubes/"
//#define URL_MAIN @"http://54.85.21.40/api/"
//#define URL_MAIN @"http://thecube.integritystaffing.com/api/"
//#define URL_MAIN @"http://192.168.1.200:8080/integritycubesdev/api/"
#define URL_MAIN @"http://182.237.17.106:8080/integritycubesdev/api/"

//#define URL_MAIN @"http://aryamobi.com/integritycube/api/"



//Support Urls
#define URL_LOGIN [NSString stringWithFormat:@"%@user/login", URL_MAIN];
#define URL_USER_DETAIL [NSString stringWithFormat:@"%@user/userinformation",URL_MAIN];
#define URL_CHANGE_PASSWORD [NSString stringWithFormat:@"%@user/changeuserpassword",URL_MAIN];
#define URL_FORGOT_PASSWORD [NSString stringWithFormat:@"%@user/forgotpassword", URL_MAIN];

#define URL_CUBE_LIST [NSString stringWithFormat:@"%@cube/cubelist", URL_MAIN];
#define URL_CUBE_POST [NSString stringWithFormat:@"%@cube/postcube", URL_MAIN];
#define URL_CUBE_RECENT [NSString stringWithFormat:@"%@cube/recentcubes",URL_MAIN];
#define URL_CUBE_FEED_LIST [NSString stringWithFormat:@"%@cube/cubefeed",URL_MAIN];
#define URL_CUBE_FEED_POST_LIKE [NSString stringWithFormat:@"%@cube/likecube",URL_MAIN];
#define URL_CUBE_PIACHART_TEAM [NSString stringWithFormat:@"%@cube/cubebyteam",URL_MAIN];
#define URL_CUBE_OF_THE_WEEK [NSString stringWithFormat:@"%@cube/cubeoftheweek",URL_MAIN];
#define URL_CUBE_TRANSLATOR [NSString stringWithFormat:@"%@cube/cubetranslator",URL_MAIN];
#define URL_CUBE_CHAT_OVERTIME [NSString stringWithFormat:@"%@cube/cubeovertime",URL_MAIN];
#define URL_CUBE_PIACHART_VALUE [NSString stringWithFormat:@"%@cube/cubebyvalue",URL_MAIN];
#define URL_CUBE_FEED_POST_COMMENT [NSString stringWithFormat:@"%@cube/commentoncube",URL_MAIN];
#define URL_CUBE_PIACHART_DIVISION [NSString stringWithFormat:@"%@cube/cubebydivision",URL_MAIN];
#define URL_CUBE_SENT_MY_FEED_LIST [NSString stringWithFormat:@"%@cube/mysentcubesfeed",URL_MAIN];
#define URL_CUBE_COMMENT_LIST [NSString stringWithFormat:@"%@cube/commentlistbycubefeed",URL_MAIN];
#define URL_CUBE_NOTIFICATION_SERVER_LIST [NSString stringWithFormat:@"%@cube/getnotification",URL_MAIN];
#define URL_CUBE_RECEIVED_MY_FEED_LIST [NSString stringWithFormat:@"%@cube/myreceivedcubesfeed",URL_MAIN];

#define URL_TEAM_LIST [NSString stringWithFormat:@"%@team/teamlist",URL_MAIN];
#define URL_TEAM_DETAIL [NSString stringWithFormat:@"%@team/teamdetail",URL_MAIN];
#define URL_TEAM_PERSON_LIST [NSString stringWithFormat:@"%@user/teamorpersonlist", URL_MAIN];
#define URL_TEAM_POSTER_DETAIL [NSString stringWithFormat:@"%@team/userbycubeposted",URL_MAIN];

#define URL_MOST_SENT_CUBES_BY_PERSON [NSString stringWithFormat:@"%@cube/mostsentcubes",URL_MAIN];
#define URL_MOST_RCV_CUBES_BY_PERSON [NSString stringWithFormat:@"%@cube/mostreceivedcubes",URL_MAIN];
#define URL_MOST_RCV_CUBES_BY_TEAM [NSString stringWithFormat:@"%@cube/mostreceivedcubesbyteam",URL_MAIN];

#define URL_EDIT_LINK [NSString stringWithFormat:@"%@user/editlinks",URL_MAIN];
#define URL_DELETE_COMMENT [NSString stringWithFormat:@"%@cube/deletecomment",URL_MAIN];
#define URL_DELETE_CUBE_FEED [NSString stringWithFormat:@"%@cube/deletecubefeed",URL_MAIN];
#define URL_NO_USER_ACTIVITY [NSString stringWithFormat:@"%@cube/noactivityuser",URL_MAIN];
#define URL_SEARCH_OR_VIEW_PROFILE [NSString stringWithFormat:@"%@cube/searchbyuserorteam",URL_MAIN];

#define URL_LOGOUT [NSString stringWithFormat:@"%@user/logout",URL_MAIN];
#define URL_SEARCH_CUBE_FEED_LIST [NSString stringWithFormat:@"%@cube/searchcubefeed",URL_MAIN];

#define URL_NOTIFICATION_SETTING [NSString stringWithFormat:@"%@cube/usercheckpushnotification",URL_MAIN];
#define URL_NOTIFICATION_UPDATE_SETTING [NSString stringWithFormat:@"%@cube/updateUserpushnotification",URL_MAIN];




//request notifications
#define NOTIFICATION_LOGIN_FAILED @"notificationLoginFailed"
#define NOTIFICATION_LOGIN_SUCCESS @"notificationLoginSuccess"

#define NOTIFICATION_FORGOT_PWD_FAILED @"notificationForgotPwdFailed"
#define NOTIFICATION_FORGOT_PWD_SUCCESS @"notificationForgotPwdSuccess"

#define NOTIFICATION_CHANGE_PWD_FAILED @"notificationChangePwdFailed"
#define NOTIFICATION_CHANGE_PWD_SUCCESS @"notificationChangePwdSuccess"

#define NOTIFICATION_USER_DETAIL_FAILED @"notificationUserDetailFailed"
#define NOTIFICATION_USER_DETAIL_SUCCESS @"notificationUserDetailSuccess"

#define NOTIFICATION_LIST_CUBE_FAILED @"notificationListCubeFailed"
#define NOTIFICATION_LIST_CUBE_SUCCESS @"notificationListCubeSuccess"

#define NOTIFICATION_LIST_TEAM_EMPLOYEE__FAILED @"notificationListTeamEmployeeFailed"
#define NOTIFICATION_LIST_TEAM_EMPLOYEE_SUCCESS @"notificationListTeamEmployeeSuccess"

#define NOTIFICATION_CUBE_FEED_LIST_FAILED @"notificationCubeFeedListFailed"
#define NOTIFICATION_CUBE_FEED_LIST_SUCCESS @"notificationCubeFeedListSuccess"

#define NOTIFICATION_SEARCH_CUBE_FEED_LIST_FAILED @"notificationSearchCubeFeedListFailed"
#define NOTIFICATION_SEARCH_CUBE_FEED_LIST_SUCCESS @"notificationSearchCubeFeedListSuccess"

#define NOTIFICATION_CUBE_COMMENT_LIST_FAILED @"notificationCubeCommentListFailed"
#define NOTIFICATION_CUBE_COMMENT_LIST_SUCCESS @"notificationCubeCommentListSuccess"

//====== CUBE POST ======

//SU
#define NOTIFICATION_CUBE_POST_FAILED @"notificationPostCubeFailed"
#define NOTIFICATION_CUBE_POST_SUCCESS @"notificationPostCubeSuccess"
//MU
#define NOTIFICATION_CUBE_MULTIPLE_POST_FAILED @"notificationMultiplePostCubeFailed"
#define NOTIFICATION_CUBE_MULTIPLE_POST_SUCCESS @"notificationMultiplePostCubeSuccess"
//ST
#define NOTIFICATION_CUBE_SINGLE_TEAM_POST_FAILED @"notificationSingleTeamPostCubeFailed"
#define NOTIFICATION_CUBE_SINGLE_TEAM_POST_SUCCESS @"notificationSingleTeamPostCubeSuccess"
//MT
#define NOTIFICATION_CUBE_MULTIPLE_TEAM_POST_FAILED @"notificationMultipleTeamPostCubeFailed"
#define NOTIFICATION_CUBE_MULTIPLE_TEAM_POST_SUCCESS @"notificationMultipleTeamPostCubeSuccess"
//MUMT
#define NOTIFICATION_CUBE_MULTIPLE_USER_AND_MULTIPLE_TEAM_POST_FAILED @"notificationMultipleUserAndMultipleTeamPostCubeFailed"
#define NOTIFICATION_CUBE_MULTIPLE_USER_AND_MULTIPLE_TEAM_POST_SUCCESS @"notificationMultipleUserAndMultipleTeamPostCubeSuccess"
//SUMT
#define NOTIFICATION_CUBE_SINGLE_USER_AND_MULTIPLE_TEAM_POST_FAILED @"notificationSingleUserAndMultipleTeamPostCubeFailed"
#define NOTIFICATION_CUBE_SINGLE_USER_AND_MULTIPLE_TEAM_POST_SUCCESS @"notificationSingleUserAndMultipleTeamPostCubeSuccess"
//MUST
#define NOTIFICATION_CUBE_MULTIPLE_USER_AND_SINGLE_TEAM_POST_FAILED @"notificationMultipleUserAndSingleTeamPostCubeFailed"
#define NOTIFICATION_CUBE_MULTIPLE_USER_AND_SINGLE_TEAM_POST_SUCCESS @"notificationMultipleUserAndSingleTeamPostCubeSuccess"
//SUST
#define NOTIFICATION_CUBE_SINGLE_USER_AND_SINGLE_TEAM_POST_FAILED @"notificationSingleUserAndSingleTeamPostCubeFailed"
#define NOTIFICATION_CUBE_SINGLE_USER_AND_SINGLE_TEAM_POST_SUCCESS @"notificationSingleUserAndSingleTeamPostCubeSuccess"
//====== END ======

#define NOTIFICATION_CUBE_FEED_POST_COMMENT_FAILED @"notificationCubeFeedPostCommentFailed"
#define NOTIFICATION_CUBE_FEED_POST_COMMENT_SUCCESS @"notificationCubeFeedPostCommentSuccess"

#define NOTIFICATION_CUBE_FEED_POST_LIKE_FAILED @"notificationCubeFeedPostLikeFailed"
#define NOTIFICATION_CUBE_FEED_POST_LIKE_SUCCESS @"notificationCubeFeedPostLikeSuccess"

#define NOTIFICATION_CUBE_RECENT_FAILED @"notificationCubeRecentFailed"
#define NOTIFICATION_CUBE_RECENT_SUCCESS @"notificationCubeRecentSuccess"

#define NOTIFICATION_CUBE_RECEIVED_MY_FEED_LIST_FAILED @"notificationReceivedMyCubeFeedListFailed"
#define NOTIFICATION_CUBE_RECEIVED_MY_FEED_LIST_SUCCESS @"notificationReceivedMyCubeFeedListSuccess"

#define NOTIFICATION_CUBE_SENT_MY_FEED_LIST_FAILED @"notificationSentMyCubeFeedListFailed"
#define NOTIFICATION_CUBE_SENT_MY_FEED_LIST_SUCCESS @"notificationSentMyCubeFeedListSuccess"

#define NOTIFICATION_CUBE_HOME_VIEW_REFRESH_SUCCESS @"notificationCubeHomeViewRefreshSuccess"
#define NOTIFICATION_CUBE_PROFILE_VIEW_REFRESH_SUCCESS @"notificationCubeProfileViewRefreshSuccess"

#define NOTIFICATION_CUBE_PIACHAT_VALUE_FAILED @"notificationCubePiachartValueFailed"
#define NOTIFICATION_CUBE_PIACHAT_VALUE_SUCCESS @"notificationCubePiachartValueSuccess"

#define NOTIFICATION_CUBE_PIACHAT_TEAM_FAILED @"notificationCubePiachartTeamFailed"
#define NOTIFICATION_CUBE_PIACHAT_TEAM_SUCCESS @"notificationCubePiachartTeamSuccess"

#define NOTIFICATION_CUBE_PIACHAT_DIVISION_FAILED @"notificationCubePiachartDivisionFailed"
#define NOTIFICATION_CUBE_PIACHAT_DIVISION_SUCCESS @"notificationCubePiachartDivisionSuccess"

#define NOTIFICATION_CUBE_CHART_OVERTIME_FAILED @"notificationCubeChartOverTimeFailed"
#define NOTIFICATION_CUBE_CHART_OVERTIME_SUCCESS @"notificationCubeChartOverTimeSuccess"

#define NOTIFICATION_CUBE_OF_THE_WEEK_FAILED @"notificationCubeOfTheWeekFailed"
#define NOTIFICATION_CUBE_OF_THE_WEEK_SUCCESS @"notificationCubeOfTheWeekSuccess"

#define NOTIFICATION_CUBE_TRANSLATOR_FAILED @"notificationCubeTranslatorFailed"
#define NOTIFICATION_CUBE_TRANSLATOR_SUCCESS @"notificationCubeTranslatorSuccess"

#define NOTIFICATION_TEAM_LIST_FAILED @"notificationTeamListFailed"
#define NOTIFICATION_TEAM_LIST_SUCCESS @"notificationTeamListSuccess"

#define NOTIFICATION_TEAM_DETAIL_FAILED @"notificationTeamDetailFailed"
#define NOTIFICATION_TEAM_DETAIL_SUCCESS @"notificationTeamDetailSuccess"

#define NOTIFICATION_TEAM_POSTER_DETAIL_FAILED @"notificationTeamPosterDetailFailed"
#define NOTIFICATION_TEAM_POSTER_DETAIL_SUCCESS @"notificationTeamPosterDetailSuccess"

#define NOTIFICATION_MOST_RCV_CUBE_BY_TEAM_FAILED @"notificationMostSentCubeByTeamFailed"
#define NOTIFICATION_MOST_RCV_CUBE_BY_TEAM_SUCCESS @"notificationMostSentCubeByTeamSuccess"

#define NOTIFICATION_MOST_RCV_CUBE_BY_PERSON_FAILED @"notificationMostRcvCubeByPersonFailed"
#define NOTIFICATION_MOST_RCV_CUBE_BY_PERSON_SUCCESS @"notificationMostRcvCubeByPersonSuccess"

#define NOTIFICATION_MOST_SENT_CUBE_BY_PERSON_FAILED @"notificationMostSentCubeByPersonFailed"
#define NOTIFICATION_MOST_SENT_CUBE_BY_PERSON_SUCCESS @"notificationMostSentCubeByPersonSuccess"


#define NOTIFICATION_EDIT_LINK_FAILED @"notificationEditLinkFailed"
#define NOTIFICATION_EDIT_LINK_SUCCESS @"notificationEditLinkSuccess"

#define NOTIFICATION_PROFILE_EDIT_LINK_SUCCESS @"notificationProfileEditLinkSuccess"

#define NOTIFICATION_DELETE_COMMENT_FAILED @"notificationDeleteCommentFailed"
#define NOTIFICATION_DELETE_COMMENT_SUCCESS @"notificationDeleteCommentSuccess"

#define NOTIFICATION_NO_USER_ACTIVITY_FAILED @"notificationNoUserActivityFailed"
#define NOTIFICATION_NO_USER_ACTIVITY_SUCCESS @"notificationNoUserActivitySuccess"

#define NOTIFICATION_DELETE_CUBE_FEED_FAILED @"notificationDeleteCubeFeedFailed"
#define NOTIFICATION_DELETE_CUBE_FEED_SUCCESS @"notificationDeleteCubeFeedSuccess"

#define NOTIFICATION_SEARCH_OR_VIEW_PROFILE_FAILED @"notificationSearchOrViewProfileFailed"
#define NOTIFICATION_SEARCH_OR_VIEW_PROFILE_SUCCESS @"notificationSearchOrViewProfileSuccess"

#define NOTIFICATION_NTCS_API_FAILED @"notificationNtcsPushFailed"
#define NOTIFICATION_NTCS_API_SUCCESS @"notificationNtcsPushSuccess"

#define NOTIFICATION_PUSH_NTCS_SUCCESS @"notificationPushNtcsSuccess"

#define NOTIFICATION_CUBE_FEED_DELETED @"notificationCubeFeedDeleted"
#define NOTIFICATION_CUBE_COMMENT_DELETED @"notificationCubeCommentDeleted"

#define NOTIFICATION_LOGOUT_FAILED @"notificationLogoutFailed"
#define NOTIFICATION_LOGOUT_SUCCESS @"notificationLogoutSuccess"

#define NOTIFICATION_SETTING_FAILED @"notificationsettingFailed"
#define NOTIFICATION_SETTING_SUCCEESS @"notificationsettingSuccess"

#define NOTIFICATION_SETTING_UPDATE_SUCCESS @"notificationsettingUpdateSuccess"
#define NOTIFICATION_SETTING_UPDATE_FAILED @"notificationsettingUpdateFailed"



///ImagesName

#define NO_IMAGE @"noimage1.png"
#define NO_IMAGE_AVAILABLE @"No-Photo-Available-150x150.jpg"






