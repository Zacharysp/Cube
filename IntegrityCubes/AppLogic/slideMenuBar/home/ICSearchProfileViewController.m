//
//  ICSearchProfileViewController.m
//  IntegrityCubes
//
//  Created by aditi on 30/04/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//

#import "ICSearchProfileViewController.h"
#import "ICHomeViewController.h"

@interface ICSearchProfileViewController ()

@end

@implementation ICSearchProfileViewController
@synthesize profileInfo,delegate;

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
    // Do any additional setup after loading the view.
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getPersonListSuccess:) name:NOTIFICATION_LIST_TEAM_EMPLOYEE_SUCCESS object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getPersonListFailed:) name:NOTIFICATION_LIST_TEAM_EMPLOYEE__FAILED object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getPersonProfileSuccess:) name:NOTIFICATION_SEARCH_OR_VIEW_PROFILE_SUCCESS object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getPersonProfileFailed:) name:NOTIFICATION_SEARCH_OR_VIEW_PROFILE_FAILED object:nil];
    
    tblPersonView.frame=CGRectMake(tblPersonView.frame.origin.x,tblPersonView.frame.origin.y, tblPersonView.frame.size.width, 0);
    
    txtVTeamDescription.hidden=YES;
    txtVTeamDescription.editable=NO;
    txtVTeamDescription.userInteractionEnabled=NO;
    [txtVTeamDescription setContentInset:UIEdgeInsetsMake(-5, 0, 5,0)];
    
    if(IS_IPHONE_5)
    {
        bgHudView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320,568)];
    }
    else
    {
        bgHudView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320,480)];
    }
    
    bgHudView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:bgHudView];
    
    HUD = [AryaHUD new];
    [bgHudView addSubview:HUD];
    [self.view addSubview:HUD];
    [HUD show];
    
    if(isProfileView==YES){
        
        searchPersonBar.hidden=NO;
        
    }else{
        
        searchPersonBar.hidden=YES;
    }
    
    viewBgProfile.layer.borderColor=[UIColor lightGrayColor].CGColor;
    viewBgProfile.layer.borderWidth=1;
    
    viewBgRecentCube.layer.borderColor=[UIColor lightGrayColor].CGColor;
    viewBgRecentCube.layer.borderWidth=1;
    
    btnCubeReceived.layer.cornerRadius=3;
    btnCubeSent.layer.cornerRadius=3;
    
    viewBgProfileDetail.hidden=YES;
    
    if (IS_IPHONE_5)
    {
        if(isProfileView==YES)
        {
            lblRecentCube.frame=CGRectMake(5, 260, 310, 25);
            
            viewBgProfile.frame=CGRectMake(5, 80, 310, 170);
            viewBgRecentCube.frame=CGRectMake(5, 285, 310, 190);
            
            viewBgProfile.hidden=YES;
            viewBgRecentCube.hidden=YES;
            lblRecentCube.hidden=YES;
            lblProfile.hidden=YES;
            
            //api calling
            [self requestPersonList];

        }else{
            
            [HUD show];
            [self requestPersonProfileDetail:profileInfo];
            
            searchType=[profileInfo valueForKey:@"searchType"];
            
            if([searchType isEqualToString:@"t"])
            {
                btnCubeSent.hidden=YES;
                txtVTeamDescription.hidden=NO;
            }
            
            lblProfile.frame=CGRectMake(5, 10, 310, 40);
            lblRecentCube.frame=CGRectMake(5, 240, 310, 40);
            
            viewBgProfile.frame=CGRectMake(5, 55, 310, 170);
            viewBgRecentCube.frame=CGRectMake(5, 285, 310, 190);
         
        }

        btnCubeReceived.frame=CGRectMake(6, 5, 144, 85);
        lblCubeReceivedCount.frame=CGRectMake(6, 5, 144, 50);
        lblCubeReceived.frame=CGRectMake(6, 55, 144, 35);
        
        btnCubeSent.frame=CGRectMake(160, 5, 144, 85);
        lblCubeSentCount.frame=CGRectMake(160, 5, 144, 50);
        lblCubeSent.frame=CGRectMake(160, 55, 144, 35);
        
        scrollView.frame=CGRectMake(6, 100, 298, 80);
        
        
    }else{
        
        if(isProfileView==YES){
            
            lblRecentCube.frame=CGRectMake(5, 230, 310, 25);
            
            viewBgProfile.frame=CGRectMake(5, 80, 310, 145);
            viewBgRecentCube.frame=CGRectMake(5, 255, 310, 155);
            
            viewBgProfile.hidden=YES;
            viewBgRecentCube.hidden=YES;
            lblRecentCube.hidden=YES;
            lblProfile.hidden=YES;
            
            //api calling
            [self requestPersonList];
            
        }else{
            
            [HUD show];
            [self requestPersonProfileDetail:profileInfo];
            
            searchType = [profileInfo valueForKey:@"searchType"];
            
            if([searchType isEqualToString:@"t"]){
                
                btnCubeSent.hidden=YES;
                txtVTeamDescription.hidden=NO;
                
            }
            
            lblProfile.frame=CGRectMake(5, 10, 310, 40);
            lblRecentCube.frame=CGRectMake(5, 210, 310, 40);
            
            viewBgProfile.frame=CGRectMake(5, 55, 310, 145);
            viewBgRecentCube.frame=CGRectMake(5, 255, 310, 155);
            
        }
        
        btnCubeReceived.frame=CGRectMake(6, 5, 144, 60);
        lblCubeReceivedCount.frame=CGRectMake(6, 5, 144, 40);
        lblCubeReceived.frame=CGRectMake(6, 40, 144, 20);
        
        btnCubeSent.frame=CGRectMake(160, 5, 144, 60);
        lblCubeSentCount.frame=CGRectMake(160, 5, 144, 40);
        lblCubeSent.frame=CGRectMake(160, 40, 144, 20);

        scrollView.frame=CGRectMake(6, 70, 298, 80);
        
    }
    
    tblPersonView.layer.borderColor=[UIColor colorWithRed:193.0/255 green:0 blue:33.0/255 alpha:1].CGColor;
    tblPersonView.layer.borderWidth=0.5f;
    
    btnSendCube.layer.cornerRadius = 3.0f;
    btnSendCube.layer.masksToBounds = YES;
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    tblPersonView.frame=CGRectMake(tblPersonView.frame.origin.x,tblPersonView.frame.origin.y, tblPersonView.frame.size.width, 0);
    
    [searchPersonBar resignFirstResponder];
}

#pragma mark - IB_ACTIONS

-(IBAction)btnCubeReceivedDidClicked:(id)sender{
    
    isReceivedCube=YES;
         
    if(IS_IPHONE_5){
        
        btnCubeReceived.frame=CGRectMake(6, 5, 144, 100);
        btnCubeSent.frame=CGRectMake(160, 5, 144, 85);
        
    }else{
        
        btnCubeReceived.frame=CGRectMake(6, 5, 144, 70);
        btnCubeSent.frame=CGRectMake(160, 5, 144, 60);
        
    }
    
    [btnCubeReceived setBackgroundColor:[UIColor blackColor]];
    [btnCubeSent setBackgroundColor:[UIColor lightGrayColor]];
    
    int scrollWidth = 80;
    int xOffset = 0;
    
    arrCubeScroll = [[NSMutableArray alloc]init];
    ICCubeRecentHolder *receiveCubeDHolder;
    
    for(UIView *subview in [scrollView subviews])
    {
        [subview removeFromSuperview];
    }
    
    if(arrCubeReceived.count==0){
        
        UILabel *lbl=[[UILabel alloc]initWithFrame:scrollView.bounds];
        lbl.frame=CGRectMake(85, 25, 150, 30);
        [lbl setFont:[UIFont fontWithName:@"Times New Roman" size:14]];
        lbl.text=@"Cubes are not available.";
        lbl.textColor=[UIColor whiteColor];
        [scrollView addSubview:lbl];
        
    }
    else
    {
        for(int index=0; index < [arrCubeReceived count]; index++)
        {
            ICCubeImageView *imgView = [[ICCubeImageView alloc] init];
            imgView.bounds = CGRectMake(6,10,68,68);
            imgView.frame = CGRectMake(6+xOffset,6,68,68);
            receiveCubeDHolder=[arrCubeReceived objectAtIndex:index];

            [imgView setImageWithUrl:[NSURL URLWithString:receiveCubeDHolder.strCubeReceivedImageUrl]
                       andPlaceHoder:[UIImage imageNamed:NO_IMAGE_AVAILABLE]
                          andNoImage:[UIImage imageNamed:NO_IMAGE]];
            
           imgView.userInteractionEnabled=YES;
            
           imgView.imageIndex=index;
            UITapGestureRecognizer *tapped = [[UITapGestureRecognizer alloc]
                                              initWithTarget:self
                                              action:@selector(scrollCubeImageDidClicked:)];
            tapped.numberOfTapsRequired = 1;
            [imgView addGestureRecognizer:tapped];
            
    //        imgView.image = [UIImage imageNamed:[arrCubeReceived objectAtIndex:index]];
            [arrCubeScroll insertObject:imgView atIndex:index];
            scrollView.contentSize = CGSizeMake(scrollWidth+xOffset,73);
            [scrollView addSubview:[arrCubeScroll objectAtIndex:index]];
            
            xOffset+=73;
        }
    }
}
-(IBAction)btnCubeSentDidClicked:(id)sender{
    
    isReceivedCube=NO;
    
    if(IS_IPHONE_5){
        
        btnCubeReceived.frame=CGRectMake(6, 5, 144, 85);
        btnCubeSent.frame=CGRectMake(160, 5, 144, 100);
        
    }else{
        
        btnCubeReceived.frame=CGRectMake(6, 5, 144, 60);
        btnCubeSent.frame=CGRectMake(160, 5, 144, 70);
    }
    
    [btnCubeReceived setBackgroundColor:[UIColor lightGrayColor]];
    [btnCubeSent setBackgroundColor:[UIColor blackColor]];
    
    int scrollWidth = 80;
    int xOffset = 0;
    
    arrCubeScroll = [[NSMutableArray alloc]init];
    ICCubeRecentHolder *sentCubeDHolder;
    
    for(UIView *subview in [scrollView subviews])
    {
        [subview removeFromSuperview];
    }
    
    if (arrCubeSent.count==0)
    {
        UILabel *lbl=[[UILabel alloc]initWithFrame:scrollView.bounds];
        lbl.frame=CGRectMake(85, 25, 150, 30);
        [lbl setFont:[UIFont fontWithName:@"Times New Roman" size:14]];
        lbl.text=@"Cubes are not available.";
        lbl.textColor=[UIColor whiteColor];
        [scrollView addSubview:lbl];
    }
    else
    {
        for(int index=0; index < [arrCubeSent count]; index++)
        {
            ICCubeImageView *imgView = [[ICCubeImageView alloc] init];
            imgView.bounds = CGRectMake(6,10,68,68);
            imgView.frame = CGRectMake(6+xOffset,6,68,68);
            sentCubeDHolder=[arrCubeSent objectAtIndex:index];
            
            [imgView setImageWithUrl:[NSURL URLWithString:sentCubeDHolder.strCubeSentImageUrl]
                       andPlaceHoder:[UIImage imageNamed:NO_IMAGE_AVAILABLE]
                          andNoImage:[UIImage imageNamed:NO_IMAGE]];
            
            imgView.userInteractionEnabled=YES;
            
            imgView.imageIndex=index;
            UITapGestureRecognizer *tapped = [[UITapGestureRecognizer alloc]
                                              initWithTarget:self
                                              action:@selector(scrollCubeImageDidClicked:)];
            tapped.numberOfTapsRequired = 1;
            [imgView addGestureRecognizer:tapped];
            
        //        imgView.image = [UIImage imageNamed:[arrCubeSent objectAtIndex:index]];
            [arrCubeScroll insertObject:imgView atIndex:index];
            scrollView.contentSize = CGSizeMake(scrollWidth+xOffset,73);
            [scrollView addSubview:[arrCubeScroll objectAtIndex:index]];
            
            xOffset+=73;
        }
    }
}
-(IBAction)btnSendCubeDidClicked:(id)sender{
    
     if (!homeViewController) {
            homeViewController  = [self.storyboard instantiateViewControllerWithIdentifier:@"homeViewController"];
     }
    
     UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
     NSArray *controllers = [NSArray arrayWithObject:homeViewController];
     navigationController.viewControllers = controllers;
     
     self.delegate = homeViewController;
     [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
    [self.delegate sendCubeDetail:profileDetailDHolder :teamDetailDHolder];
}
#pragma mark - UITABLEVIEW DELEGATE AND DATASOURCE METHODS

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrSearchPersonList.count;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
  
    return 35;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier =@"cellPersonList";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
        if (!cell) {
            
            cell = [[UITableViewCell alloc]
                    initWithStyle:UITableViewCellStyleDefault
                    reuseIdentifier:cellIdentifier];
        }
    cell.backgroundColor=[UIColor whiteColor];
   
    ICTeamOrPersonListHolder *personListDHolder;
    personListDHolder = (ICTeamOrPersonListHolder*)[arrSearchPersonList objectAtIndex:indexPath.row];
    
    UILabel *lblPersonName=(UILabel*)[cell.contentView viewWithTag:2];
    UIImageView *imgPerson=(UIImageView*)[cell.contentView viewWithTag:1];
    
    lblPersonName.text=[NSString stringWithFormat:@"%@ %@",personListDHolder.strPersonFirstName,personListDHolder.strPersonLastName];
    
    [imgPerson removeFromSuperview];
    imgPerson = nil;
    imgPerson = [[ICCubeImageView alloc]initWithFrame:CGRectMake(10,4,25,25)];
    imgPerson.tag = 1;
    [cell.contentView addSubview:imgPerson];
    
    [imgPerson setImageWithUrl:[NSURL URLWithString:personListDHolder.strPersonImageUrl]
                andPlaceHoder:[UIImage imageNamed:NO_IMAGE_AVAILABLE]
                   andNoImage:[UIImage imageNamed:NO_IMAGE]];
    
    
   return cell;
 
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(tableView==tblPersonView)
    {
        [searchPersonBar resignFirstResponder];
        
        if (arrSearchPersonList.count>0)
        {
            ICTeamOrPersonListHolder * personDHolder=[arrSearchPersonList objectAtIndex:indexPath.row];
            searchPersonBar.text=[NSString stringWithFormat:@"%@ %@",personDHolder.strPersonFirstName,personDHolder  .strPersonLastName];
            tblPersonView.frame=CGRectMake(tblPersonView.frame.origin.x,tblPersonView.frame.origin.y, tblPersonView.frame.size.width, 0);
            
          //api calling
          [HUD show];
          NSMutableDictionary *info=[[NSMutableDictionary alloc]init];
          searchType=personDHolder.strRecordType;
            
          [info setValue:personDHolder.strPersonUserId forKey:@"searchId"];
          [info setValue:personDHolder.strRecordType forKey:@"searchType"];
          [self requestPersonProfileDetail:info];
            
        }
    }
}

#pragma mark - UISEARCHBAR DELEGATE MATHODS

-(void)searchViewShouldBeginEditing:(UISearchBar *)searchBar
{
    
    
}

-(void)searchViewShouldSearchButtonClick:(UISearchBar *)searchBar searchText:(NSString *)searchText
{
    if (![searchBar.text isEqualToString:currentSearchText])
    {
        if(searchText.length == 0)
        {
            dispatch_async(dispatch_get_main_queue(), ^
                   {
                       tblPersonView.frame=CGRectMake(tblPersonView.frame.origin.x,tblPersonView.frame.origin.y, tblPersonView.frame.size.width, 0);
                       
                   });
            
            
            [searchPersonBar resignFirstResponder];
        }
        else
        {
            arrSearchPersonList=[[NSMutableArray alloc]init];
            [arrSearchPersonList removeAllObjects];
            
            for (ICTeamOrPersonListHolder *personDHolder in arrPersonList)
            {
                NSString *strPersonName;
                strPersonName =[NSString stringWithFormat:@"%@ %@",personDHolder.strPersonFirstName,personDHolder.strPersonLastName];
                NSRange personRange=[strPersonName rangeOfString:searchText options:NSCaseInsensitiveSearch];
                
                if(personRange.location !=NSNotFound)
                {
                    [arrSearchPersonList addObject:personDHolder];
                    
                }
            }
        }
        
        dispatch_async(dispatch_get_main_queue(), ^
              {
                 [tblPersonView reloadData];
                   if(arrSearchPersonList.count>10){
                       
                           if(IS_IPHONE_5){
                               
                               tblPersonView.frame=CGRectMake(5,48,310,452);
                           }
                           else{
                               
                               tblPersonView.frame=CGRectMake(5,48,310,350);
                           }
                   }
                   else{
                       
                      tblPersonView.frame=CGRectMake(5,48,310, arrSearchPersonList.count*35);
                   }
            });
      }
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    [self searchViewShouldBeginEditing:searchBar];
    
    for(id subview in [searchBar subviews])
    {
        if ([subview isKindOfClass:[UIButton class]]) {
            
            [subview setEnabled:YES];
            
        }
    }
    return YES;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if(searchPersonBar.text.length == 0)
    {
        [searchPersonBar resignFirstResponder];
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [arrSearchPersonList removeAllObjects];
                           tblPersonView.frame=CGRectMake(tblPersonView.frame.origin.x,tblPersonView.frame.origin.y, tblPersonView.frame.size.width, 0);
                           [tblPersonView reloadData];
                           
                       });
    }
    
    [self searchViewShouldSearchButtonClick:searchBar searchText:searchBar.text];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar
{
    [self.searchDisplayController.searchBar setText:@""];
    dispatch_async(dispatch_get_main_queue(), ^
                   {
                       [tblPersonView reloadData];
                       
                   });
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchPersonBar resignFirstResponder];
    
}

#pragma mark - CUBE SCROLL_VIEW ACTION

-(void)scrollCubeImageDidClicked:(UITapGestureRecognizer*)sender{
    
    ICCubeImageView    *imgCube = (ICCubeImageView*)sender.view;
    ICCubeRecentHolder *cubeRecentDHolder;
    
    if(isReceivedCube){
    
        cubeRecentDHolder =[arrCubeReceived objectAtIndex:imgCube.imageIndex];
//        cubeRecentDHolder.strCubeReceiverName=profileDetailDHolder.strUserName;
        if([searchType isEqualToString:@"t"]){
            
            cubeRecentDHolder.imgCubeReceiver=teamDetailDHolder.strTeamImageUrl;
            
        }else{
             cubeRecentDHolder.imgCubeReceiver=profileDetailDHolder.strUserImageUrl;
        }
        
    }else{
        
        cubeRecentDHolder =[arrCubeSent objectAtIndex:imgCube.imageIndex];
//        cubeRecentDHolder.strCubeSenderName=profileDetailDHolder.strUserName;
        if([searchType isEqualToString:@"t"]){
        
             cubeRecentDHolder.imgCubeSender=teamDetailDHolder.strTeamImageUrl;
            
        }else{
            
            cubeRecentDHolder.imgCubeSender=profileDetailDHolder.strUserImageUrl;
        }
    }
    CGPoint location= [sender locationInView:self.view];
    
    ICPopOverViewController *popOverController= [[ICPopOverViewController alloc] init];
    popOverController.cubeRecentDetailDHolder=cubeRecentDHolder;
    FPPopoverController *popover = [[FPPopoverController alloc] initWithViewController:popOverController];
    
    if(cubeRecentDHolder.strCubeComment.length<101){

        popover.contentSize = CGSizeMake(170,158);

    }else{
        
        popover.contentSize = CGSizeMake(170,185);
    }
    
    popover.arrowDirection=FPPopoverArrowDirectionDown;
    popover.border = NO;
    popover.tint = FPPopoverLightGrayTint;
    popover.alpha = 1;
    popOver=popover;
    
    if(IS_IPHONE_5){
        
        [popOver presentPopoverFromPoint:CGPointMake(location.x, 480)];
        
    }else{
        
        [popOver presentPopoverFromPoint:CGPointMake(location.x, 410)];
    }
}
-(void)profileDetail{
    
if([searchType isEqualToString:@"u"])
{
    [imgUserProfile setImageWithUrl:[NSURL URLWithString:profileDetailDHolder.strUserImageUrl]
                      andPlaceHoder:[UIImage imageNamed:NO_IMAGE_AVAILABLE]
                         andNoImage:[UIImage imageNamed:NO_IMAGE]];
    
    lblUserName.text = profileDetailDHolder.strUserName;
    lbluserJobTitle.text = profileDetailDHolder.strJobTitle;
    lblEmail.text = profileDetailDHolder.strEmail;
    lblPhone.text = profileDetailDHolder.strPhone;
    lblState.text = [NSString stringWithFormat:@"%@, %@",profileDetailDHolder.strCity,profileDetailDHolder.strState];
    
    for (int i=0; i<profileDetailDHolder.arrTeamId.count; i++)
    {
        NSString *strTeamName=[[profileDetailDHolder.arrTeamId valueForKey:@"team_name"]objectAtIndex:i];
        if (i==0)
        {
            lblTeams.text=strTeamName;
        }
        else
        {
            lblTeams.text=[lblTeams.text stringByAppendingString:[NSString stringWithFormat:@",%@",strTeamName]];
        }
    }
    
    viewBgProfileDetail.hidden=NO;
    
}else{
        
        [imgUserProfile setImageWithUrl:[NSURL URLWithString:teamDetailDHolder.strTeamImageUrl]
                          andPlaceHoder:[UIImage imageNamed:NO_IMAGE_AVAILABLE]
                             andNoImage:[UIImage imageNamed:NO_IMAGE]];
        
        lblUserName.text=teamDetailDHolder.strTeamName;
        txtVTeamDescription.text=teamDetailDHolder.strTeamDescription;
      }
}
# pragma mark - API CAllING

-(void)requestPersonList
{
    if([ICUtils isConnectedToHost])
    {
        [[ICRestIntraction sharedManager] requestForListTeamOrEmployee];
    }
    else
    {
        [HUD hide];
//        [bgHudView removeFromSuperview];
        [ICUtils showAlert:MESSAGE_NET_NOT_AVAILABLE delegate:self btnOk:@"Ok" btnCancel:nil];
    }
}

-(void)requestPersonProfileDetail:(NSMutableDictionary *)info{
    
    if([ICUtils isConnectedToHost])
    {
        [[ICRestIntraction sharedManager]requestForSearchOrViewProfile:info];
    }
    else
    {
        [HUD hide];
//        [bgHudView removeFromSuperview];
        [ICUtils showAlert:MESSAGE_NET_NOT_AVAILABLE delegate:self btnOk:@"Ok" btnCancel:nil];
    }
    
}
# pragma mark - NSNotification Selector

-(void)getPersonListSuccess:(NSNotification *)notification
{
    [HUD hide];
    [bgHudView removeFromSuperview];
    NSMutableDictionary *dictRecentCubeRcvSent;
    
    dictRecentCubeRcvSent = (NSMutableDictionary*)notification.object;
    arrPersonList = [dictRecentCubeRcvSent valueForKey:@"personList"];
    
}

-(void)getPersonListFailed:(NSNotification *)notification
{
    [HUD hide];
    [bgHudView removeFromSuperview];
}

-(void)getPersonProfileSuccess:(NSNotification *)notification
{
    [HUD hide];
    [bgHudView removeFromSuperview];
    
    NSMutableDictionary  *dictProfileDetail=(NSMutableDictionary*)notification.object;
    
    arrCubeReceived = [dictProfileDetail valueForKey:@"receivedCubeData"];
    arrCubeSent = [dictProfileDetail valueForKey:@"sentCubeData"];
    profileDetailDHolder = [dictProfileDetail valueForKey:@"profileData"];
    teamDetailDHolder = [dictProfileDetail valueForKey:@"teamData"];
    
    ICCubeRecentHolder *recentDH;
    
    if (arrCubeReceived.count>0) {
        recentDH = [arrCubeReceived objectAtIndex:0];
        lblCubeReceivedCount.text=[NSString stringWithFormat:@"%lu",(long)[recentDH.strCubeReceived integerValue]];
        lblCubeReceived.text = @"Cubes received";
        
    }else
    {
        lblCubeReceivedCount.text=@"0";
        lblCubeReceived.text = @"Cube received";
    }
    
    if (arrCubeSent.count>0)
    {
        recentDH = [arrCubeSent objectAtIndex:0];
        lblCubeSentCount.text=[NSString stringWithFormat:@"%lu",(long)[recentDH.strCubeSent integerValue]];
        lblCubeSent.text=@"Cubes sent";
    }
    else
    {
        lblCubeSentCount.text=@"0";
        lblCubeSent.text=@"Cube sent";
    }
    
    viewBgProfile.hidden=NO;
    viewBgRecentCube.hidden=NO;
    lblRecentCube.hidden=NO;
    lblProfile.hidden=NO;
    
    if (profileDetailDHolder.icUserId == loginDHolder.icUserId) {
        btnSendCube.hidden = YES;
    }
    
    [self profileDetail];
    [self performSelector:@selector(btnCubeReceivedDidClicked:) withObject:nil];
    
}

-(void)getPersonProfileFailed:(NSNotification *)notification
{
    [HUD hide];
    [bgHudView removeFromSuperview];
}

@end
