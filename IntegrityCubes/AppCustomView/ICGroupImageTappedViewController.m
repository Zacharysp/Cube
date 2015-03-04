//
//  ICGroupImageTappedViewController.m
//  Cube
//
//  Created by Dongjie Zhang on 2/27/15.
//  Copyright (c) 2015 Aryavrat Infotech. All rights reserved.
//

#import "ICGroupImageTappedViewController.h"

@interface ICGroupImageTappedViewController ()

@end

@implementation ICGroupImageTappedViewController
@synthesize user_id, cube_postedid, group_type, from_view;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getUserListSuccess:) name:NOTIFICATION_GET_USER_LIST_POPUP_SUCCESS object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getUserListFailed:) name:NOTIFICATION_GET_USER_LIST_POPUP_FAILED object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getTeamListSuccess:) name:NOTIFICATION_GET_TEAM_LIST_POPUP_SUCCESS object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getTeamListFailed:) name:NOTIFICATION_GET_TEAM_LIST_POPUP_FAILED object:nil];
    
    tblList=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 200, 100)];
    tblList.dataSource=self;
    tblList.delegate=self;
    [self.view addSubview:tblList];
    
    CGPoint oldCenter=tblList.center;
    tblList.frame=CGRectMake(0.0, 0.0, tblList.bounds.size.height, tblList.bounds.size.width);
    tblList.transform=CGAffineTransformMakeRotation(-M_PI_2);
    tblList.center=oldCenter;
    
    tblList.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    NSMutableDictionary *info = [NSMutableDictionary dictionary];
    
    [info setValue:user_id forKey:@"user_id"];
    [info setObject:cube_postedid forKey:@"cube_postedid"];

    if ([group_type isEqualToString:@"u"]){
        [self performSelectorInBackground:@selector(requestGetUserList:) withObject:info];
    }
    else{
        [self performSelectorInBackground:@selector(requestGetTeamList:) withObject:info];
    }
    
    HUD = [AryaHUD new];
    HUD.center = self.view.center;
    [HUD setHUDText:@"Loading..."];
    [self.view addSubview:HUD];
    
    // Do any additional setup after loading the view.
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return YES;
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrList.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 85;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier=@"Cell";
    tableView.separatorInset=UIEdgeInsetsZero;
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.contentView.backgroundColor=[UIColor colorWithRed:245.0/255 green:245.0/255 blue:245.0/255 alpha:1];
    if (cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    ICGroupDataHolder *user = (ICGroupDataHolder*)[arrList objectAtIndex:indexPath.row];
    UIImageView* image = [[UIImageView alloc] initWithFrame:CGRectMake(50, 25, 40, 40)];
    [image setImageWithUrl:[NSURL URLWithString:user.strReceiverImage] andPlaceHoder:[UIImage imageNamed:NO_IMAGE_AVAILABLE] andNoImage:[UIImage imageNamed:NO_IMAGE]];
    image.transform = CGAffineTransformMakeRotation(M_PI_2);
    [cell addSubview:image];
    
    UILabel* lblName = [[UILabel alloc] initWithFrame:CGRectMake(0, 32, 85, 20)];
    lblName.textAlignment = NSTextAlignmentCenter;
    lblName.text = user.strReceiverName;
    [lblName setFont:[UIFont systemFontOfSize:10]];
    lblName.transform = CGAffineTransformMakeRotation(M_PI_2);
    [cell addSubview:lblName];
    
    ICLikeCommentButton *btnRightViewProfile = [[ICLikeCommentButton alloc] initWithFrame:image.frame];
    [btnRightViewProfile addTarget:self
                            action:@selector(btnViewProfileDidClicked:)
                  forControlEvents:UIControlEventTouchUpInside];
    
    NSRange range = [user.strReceiverUrl rangeOfString:@"="];
    if (range.location == NSNotFound) {
        [ICUtils showAlert:@"Unknown error" delegate:self btnOk:@"Ok" btnCancel:nil];
    } else {
        NSString *str = [user.strReceiverUrl substringFromIndex:range.location+1];
        btnRightViewProfile.index = [str integerValue];
    }
    
    btnRightViewProfile.group_type = group_type;
    [cell addSubview:btnRightViewProfile];
    
    return cell;
}

-(void)requestGetUserList:(NSMutableDictionary *)dict
{
    if([ICUtils isConnectedToHost])
    {
        [[ICRestIntraction sharedManager] requestForGetUserList:dict];
        
    }
    else
    {
        [HUD hide];
        [ICUtils showAlert:MESSAGE_NET_NOT_AVAILABLE delegate:self btnOk:@"Ok" btnCancel:nil];
    }
}

-(void)getUserListSuccess:(NSNotification *)notification
{
    [HUD hide];
    arrList = (NSMutableArray*)notification.object;
    [tblList reloadData];
}

-(void)getUserListFailed:(NSNotification *)notification
{
    [HUD hide];
}


-(void)requestGetTeamList:(NSMutableDictionary *)dict
{
    if([ICUtils isConnectedToHost])
    {
        [[ICRestIntraction sharedManager] requestForGetTeamList:dict];
        
    }
    else
    {
        [HUD hide];
        [ICUtils showAlert:MESSAGE_NET_NOT_AVAILABLE delegate:self btnOk:@"Ok" btnCancel:nil];
    }
}

-(void)getTeamListSuccess:(NSNotification *)notification
{
    [HUD hide];
    arrList = (NSMutableArray*)notification.object;
    [tblList reloadData];
}

-(void)getTeamListFailed:(NSNotification *)notification
{
    [HUD hide];
}

-(void)btnViewProfileDidClicked:(id)sender{
    
    isProfileView=NO;
    ICLikeCommentButton *btnComment = (ICLikeCommentButton*)sender;
    NSMutableDictionary * info=[[NSMutableDictionary alloc]init];
    [info setValue: [NSString stringWithFormat:@"%lu", (unsigned long)btnComment.index] forKey:@"searchId"];
    [info setValue:btnComment.group_type forKey:@"searchType"];
    
//    if(btnComment.tag==1){
//        
//        if(arrCubeMyFeedList.count>0){
//            
//            userDetailDHolder = [arrCubeMyFeedList objectAtIndex:btnComment.index];
//            [info setValue:[NSString stringWithFormat:@"%ld",(long)userDetailDHolder.intReceiverId]forKey:@"searchId"];
//            [info setValue:userDetailDHolder.strCubeType forKey:@"searchType"];
//        }
//        
//    }else{
//        
//        if(arrCubeMyFeedList.count>0){
//            
//            userDetailDHolder = [arrCubeMyFeedList objectAtIndex:btnComment.index];
//            [info setValue:[NSString stringWithFormat:@"%ld",(long)userDetailDHolder.intSenderId]forKey:@"searchId"];
//            [info setValue:@"u" forKey:@"searchType"];
//            
//        }
//    }
    if(info.count>0){
        if ([from_view isEqualToString:@"home"]) {
            [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_GO_BACK_TO_HOME object:nil userInfo:info];
        }else{
            [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_GO_BACK_TO_PROFILE object:nil userInfo:info];
        }
    }
    
}


@end
