//
//  ICLeaderBoardViewController.m
//  IntegrityCubes
//
//  Created by Bhuvan Sharma on 07/04/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//

#import "ICLeaderBoardViewController.h"

@interface ICLeaderBoardViewController ()

@end

@implementation ICLeaderBoardViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    isDropSent=NO;
    isDropReceive=YES;
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getCubeOfTheWeekSuccess:) name:NOTIFICATION_CUBE_OF_THE_WEEK_SUCCESS object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getCubeOfTheWeekFailed:) name:NOTIFICATION_CUBE_OF_THE_WEEK_FAILED object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getMostRcvCubesByPersonSuccess:) name:NOTIFICATION_MOST_RCV_CUBE_BY_PERSON_SUCCESS object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getMostRcvCubesByPersonFailed:) name:NOTIFICATION_MOST_RCV_CUBE_BY_PERSON_FAILED object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getMostSentCubesByPersonSuccess:) name:NOTIFICATION_MOST_SENT_CUBE_BY_PERSON_SUCCESS object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getMostSentCubesByPersonFailed:) name:NOTIFICATION_MOST_SENT_CUBE_BY_PERSON_FAILED object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getMostRcvCubesByTeamSuccess:) name:NOTIFICATION_MOST_RCV_CUBE_BY_TEAM_SUCCESS object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getMostRcvCubesByTeamFailed:) name:NOTIFICATION_MOST_RCV_CUBE_BY_TEAM_FAILED object:nil];
  
    tblPeopleCube.tableFooterView = [UIView new];
    tblTeamsCube.tableFooterView = [UIView new];
   
    if([loginDHolder.strUserType isEqual:@"General"]){
        
        UIImage* imgSideMenu = [UIImage imageNamed:@"menu-icon.png"];
        CGRect imgSideFrame = CGRectMake(0, 0, imgSideMenu.size.width, imgSideMenu.size.height);
        UIButton *btnSideMenu = [[UIButton alloc] initWithFrame:imgSideFrame];
        [btnSideMenu setBackgroundImage:imgSideMenu forState:UIControlStateNormal];
        [btnSideMenu addTarget:self
                        action:@selector(showRightMenuPressed:)
              forControlEvents:UIControlEventTouchUpInside];
        [btnSideMenu setShowsTouchWhenHighlighted:YES];
        
        UIImage* imgSelectDate = [UIImage imageNamed:@"selectDateIphone.png"];
        CGRect imgFrame = CGRectMake(0, 0, imgSelectDate.size.width, imgSelectDate.size.height);
        UIButton *btnSelectDate = [[UIButton alloc] initWithFrame:imgFrame];
        [btnSelectDate setBackgroundImage:imgSelectDate forState:UIControlStateNormal];
        [btnSelectDate addTarget:self
                            action:@selector(btnShowDateViewController:)
                  forControlEvents:UIControlEventTouchUpInside];
        [btnSelectDate setShowsTouchWhenHighlighted:YES];
        
        UIBarButtonItem *btnBarSideMenu =[[UIBarButtonItem alloc] initWithCustomView:btnSideMenu];
        UIBarButtonItem *btnBarRefresh =[[UIBarButtonItem alloc] initWithCustomView:btnSelectDate];
        
        [self.navigationItem setRightBarButtonItems:[NSArray arrayWithObjects:btnBarSideMenu,btnBarRefresh, nil]];
        
    }else
    {
        UIImage* imgSelectDate = [UIImage imageNamed:@"selectDateIphone.png"];
        CGRect imgFrame = CGRectMake(0, 0, imgSelectDate.size.width, imgSelectDate.size.height);
        UIButton *btnSelectDate = [[UIButton alloc] initWithFrame:imgFrame];
        [btnSelectDate setBackgroundImage:imgSelectDate forState:UIControlStateNormal];
        [btnSelectDate addTarget:self
                            action:@selector(btnShowDateViewController:)
                  forControlEvents:UIControlEventTouchUpInside];
        [btnSelectDate setShowsTouchWhenHighlighted:YES];
        
        UIBarButtonItem *btnBarRefresh =[[UIBarButtonItem alloc] initWithCustomView:btnSelectDate];
        
        [self.navigationItem setRightBarButtonItems:[NSArray arrayWithObjects:btnBarRefresh, nil]];
    }
    
    if (IS_IPHONE_5)
    {
        viewTblContainer.frame=CGRectMake(0, 98, 320, 362);
        viewlblPerson.frame=viewTblContainer.bounds;
        lblPerson.frame=viewlblPerson.bounds;
        tblPeopleCube.frame=viewTblContainer.bounds;
        viewlblTeams.frame=viewTblContainer.bounds;
        lblTeams.frame=viewlblTeams.bounds;
        tblTeamsCube.frame=viewTblContainer.bounds;
    
        lblPerson.frame=CGRectMake(6, 3, 158, 20);
        lblTeams.frame=CGRectMake(6, 3, 158, 20);
        
        viewlblPerson.frame=CGRectMake(0, 0, 320, 26);
        viewlblTeams.frame=CGRectMake(0, 175, 320, 26);
        
        tblTeamsCube.frame=CGRectMake(0, 208, 320, 155);
        tblPeopleCube.frame=CGRectMake(0,27, 320, 155);
      
        viewMostCubeSent.frame=CGRectMake(0, 454, 320, 26);
        viewlblSentPerson.frame=CGRectMake(0,478,320,26);
        
        [viewlblPerson addSubview:lblPerson];
        [viewlblTeams addSubview:lblTeams];
        [viewTblContainer addSubview:viewlblPerson];
        [viewTblContainer addSubview:tblPeopleCube];
        [viewTblContainer addSubview:viewlblTeams];
        [viewTblContainer addSubview:tblTeamsCube];
      
    }
    else
    {
        viewTblContainer.frame=CGRectMake(0, 98, 320, 272);
        viewlblPerson.frame=viewTblContainer.bounds;
        lblPerson.frame=viewlblPerson.bounds;
        tblPeopleCube.frame=viewTblContainer.bounds;
        viewlblTeams.frame=viewTblContainer.bounds;
        lblTeams.frame=viewlblTeams.bounds;
        tblTeamsCube.frame=viewTblContainer.bounds;
       
        lblPerson.frame=CGRectMake(6, 3, 158, 20);
        lblTeams.frame=CGRectMake(6, 3, 158, 20);
        
        viewlblPerson.frame=CGRectMake(0, 0, 320, 25);
        viewlblTeams.frame=CGRectMake(0, 132, 320, 25);
        
        tblPeopleCube.frame=CGRectMake(0, 23, 320, 110);
        tblTeamsCube.frame=CGRectMake(0, 158, 320, 110);
        
        viewMostCubeSent.frame=CGRectMake(0,368, 320, 25);
        viewlblSentPerson.frame=CGRectMake(0,392,320,25);
       
        [viewlblPerson addSubview:lblPerson];
        [viewlblTeams addSubview:lblTeams];
        [viewTblContainer addSubview:viewlblPerson];
        [viewTblContainer addSubview:tblPeopleCube];
        [viewTblContainer addSubview:viewlblTeams];
        [viewTblContainer addSubview:tblTeamsCube];
       
    }
    
   //Arya HUD
    HUD=[[AryaHUD alloc]init];
    [self.view addSubview:HUD];
    [HUD show];
    
    if ([ICUtils isConnectedToHost])
    {
        [HUD show];
        [self requestCubeOfTheWeek:nil];
        [self requestMostRcvCubesByPerson:nil];
        [self requestMostRcvCubesByTeam:nil];
    }
    else
    {   [HUD hide];
        [ICUtils showAlert:MESSAGE_NET_NOT_AVAILABLE delegate:self btnOk:@"Ok" btnCancel:nil];
    }
    
    //popover view
    popOverView = [[ICPopOverView alloc]init];
    popOverView.hidden = YES;
    [self.view addSubview:popOverView];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{

    if(isPopOver==YES)
    {
        isPopOver=NO;
        popOverView.hidden=YES;
    }
  
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    popOverView.hidden = YES;
}

#pragma mark - UITABLEVIEW DELEGATE DATASOURCE METHODS
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 37;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView==tblPeopleCube)
    {
        return arrMostRcvSentCubesByPerson.count;
    }
    else
    {
        return arrMostRcvSentCubesByTeam.count;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==tblPeopleCube)
    {
        NSString *cellIdentifier = @"peopleCube";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        ICMostCubesRcvSentDHolder *mostRcvSentCubesDHolder=[arrMostRcvSentCubesByPerson objectAtIndex:indexPath.row];
        
        if (!cell) {
            
            cell = [[UITableViewCell alloc]
                    initWithStyle:UITableViewCellStyleDefault
                    reuseIdentifier:cellIdentifier];
        }
        
        UIView *viewNumber = (UIView*)[cell.contentView viewWithTag:1];
        viewNumber.layer.cornerRadius=11.6;
        viewNumber.layer.masksToBounds=YES;
        
        UILabel *lblNumber=(UILabel*)[cell.contentView viewWithTag:4];
        
        rank=indexPath.row+1;
        lblNumber.text=[NSString stringWithFormat:@"%@",mostRcvSentCubesDHolder.strUserRank];
            
        //image for cube reciever
        UIImageView *imgVCubeReceiver = (UIImageView*)[cell.contentView viewWithTag:2];
        [imgVCubeReceiver removeFromSuperview];
        imgVCubeReceiver = nil;
        imgVCubeReceiver = [[UIImageView alloc]initWithFrame:CGRectMake(50,3,30,30)];
        imgVCubeReceiver.tag = 2;
        [cell.contentView addSubview:imgVCubeReceiver];
        [imgVCubeReceiver setImageWithUrl:[NSURL URLWithString:mostRcvSentCubesDHolder.strUserImageUrl]
                            andPlaceHoder:[UIImage imageNamed:NO_IMAGE_AVAILABLE]
                               andNoImage:[UIImage imageNamed:NO_IMAGE]];
        
        imgVCubeReceiver.layer.cornerRadius=2.0f;
        imgVCubeReceiver.layer.masksToBounds=YES;
        
        UILabel  *lblReceiverName=(UILabel*)[cell.contentView viewWithTag:3];
        lblReceiverName.text=[NSString stringWithFormat:@"%@ (%@)",mostRcvSentCubesDHolder.strUserName,mostRcvSentCubesDHolder.strUserCubeCount];
        
        return cell;

    }
    else
    {
       NSString *cellIdentifier = @"teamCube";
        
       UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
       ICMostCubesRcvSentDHolder *mostRcvSentCubesDHolder=[arrMostRcvSentCubesByTeam objectAtIndex:indexPath.row];
        
       if (!cell) {
            
            cell = [[UITableViewCell alloc]
                    initWithStyle:UITableViewCellStyleDefault
                    reuseIdentifier:cellIdentifier];
       }
        
       UIView *viewNumber = (UIView*)[cell.contentView viewWithTag:4];
       viewNumber.layer.cornerRadius=11.6;
       viewNumber.layer.masksToBounds=YES;
        
       UILabel *lblNumber=(UILabel*)[cell.contentView viewWithTag:5];
//       rank=indexPath.row+1;
       lblNumber.text=[NSString stringWithFormat:@"%@",mostRcvSentCubesDHolder.strUserRank];
        
        //image for cube reciever
        UIImageView *imgVTeam = (UIImageView*)[cell.contentView viewWithTag:2];
        [imgVTeam removeFromSuperview];
        imgVTeam = nil;
        imgVTeam = [[UIImageView alloc]initWithFrame:CGRectMake(50,3,30,30)];
        imgVTeam.tag = 2;
        [cell.contentView addSubview:imgVTeam];
        [imgVTeam setImageWithUrl:[NSURL URLWithString:mostRcvSentCubesDHolder.strTeamImageUrl]
                            andPlaceHoder:[UIImage imageNamed:NO_IMAGE_AVAILABLE]
                               andNoImage:[UIImage imageNamed:NO_IMAGE]];
        imgVTeam.layer.cornerRadius=2.0f;
        imgVTeam.layer.masksToBounds=YES;
        
        
        UILabel  *lblTeamName=(UILabel*)[cell.contentView viewWithTag:3];
        lblTeamName.text=[NSString stringWithFormat:@"%@ (%@)",mostRcvSentCubesDHolder.strTeamName,mostRcvSentCubesDHolder.strTeamCubeCount];
        
        return cell;

    }
    
}
#pragma mark - IB_ACTION
- (IBAction)showRightMenuPressed:(id)sender
{
    [self.menuContainerViewController toggleRightSideMenuCompletion:nil];
}
-(IBAction)btnMostCubeReceivedClicked:(id)sender
{
    popOverView.hidden=YES;
    viewlblTeams.hidden=NO;
    tblTeamsCube.hidden=NO;
    
    if (isDropReceive)
    {
        isDropReceive=NO;
        imgVReceivedDropDown.image=[UIImage imageNamed:@"drop_down.png"];
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.25];
       
        lblTeams.hidden=YES;
        lblPerson.hidden=YES;
        viewlblSentPerson.hidden=YES;
        
        [viewTblContainer setFrame:CGRectMake(0, 98, 320, 0)];
        [viewMostCubeSent setFrame:CGRectMake(0, 98, 320, 26)];
//        tblTeamsCube.frame=CGRectMake(0, 160, 320, 0);
        
        [UIView commitAnimations];
    }
    else
    {
        isDropReceive=YES;
        isDropSent=NO;
        
        lblTeams.hidden=NO;
        lblPerson.hidden=NO;
        viewlblSentPerson.hidden=NO;
        
        imgVReceivedDropDown.image=[UIImage imageNamed:@"drop_down1.png"];
        
        //api calling
//        [HUD show];
        [self requestMostRcvCubesByPerson:nil];
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.25];
        
        if (IS_IPHONE_5)
        {
            [viewTblContainer setFrame:CGRectMake(0, 98, 320, 362)];
            viewMostCubeSent.frame=CGRectMake(0, 450, 320, 25);
           
            tblTeamsCube.frame=CGRectMake(0, 205, 320, 155);
            tblPeopleCube.frame=CGRectMake(0,27, 320, 155);
            
            viewlblSentPerson.frame=CGRectMake(0,478,320,25);

        }
        else
        {
            [viewTblContainer setFrame:CGRectMake(0, 98, 320, 272)];
            [viewMostCubeSent setFrame:CGRectMake(0, 368, 320, 25)];
           
            tblTeamsCube.frame=CGRectMake(0, 160,320,110);
            tblPeopleCube.frame=CGRectMake(0,23,320,110);
        }
        
            [UIView commitAnimations];
            imgVSentDropDown.image=[UIImage imageNamed:@"drop_down.png"];
    }
}
-(IBAction)btnMostCubeSentClicked:(id)sender
{
    popOverView.hidden=YES;
    viewlblTeams.hidden=YES;
    tblTeamsCube.hidden=YES;
    
    if (isDropSent)
    {
        isDropSent=NO;
        imgVSentDropDown.image=[UIImage imageNamed:@"drop_down.png"];
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.25];
       
        lblTeams.hidden=YES;
        lblPerson.hidden=YES;
        
        [viewTblContainer setFrame:CGRectMake(0, 130, 320, 0)];
        [viewMostCubeSent setFrame:CGRectMake(0, 98, 320, 26)];
        [tblPeopleCube setFrame:CGRectMake(0,25,320,0)];
      
        [UIView commitAnimations];
    }
    else
    {
        isDropSent=YES;
        lblPerson.hidden=NO;
        viewlblSentPerson.hidden=YES;
        
        [self requestMostSentCubesByPerson:nil];
       
        imgVSentDropDown.image=[UIImage imageNamed:@"drop_down1.png"];
        
        if (isDropReceive)
        {
            isDropReceive=NO;
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:0.25];
            
            if (IS_IPHONE_5)
            {
                [viewMostCubeSent setFrame:CGRectMake(0, 98, 320, 26)];
                [viewTblContainer setFrame:CGRectMake(0, 127, 320, 362)];
                [tblPeopleCube setFrame:CGRectMake(0,30,320,333)];
            }
            else
            {
                [viewMostCubeSent setFrame:CGRectMake(0, 98, 320, 26)];
                [viewTblContainer setFrame:CGRectMake(0, 127, 320, 272)];
                [tblPeopleCube setFrame:CGRectMake(0,25,320,260)];
            }
           
            [UIView commitAnimations];
            imgVReceivedDropDown.image=[UIImage imageNamed:@"drop_down.png"];
        }
        else
        {
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:0.25];
            if (IS_IPHONE_5)
            {
                [viewTblContainer setFrame:CGRectMake(0, 127, 320, 362)];
                [tblPeopleCube setFrame:CGRectMake(0,30,320,333)];
            }
            else
            {
                [viewTblContainer setFrame:CGRectMake(0, 127, 320, 272)];
                [tblPeopleCube setFrame:CGRectMake(0,25,320,260)];
            }
            
               [UIView commitAnimations];
        }
    }
}

#pragma mark - API CALLING
-(void)requestCubeOfTheWeek:(NSMutableDictionary*)info
{
    if([ICUtils isConnectedToHost])
    {
        [HUD show];
        [[ICRestIntraction sharedManager] requestForCubeOfTheWeek:info];
    }
    else
    {
        [ICUtils showAlert:MESSAGE_NET_NOT_AVAILABLE delegate:self btnOk:@"Ok" btnCancel:nil];
    }
}
-(void)requestMostRcvCubesByPerson:(NSMutableDictionary*)info
{
    if([ICUtils isConnectedToHost])
    {
        [HUD show];
        [[ICRestIntraction sharedManager] requestForMostRcvCubesByPerson:info];
    }
    else
    {
        [ICUtils showAlert:MESSAGE_NET_NOT_AVAILABLE delegate:self btnOk:@"Ok" btnCancel:nil];
    }
}
-(void)requestMostSentCubesByPerson:(NSMutableDictionary*)info
{
    if([ICUtils isConnectedToHost])
    {
        [HUD show];
        [[ICRestIntraction sharedManager] requestForMostSentCubesByPerson:info];
    }
    else
    {
        [ICUtils showAlert:MESSAGE_NET_NOT_AVAILABLE delegate:self btnOk:@"Ok" btnCancel:nil];
    }
}
-(void)requestMostRcvCubesByTeam:(NSMutableDictionary*)info
{
    if([ICUtils isConnectedToHost])
    {
        [HUD show];
        [[ICRestIntraction sharedManager] requestForMostRcvCubesByTeam:info];
    }
    else
    {
        [ICUtils showAlert:MESSAGE_NET_NOT_AVAILABLE delegate:self btnOk:@"Ok" btnCancel:nil];
    }
}

# pragma mark - NSNotification Selector

-(void)getCubeOfTheWeekSuccess:(NSNotification*)notification{
    
    [HUD hide];
    cubeOfTheDHolder=(ICCubeOfTheWeekDHolder*)notification.object;
    
    if(cubeOfTheDHolder.strCubeImageUrl){
        imgVCube.hidden=NO;
        [imgVCube setImageWithUrl:[NSURL URLWithString:cubeOfTheDHolder.strCubeImageUrl]
                    andPlaceHoder:[UIImage imageNamed:NO_IMAGE_AVAILABLE]
                       andNoImage:[UIImage imageNamed:NO_IMAGE]];
        
        imgVCube.userInteractionEnabled=YES;
        UITapGestureRecognizer *tapped = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(cubeImageDidClicked:)];
        tapped.numberOfTapsRequired = 1;
        [imgVCube addGestureRecognizer:tapped];
    }else{
        imgVCube.hidden=YES;
        
    }
    if(cubeOfTheDHolder.strUserImageUrl){
    imgVUserOfWeek.hidden=NO;
    [imgVUserOfWeek setImageWithUrl:[NSURL URLWithString:cubeOfTheDHolder.strUserImageUrl]
                      andPlaceHoder:[UIImage imageNamed:NO_IMAGE_AVAILABLE]
                         andNoImage:[UIImage imageNamed:NO_IMAGE]];
    
    imgVUserOfWeek.userInteractionEnabled=YES;
    UITapGestureRecognizer *tappedUserImage = [[UITapGestureRecognizer alloc]
                                      initWithTarget:self
                                      action:@selector(userImageDidClicked:)];
    tappedUserImage.numberOfTapsRequired = 1;
    [imgVUserOfWeek addGestureRecognizer:tappedUserImage];
    
    }else{
        imgVUserOfWeek.hidden=YES;
    }
    
    imgVUserOfWeek.layer.cornerRadius=3;
    imgVUserOfWeek.layer.masksToBounds=YES;
        
}
-(void)getCubeOfTheWeekFailed:(NSNotification*)notification{
    
    [HUD hide];
}
-(void)getMostRcvCubesByPersonSuccess:(NSNotification*)notification{
    
    [HUD hide];
    arrMostRcvSentCubesByPerson=(NSMutableArray*)notification.object;
    [tblPeopleCube reloadData];
    rank=0;
}
-(void)getMostRcvCubesByPersonFailed:(NSNotification*)notification{
    
    [HUD hide];
}
-(void)getMostSentCubesByPersonSuccess:(NSNotification*)notification{
    
    [HUD hide];
    arrMostRcvSentCubesByPerson=(NSMutableArray*)notification.object;
    [tblPeopleCube reloadData];
}
-(void)getMostSentCubesByPersonFailed:(NSNotification*)notification{
    
    [HUD hide];
}
-(void)getMostRcvCubesByTeamSuccess:(NSNotification*)notification{
    
    [HUD hide];
    arrMostRcvSentCubesByTeam=(NSMutableArray*)notification.object;
    [tblTeamsCube reloadData];
        
}
-(void)getMostRcvCubesByTeamFailed:(NSNotification*)notification{
    
    [HUD hide];
}

#pragma mark - OTHER_METHOD

-(void)cubeImageDidClicked:(UITapGestureRecognizer*)sender{
    
    isPopOver=YES;
    
    popOverView.txtView.text=cubeOfTheDHolder.strCubeTitle;
    popOverView.txtView.frame=CGRectMake(208,66,80,18);
    popOverView.txtView.textAlignment=NSTextAlignmentCenter;
    popOverView.txtView.backgroundColor=[UIColor grayColor];
    popOverView.txtView.textColor=[UIColor whiteColor];
    popOverView.hidden = NO;
    
}
-(void)userImageDidClicked:(UITapGestureRecognizer*)sender{
    
    isPopOver=YES;
    
    popOverView.txtView.text=cubeOfTheDHolder.strUserName;
    popOverView.txtView.frame=CGRectMake(170,66,80,24);
    popOverView.txtView.textAlignment=NSTextAlignmentCenter;
    popOverView.txtView.backgroundColor=[UIColor grayColor];
    popOverView.txtView.textColor=[UIColor whiteColor];
    popOverView.hidden = NO;
    
}
-(IBAction)btnShowDateViewController:(id)sender
{
    ICDateSPickerViewController *controller = [[ICDateSPickerViewController alloc] init];
    controller.delegate = self;
    FPPopoverController *popover = [[FPPopoverController alloc] initWithViewController:controller];
    popover.contentSize = CGSizeMake(320,240);
    
    popover.border = NO;
    popover.tint = FPPopoverRedTint;
    popover.alpha = 1;
    
    if([loginDHolder.strUserType isEqual:@"General"]){
        
        [popover presentPopoverFromPoint:CGPointMake(262, 18)];
        
    }else{
        
        [popover presentPopoverFromPoint:CGPointMake(320, 18)];
    }
    
    
    //[popover setShadowsHidden:YES];
    popOver=popover;
}

-(void)removePopoverView
{
    [popOver dismissPopoverAnimated:YES];
}

-(void)selectDoneStartDate:(NSString *)startDate endDate:(NSString *)endDate
{
    [popOver dismissPopoverAnimated:YES];
    
    NSMutableDictionary *info=[NSMutableDictionary new];
    [info setObject:startDate forKey:@"start_date"];
    [info setObject:endDate forKey:@"end_date"];
    
    [HUD show];
    if(!isDropSent){
        
        [self requestCubeOfTheWeek:info];
        [self requestMostRcvCubesByPerson:info];
        [self requestMostRcvCubesByTeam:info];
    }else{
        [self requestMostSentCubesByPerson:info];
    }
    
    
}

@end
