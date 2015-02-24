  //
//  ICAppDelegate.m
//  IntegrityCubes
//
//  Created by vishnu on 13/03/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//

#import "ICAppDelegate.h"

#import "MFSideMenu.h"
#import "ICAccLoginViewController.h"
#import "ICDataBaseInteraction.h"

@implementation ICAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
//    
//    if ([application respondsToSelector:@selector(isRegisteredForRemoteNotifications)])
//    {
//        // iOS 8 Notifications
//        [application registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge) categories:nil]];
//        
//        [application registerForRemoteNotifications];
//    }
//    else
//    {
//        // iOS < 8 Notifications
//        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:
//         (UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert)];
//    }
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
    {
        [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge) categories:nil]];
        [[UIApplication sharedApplication] registerForRemoteNotifications];
    }
    else
    {
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:
         (UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert)];
    }
    
    UITextField *txtField = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    [txtField becomeFirstResponder];
    [self.window addSubview:txtField];
    [txtField removeFromSuperview];
    txtField = nil;
    
    NSString *strUserId = [[NSUserDefaults standardUserDefaults]valueForKey:KEY_USER_ID];
    if (strUserId) {
        
        isLoggedIn = YES;
        loginDHolder = [ICLoginDataHolder new];
        loginDHolder.icUserId = [strUserId integerValue];
        loginDHolder.strBamBooId = [[NSUserDefaults standardUserDefaults]valueForKey:KEY_USER_BAMBOO_ID];
        loginDHolder.strCity = [[NSUserDefaults standardUserDefaults]valueForKey:KEY_USER_CITY];
        loginDHolder.strDivision = [[NSUserDefaults standardUserDefaults]valueForKey:KEY_USER_DIVISION];
        loginDHolder.strEmail = [[NSUserDefaults standardUserDefaults]valueForKey:KEY_USER_EMAIL];
        loginDHolder.strFirstName = [[NSUserDefaults standardUserDefaults]valueForKey:KEY_USER_FIRST_NAME];
        loginDHolder.strJobTitle = [[NSUserDefaults standardUserDefaults]valueForKey:KEY_USER_JOB_TITLE];
        loginDHolder.strLastName = [[NSUserDefaults standardUserDefaults]valueForKey:KEY_USER_LAST_NAME];
        loginDHolder.strPhone = [[NSUserDefaults standardUserDefaults]valueForKey:KEY_USER_PHONE];
        loginDHolder.strState = [[NSUserDefaults standardUserDefaults]valueForKey:KEY_USER_STATE];
        loginDHolder.strUserImageUrl = [[NSUserDefaults standardUserDefaults]valueForKey:KEY_USER_IMG_URL];
        loginDHolder.strUserName = [[NSUserDefaults standardUserDefaults]valueForKey:KEY_USER_NAME];
        loginDHolder.strUserType = [[NSUserDefaults standardUserDefaults]valueForKey:KEY_USER_TYPE];
                
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:[NSBundle mainBundle]];
        
        MFSideMenuContainerViewController *container = (MFSideMenuContainerViewController *)[storyboard instantiateViewControllerWithIdentifier:@"MFSideMenuContainerViewController"];
        
        UINavigationController *navigationController = (UINavigationController*)[storyboard instantiateViewControllerWithIdentifier:@"navigationController"];
        
        UIViewController *rightSideMenuViewController = (UIViewController*)[storyboard instantiateViewControllerWithIdentifier:@"rightSideMenuViewController"];
        
        [container setRightMenuViewController:rightSideMenuViewController];
        [container setCenterViewController:navigationController];
        UIWindow *window = [[UIApplication sharedApplication].windows objectAtIndex:0];
        window.rootViewController = container;
              
        hostReachable = [Reachability reachabilityWithHostName: @"www.google.com"] ;
        [hostReachable startNotifier];
    }
    
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isPushNotification"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"isPushNotification"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
-(void)logout
{
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:KEY_USER_BAMBOO_ID];
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:KEY_USER_CITY];
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:KEY_USER_DIVISION];
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:KEY_USER_EMAIL];
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:KEY_USER_FIRST_NAME];
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:KEY_USER_ID];
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:KEY_USER_IMG_URL];
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:KEY_USER_JOB_TITLE];
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:KEY_USER_LAST_NAME];
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:KEY_USER_NAME];
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:KEY_USER_PHONE];
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:KEY_USER_STATE];
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:KEY_USER_TYPE];
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:KEY_NOTIFICATION_TIME];
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:KEY_NOTIFICATION_FIRST];
    
    [[NSUserDefaults standardUserDefaults]synchronize];
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
    
    ICAccLoginViewController *vc = (ICAccLoginViewController *)[storyboard instantiateViewControllerWithIdentifier:@"loginViewController"];
//    UINavigationController *navController=[[UINavigationController alloc]initWithRootViewController:vc];

    self.window.rootViewController = vc;
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    if ([ICUtils isConnectedToHost])
    {
        [[ICRestIntraction sharedManager] requestForNotificationFromServer];
    }
}
#pragma mark PUSH_NOTIFICATION METHODS

- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken
{
    NSString *strDeviceToken  = [NSString stringWithFormat:@"%@",deviceToken];
    strDeviceToken = [strDeviceToken stringByReplacingOccurrencesOfString:@" " withString:@""];
    strDeviceToken = [strDeviceToken stringByReplacingOccurrencesOfString:@"<" withString:@""];
    strDeviceToken = [strDeviceToken stringByReplacingOccurrencesOfString:@">" withString:@""];
	NSLog(@"My token is: %@", strDeviceToken);
    [[NSUserDefaults standardUserDefaults] setObject:strDeviceToken forKey:KEY_DEVICE_TOKEN];
    [[NSUserDefaults standardUserDefaults] synchronize];
//    [ICUtils showAlert:strDeviceToken];
   
}

- (void)application:(UIApplication*)application didFailToRegisterForRemoteNotificationsWithError:(NSError*)error
{
	NSLog(@"Failed to get token, error: %@", error);
}
-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
{
    application.applicationIconBadgeNumber = 0;
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"isPushNotification"])
    {
        [[ICRestIntraction sharedManager] requestForNotificationFromServer];
    }
//    NSDictionary *apsInfo = [userInfo valueForKey:@"aps"];
//    NSUInteger contentValue = [[apsInfo valueForKey:@"content-available"] integerValue];
//    if (contentValue==1) {
//        
//        NSDictionary *tempUserInfo = [userInfo valueForKey:@"data"];
//        NSString *cubeFeedId = [tempUserInfo valueForKey:@"cubepostedid"];
//        NSString *cubeCommentId = [tempUserInfo valueForKey:@"comentoncubeid"];
//        NSUInteger statuscode = [[tempUserInfo valueForKey:@"statuscode"] integerValue];
//        NSMutableDictionary *info = [NSMutableDictionary dictionary];
//        [info setObject:cubeFeedId forKey:KEY_CUBE_FEED_ID];
//        [info setObject:cubeCommentId forKey:KEY_CUBE_COMMENT_ID];
//        
//        if (statuscode==0) {
//            
//            [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_CUBE_COMMENT_DELETED object:info];
//        }else if(statuscode==1){
//            
//            [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_CUBE_FEED_DELETED object:info];
//
//        }else{
//            
//        }
//    }else{
//        
//        if ([[NSUserDefaults standardUserDefaults] boolForKey:@"isPushNotification"])
//        {
//            [[ICRestIntraction sharedManager] requestForNotificationFromServer];
//        }
//    }
}
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    application.applicationIconBadgeNumber = 0;
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"isPushNotification"])
    {
        [[ICRestIntraction sharedManager] requestForNotificationFromServer];
    }
}
- (void)applicationDidBecomeActive:(UIApplication *)application
{
    
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
