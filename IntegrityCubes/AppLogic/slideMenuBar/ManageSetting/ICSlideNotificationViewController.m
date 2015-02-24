//
//  ICSlideNotificationViewController.m
//  Cube
//
//  Created by Balkaran on 01/11/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//

#import "ICSlideNotificationViewController.h"
#import "ICNotificationSettingHolder.h"

@interface ICSlideNotificationViewController ()

@end

@implementation ICSlideNotificationViewController
@synthesize Switch_Cmt,Switch_like,Switch_post,Switch_teamcube;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    //AryaHud
    HUD = [AryaHUD new];
    [self.view addSubview:HUD];
    
    [HUD show];
    [self requestNotification];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(NotificationSettingSuccess:) name:NOTIFICATION_SETTING_SUCCEESS object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(NotificationSettingFailed:) name:NOTIFICATION_SETTING_FAILED object:nil];
    
     [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(NotificationSettingUpdateSuccess:) name:NOTIFICATION_SETTING_UPDATE_SUCCESS object:nil];
     [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(NotificationSettingUpdateFailed:) name:NOTIFICATION_SETTING_UPDATE_FAILED object:nil];
    
    btnUpdate.layer.cornerRadius=4.0f;
    btnUpdate.layer.masksToBounds=YES;
    
    if ([loginDHolder.strUserType isEqualToString:@"General"]){
        
        lbl_team.hidden = YES;
        view_team.hidden = YES;
        Switch_teamcube.hidden = YES;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)showRightMenuPressed:(id)sender{
    
    [self.menuContainerViewController toggleRightSideMenuCompletion:nil];
}
- (IBAction)Update:(id)sender {

    [HUD show];
    if (Switch_post.on) {
         String_post=@"1";
    }
    else {
        NSLog(@"post switch off");
        String_post=@"0";
    }
 
    if (Switch_Cmt.on) {
        NSLog(@" Cmt switch on");
        String_Cmt=@"1";
        
    }
    else {
        NSLog(@"cmt switch off");
          String_Cmt=@"0";
    }
    
    if (Switch_like.on) {
        NSLog(@" like switch on");
        String_like=@"1";
        
    }
    else {
        NSLog(@"like switch off");
        String_like=@"0";
    }
   
    if (Switch_teamcube.on) {
        NSLog(@" like switch on");
        String_teamcube=@"1";
        
    }
    else {
        NSLog(@"like switch off");
        String_teamcube=@"0";
    }
    
    NSMutableDictionary * dict = [NSMutableDictionary new];
    [dict setValue:String_Cmt forKey:@"notify_comment"];
    [dict setValue:String_like forKey:@"notify_like"];
    [dict setValue:String_post forKey:@"notify_post"];
    [dict setValue:String_teamcube forKey:@"notify_TeamPost"];
    [HUD show];
    [self requestForNotificationSettingUpdate:dict];
    
}
#pragma mark - API CALLING

-(void)requestNotification{
    
    if([ICUtils isConnectedToHost])
    {
        [[ICRestIntraction sharedManager]NotificationRequest];
    }
    else
    {
        [HUD hide];
        [ICUtils showAlert:MESSAGE_NET_NOT_AVAILABLE];
    }
}
-(void)requestForNotificationSettingUpdate:(NSMutableDictionary*)info{
    
    if([ICUtils isConnectedToHost])
    {
        [[ICRestIntraction sharedManager]requestForNotificationSettingUpdate:info];
    }
    else
    {
        [HUD hide];
        [ICUtils showAlert:MESSAGE_NET_NOT_AVAILABLE];
    }
}
#pragma mark - notification setting selector

-(void)NotificationSettingSuccess:(NSNotification*)notification{
    
    [HUD hide];
    ICNotificationSettingHolder * holder = notification.object;
    
    if ([holder.strCmt isEqualToString:@"0"])
    {
        Switch_Cmt.on = NO;
    }else
    {
        Switch_Cmt.on = YES;

    }
    if ([holder.strLike isEqualToString:@"0"]) {
        Switch_like.on = NO;
    }else{
        Switch_like.on = YES;
        
    }
    if ([holder.strPost isEqualToString:@"0"]) {
        Switch_post.on = NO;
    }else{
        Switch_post.on = YES;
        
    }
    if ([holder.strTeamCube isEqualToString:@"0"]) {
        Switch_teamcube.on = NO;
    }else{
        Switch_teamcube.on = YES;
        
    }

}
-(void)NotificationSettingFailed:(NSNotification*)notification{
 
    [HUD hide];
    [ICUtils showAlert:@"Unable to update."];
}
-(void)NotificationSettingUpdateSuccess:(NSNotification*)notification
{
    [HUD hide];
    [ICUtils showAlert:@"Notification Setting successfully updated."];
    [self requestNotification];
}
-(void)NotificationSettingUpdateFailed:(NSNotification*)notification
{
    [HUD hide];
    [ICUtils showAlert:@"Unable to update."];
    
}


@end
