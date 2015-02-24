//
//  ICHomeViewController.m
//  IntegrityCubes
//
//  Created by aditi on 18/03/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//

#import "ICHomeViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ICHomeViewController ()
@property (nonatomic, strong) NSMutableDictionary *imageDownloadsInProgress;
@end

@implementation ICHomeViewController
@synthesize indicatorStyle,delegate;

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
    
    homeViewController =  self;
    
    arrCubeFeedList = [[NSMutableArray alloc]init];
    arrSearchStaffTeam = [[NSMutableArray alloc]init];
    arrCubeList = [[NSMutableArray alloc]init];
    arrTeamOrPersonList = [[NSMutableArray alloc]init];
    arrSearchPersonData = [[NSMutableArray alloc]init];
    arrSearchTeamData = [[NSMutableArray alloc]init];
    arrPersonList = [[NSMutableArray alloc] init];
    [arrPersonList addObject:@"123"];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getCubeListSuccess:) name:NOTIFICATION_LIST_CUBE_SUCCESS object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getCubeListFailed:) name:NOTIFICATION_LIST_CUBE_FAILED object:nil];
   
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getCubeFeedCommentListSuccess:) name:NOTIFICATION_CUBE_FEED_LIST_SUCCESS object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getCubeFeedCommentListFail:) name:NOTIFICATION_CUBE_FEED_LIST_FAILED object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getSearchCubeFeedListSuccess:) name:NOTIFICATION_SEARCH_CUBE_FEED_LIST_SUCCESS object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getSearchCubeFeedListFail:) name:NOTIFICATION_SEARCH_CUBE_FEED_LIST_FAILED object:nil];
  
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getTeamOrEmpListSuccess:) name:NOTIFICATION_LIST_TEAM_EMPLOYEE_SUCCESS object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getTeamOrEmpListFailed:) name:NOTIFICATION_LIST_TEAM_EMPLOYEE__FAILED object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(cubePostSuccess:) name:NOTIFICATION_CUBE_POST_SUCCESS object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(cubePostFailed:) name:NOTIFICATION_CUBE_POST_FAILED object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(cubeFeedPostCommentSuccess:) name:NOTIFICATION_CUBE_FEED_POST_COMMENT_SUCCESS object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(cubeFeedPostCommentFailed:) name:NOTIFICATION_CUBE_FEED_POST_COMMENT_FAILED object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(cubeFeedPostLikeSuccess:) name:NOTIFICATION_CUBE_FEED_POST_LIKE_SUCCESS object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(cubeFeedPostLikeFailed:) name:NOTIFICATION_CUBE_FEED_POST_LIKE_FAILED object:nil];
    
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(cubeFeedRowDeleteSuccess:) name:NOTIFICATION_DELETE_CUBE_FEED_SUCCESS object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(updateCubeFeedUpdateSuccess:) name:NOTIFICATION_DELETE_COMMENT_SUCCESS object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(updateNotificationLabel:) name:NOTIFICATION_PUSH_NTCS_SUCCESS object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(updateNotificationSuccess:) name:NOTIFICATION_NTCS_API_SUCCESS object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(updateNotificationFailed:) name:NOTIFICATION_NTCS_API_FAILED object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(cubeFeedDeleted:) name:NOTIFICATION_CUBE_FEED_DELETED object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(cubeCommentDeleted:) name:NOTIFICATION_CUBE_COMMENT_DELETED object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(cubeFeedDeleteSuccess:) name:NOTIFICATION_DELETE_CUBE_FEED_SUCCESS object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(cubeFeedDeleteFailed:) name:NOTIFICATION_DELETE_CUBE_FEED_FAILED object:nil];
    
    btnCubeAward.layer.cornerRadius = 8.0f;
    btnCubeAward.layer.borderColor = [UIColor blackColor].CGColor;
    btnCubeAward.layer.borderWidth = 0.5;
    btnCubeAward.layer.masksToBounds = YES;
    
    btnAddToList.layer.cornerRadius = 8.0f;
    btnAddToList.layer.borderColor = [UIColor blackColor].CGColor;
    btnAddToList.layer.borderWidth = 0.5;
    btnAddToList.layer.masksToBounds = YES;
    
    imgVCube.layer.cornerRadius = 8.0f;
    imgVCube.layer.masksToBounds = YES;

    btnCubeSubmit.layer.cornerRadius = 3.0f;
    btnCubeSubmit.layer.masksToBounds = YES;
    
    txtCubeComment.layer.cornerRadius = 3.0f;
    txtCubeComment.layer.masksToBounds = YES;
    
    //navigation bar
    UIImage* imgSideMenu = [UIImage imageNamed:@"menu-icon.png"];
    CGRect imgSideFrame = CGRectMake(0, 0, imgSideMenu.size.width, imgSideMenu.size.height);
    UIButton *btnSideMenu = [[UIButton alloc] initWithFrame:imgSideFrame];
    [btnSideMenu setBackgroundImage:imgSideMenu forState:UIControlStateNormal];
    [btnSideMenu addTarget:self
                    action:@selector(showRightMenuPressed:)
          forControlEvents:UIControlEventTouchUpInside];
    [btnSideMenu setShowsTouchWhenHighlighted:YES];
    
    UIImage* imgNotification = [UIImage imageNamed:@"bell.png"];
    CGRect imgFrame = CGRectMake(0, 0, imgNotification.size.width, imgNotification.size.height);
    UIButton *btnNotification = [[UIButton alloc] initWithFrame:imgFrame];
    [btnNotification setBackgroundImage:imgNotification forState:UIControlStateNormal];
    [btnNotification addTarget:self
                        action:@selector(refreshHomeViewController:)
              forControlEvents:UIControlEventTouchUpInside];
    [btnNotification setShowsTouchWhenHighlighted:YES];
    
    viewNotification=[[ICNotificationView alloc]initWithFrame:CGRectMake(8, -11, 18, 18)];
    viewNotification.lblNOtification= [[UILabel alloc]initWithFrame:viewNotification.bounds];
    viewNotification.lblNOtification.frame=CGRectMake(1.5, 1.0, 15, 15);
    viewNotification.lblNOtification.textColor=[UIColor whiteColor];
    [viewNotification.lblNOtification setFont:[UIFont systemFontOfSize:12]];
    viewNotification.lblNOtification.text=@"1";
    viewNotification.lblNOtification.adjustsFontSizeToFitWidth = YES;
    viewNotification.lblNOtification.textAlignment=NSTextAlignmentCenter;
    [viewNotification addSubview:viewNotification.lblNOtification];
    [btnNotification addSubview:viewNotification];
    UIBarButtonItem *btnBarSideMenu =[[UIBarButtonItem alloc] initWithCustomView:btnSideMenu];
    UIBarButtonItem *btnBarRefresh =[[UIBarButtonItem alloc] initWithCustomView:btnNotification];
    
    [self.navigationItem setRightBarButtonItems:[NSArray arrayWithObjects:btnBarSideMenu,btnBarRefresh, nil]];
    
    //tableView cubeFeed
    if (IS_IPHONE_5)
    {
        tblCubeComments = [[UITableView alloc]initWithFrame:CGRectMake(6, 150, 308, 352)];
    }
    else
    {
        tblCubeComments = [[UITableView alloc]initWithFrame:CGRectMake(6, 150, 308, 266)];
    }
    tblCubeComments.delegate=self;
    tblCubeComments.dataSource=self;
    [self.view addSubview:tblCubeComments];
    
    //table cubeList images
    viewTbleCube = [[UIView alloc]initWithFrame:CGRectMake(0, 2, 310, 0)];
    
    btnCancel = [[UIButton alloc]initWithFrame:viewTbleCube.bounds];
    btnCancel.frame=CGRectMake(288, -1, 32, 0);
    [btnCancel setImage:[UIImage imageNamed:@"close.png"] forState:UIControlStateNormal];
    
    [btnCancel addTarget:self
               action:@selector(closeTableCube:)
               forControlEvents:UIControlEventTouchUpInside];

    tblCubeAward = [[UITableView alloc]initWithFrame:viewTbleCube.bounds];
    tblCubeAward.frame=CGRectMake(5, 5, 310, 0);
    
    tblCubeAward.delegate=self;
    tblCubeAward.dataSource=self;
    viewTbleCube.autoresizesSubviews = YES;
    tblCubeAward.showsVerticalScrollIndicator = YES;
    
    [viewTbleCube addSubview:tblCubeAward];
    [viewTbleCube addSubview:btnCancel];
    [self.view addSubview:viewTbleCube];
    
    //BOOL Value assign
    isTopToBottom = YES;
    isCommentAppear = YES;
    imgVCube.hidden = YES;
  
    //set searchBar frame
    UIView *view=[searchTeamOrPerson.subviews objectAtIndex:0];
    [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, 30)];
    view.layer.cornerRadius=5.0;
    
    [txtCubeComment setText:MESSAGE_WRITE_MESSAGE];

    [searchTeamOrPerson resetLayout];
    pullToRefreshManager_ = [[MNMBottomPullToRefreshManager alloc] initWithPullToRefreshViewHeight:60.0f tableView:tblCubeComments withClient:self];
    
    //AryaHud
    HUD = [AryaHUD new];
    [HUD setHUDText:@"Loading..."];
    [self.view addSubview:HUD];
    
   tblSearchTeamOrPerson.frame=CGRectMake(0, 0, 0, 0);
   tblSearchTeamOrPerson.backgroundColor = [UIColor colorWithRed:45.0/255.0 green:41.0/255 blue:37.0/255 alpha:1];
    
    [self.view addSubview:tblSearchTeamOrPerson];
    
    //ICPopOver View
    popOverView = [[ICPopOverView alloc]init];
    popOverView.hidden = YES;
    [self.view addSubview:popOverView];
    
    //ICPopOver View
    popOverTextView = [[ICPopOverView alloc]init];
    popOverTextView.hidden = YES;
    [self.view addSubview:popOverTextView];
    
    //tableView Pull To Refresh
    refreshControl = [UIRefreshControl new];
    refreshControl.tintColor = [UIColor blackColor];
    refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"Pull to Refresh"];
    [refreshControl addTarget:self action:@selector(refreshCubeFeedTable:)
             forControlEvents:UIControlEventValueChanged];
    [tblCubeComments addSubview:refreshControl];
    
    viewNotification.hidden = YES;
    lblPickCube.hidden = YES;
    isPulledToRefresh = YES;
    
    //check for reachability change
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(reachabilityHomeStatusChange:)
                                                name:kReachabilityChangedNotification
                                                  object:nil];
    tblCubeComments.tableFooterView = [UIView new];
    tblCubeAward.tableFooterView = [UIView new];
    
//    self.view.backgroundColor = [ICUtils orangeColor];
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [searchTeamOrPerson resetLayout];
    [tblCubeAward flashScrollIndicators];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)refreshCubeFeedTable:(id)sender{
    
    pageId = 0;
    isSearchStaffTeam=NO;
    sBarStaffTeam.text=@"";
    arrTempCubeFeedList = [arrCubeFeedList copy];
    [arrCubeFeedList removeAllObjects];
    [self getFeeds];
    
}
-(void)reachabilityHomeStatusChange:(NSNotification*)notification{
  
    if([ICUtils isConnectedToHost])
    {
        if (isLoggedIn) {
            
            NSMutableDictionary *info = [NSMutableDictionary dictionary];
            [info setValue:[NSString stringWithFormat:@"%ld",(long)loginDHolder.icUserId] forKey:@"user_id"];
            
            [self requestUserDetail:info];
        }
        
        //api calling
        pageId=0;
        [HUD show];
        [self requestListOfEmployeeOrTeam];
        [self requestListCube];
        [self getFeeds];
    }
}

#pragma mark - IB_ACTIONS

-(void)refreshHomeViewController:(UIButton*)btnNotification
{
    [[ICDataBaseInteraction databaseInteractionManager] updateNotificationTable];
    viewNotification.hidden=YES;
    
    ICNotificationViewController *controller = [[ICNotificationViewController alloc] init];
    controller.delegate = self;
    FPPopoverController *popover = [[FPPopoverController alloc] initWithViewController:controller];
    popover.contentSize = CGSizeMake(220,300);
    popover.border = NO;
    popover.tint = FPPopoverRedTint;
    popover.alpha = 1.0;
    [popover presentPopoverFromPoint:CGPointMake(263,17)];
    
    popOver=popover;
    
}
-(void)commentPage:(ICNotificationHolder *)holder
{
    ICNotificationHolder *notificationHolder=(ICNotificationHolder *)holder;
    NSString *strFeedId=notificationHolder.strMessageId;
    NSString *strNotificationId=notificationHolder.strNotificationId;
    
    NSMutableDictionary *info=[[NSMutableDictionary alloc]init];
    [info setObject:strFeedId forKey:@"cubeFeed_id"];
    [info setObject:strNotificationId forKey:@"notification_id"];

    if ([notificationHolder.strMessageType isEqualToString:@"c"])
    {
        [self performSegueWithIdentifier:@"HomecommentListView" sender:info];
    }
    else
    {
        NSMutableDictionary *info=[NSMutableDictionary new];
        [info setObject:notificationHolder.strMessageId forKey:@"searchId"];
        [info setObject:notificationHolder.strMessageType forKey:@"searchType"];
        [self performSegueWithIdentifier:@"viewProfile" sender:holder];
        
    }
    [popOver dismissPopoverAnimated:YES];
}
- (IBAction)showRightMenuPressed:(id)sender
{
    [self.menuContainerViewController toggleRightSideMenuCompletion:nil];
}

-(IBAction)btnSubmitPostCubeDidClicked:(id)sender{
    
    [txtCubeComment resignFirstResponder];
    
    if (searchEditBegin == YES)
    {
        if (![strReceiverId isEqual:@""])
        {
            if (!(strCubeId) ||[strCubeId isEqual:@""])
            {
                [searchTeamOrPerson resetLayout];
                [ICUtils showAlert:MESSAGE_CUBE_PICK delegate:self btnOk:@"Ok" btnCancel:nil];
                return;
            }
            txtCubeComment.text = [txtCubeComment.text stringByTrimmingCharactersInSet:
                                   [NSCharacterSet whitespaceAndNewlineCharacterSet]];

            if (txtCubeComment.text.length==0)
            {
                [searchTeamOrPerson resetLayout];
                [ICUtils showAlert:MESSAGE_COMMENTBOX_BLANK_ERROR delegate:self btnOk:@"Ok" btnCancel:nil];
                return;
            }
            
            if(![txtCubeComment.text isEqualToString:MESSAGE_WRITE_MESSAGE])
            {
                if(txtCubeComment.text.length<301)
                {
                    if([ICUtils isConnectedToHost])
                    {
                        NSMutableDictionary *info = [NSMutableDictionary dictionary];
                        [info setValue:[NSString stringWithFormat:@"%ld",(long)loginDHolder.icUserId] forKey:@"poster_id"];
                        [info setValue:strReceiverId forKey:@"receiver_id"];
                        [info setValue:strRecordType forKeyPath:@"cube_type"];
                        [info setValue:strCubeId forKeyPath:@"cube_id"];
                        [info setValue:txtCubeComment.text forKeyPath:@"cube_comments"];
                        
                        NSDate *currentDatetime = [NSDate date];
                        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
                        [dateFormat setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
                        NSString *strPostedTime;
                        strPostedTime= [dateFormat stringFromDate:currentDatetime];
                        
                        [info setValue:strPostedTime forKeyPath:@"posted_time"];
                        [HUD show];
                        [HUD setHUDText:@"Loading..."];
                        [self requestPostCube:info];
                        
                        [searchTeamOrPerson resignFirstResponder];
                    }
                    else
                    {
                        [searchTeamOrPerson resetLayout];
                        [ICUtils showAlert:MESSAGE_NET_NOT_AVAILABLE delegate:self btnOk:@"Ok" btnCancel:nil];
                    }
                }
                else
                {
                    [searchTeamOrPerson resetLayout];
                    [ICUtils showAlert:MESSAGE_COMMENT_ERROR delegate:self btnOk:@"Ok" btnCancel:nil];
                    return;
                }
            }
            else
            {
                [searchTeamOrPerson resetLayout];
                [ICUtils showAlert:MESSAGE_COMMENTBOX_BLANK_ERROR delegate:self btnOk:@"Ok" btnCancel:nil];
                return;
            }
        }
        else
        {
            [searchTeamOrPerson resetLayout];
            [ICUtils showAlert:MESSAGE_SELECT_PERSON_OR_TEAM_ERROR delegate:self btnOk:@"Ok" btnCancel:nil];
            return;
        }
    }
    else{
        
        [searchTeamOrPerson resetLayout];
        [ICUtils showAlert:MESSAGE_SELECT_PERSON_OR_TEAM_ERROR delegate:self btnOk:@"Ok" btnCancel:nil];
        return;
    }
}

- (IBAction)btnAddedPressed:(id)sender {
    ICAddedListViewController *controller = [[ICAddedListViewController alloc] init];
    controller.arrList = arrPersonList;
    FPPopoverController *popover = [[FPPopoverController alloc] initWithViewController:controller];
    popover.contentSize = CGSizeMake(220,239);
    popover.border = NO;
    popover.tint = FPPopoverWhiteTint;
    popover.alpha = 1.0;
    [popover presentPopoverFromPoint:CGPointMake(223,80)];
}
-(IBAction)listOfCubeAwards:(id)sender
{
    popOverView.hidden = YES;
    popOverTextView.hidden=YES;
    [searchTeamOrPerson resignFirstResponder];
    [txtCubeComment resignFirstResponder];
    [self.view addSubview:viewTbleCube];
    CGRect frame = viewTbleCube.frame;
    CGRect frame1 = tblCubeAward.frame;
    CGRect frame2 = btnCancel.frame;
    frame2.size.height= 32;
    
    if(IS_IPHONE_5)
    {
        frame.size.height= 497;
        frame1.size.height= 497;
      
    }
    else
    {
        frame.size.height = 409 ;
        frame1.size.height= 409;
        
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.5];
        viewTbleCube.frame = frame;
        tblCubeAward.frame = frame1;
        btnCancel.frame = frame2;
        [UIView commitAnimations];
    });
    
    [tblCubeAward reloadData];
    
}

#pragma mark - UITABLEVIEW DELEGATE AND DATASOURCE METHODS

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    if ([tableView isEqual:tblCubeAward])
    {
        return 22;
    }
    else if([tableView isEqual:tblCubeComments])
    {
        return 30;
    }
    else
    {
        return 0;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView==tblCubeAward) {
        
        return [arrCubeList count];
    }
    else if(tableView == tblSearchTeamOrPerson)
    {
        return [arrSearchTeamOrPersonData count];
    }
    else if(isSearchStaffTeam)
    {
        return [arrSearchStaffTeam count];
    }else{
        
        return [arrCubeFeedList count];
    }
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    // 1. The view for the header
    if (tableView==tblCubeAward)
    {
        UIView* headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width,30)];
        
        // 2. Set a custom background color and a border
        headerView.backgroundColor = [UIColor colorWithRed:45.0/255 green:41.0/255 blue:37.0/255 alpha:1];
        
        // 3. Add an image
        UILabel* headerLabel = [[UILabel alloc] init];
        headerLabel.frame = CGRectMake(10,4,150,22);
        headerLabel.textColor = [UIColor whiteColor];
        headerLabel.font = [UIFont boldSystemFontOfSize:14];
        headerLabel.text = @"Choose Cube";
        headerLabel.textAlignment = NSTextAlignmentLeft;

        [headerView addSubview:headerLabel];
        
        // 5. Finally return
        return headerView;
    }
    else if([tblCubeComments isEqual:tableView])
    {
        if (!sBarStaffTeam) {
            
            sBarStaffTeam = [[ICSearchBar alloc]initWithFrame:CGRectMake(6, 0, 309, 26)];
            sBarStaffTeam.placeholder = @"Search Staff or Team";
            sBarStaffTeam.delegate = self;
            
        }
        sBarStaffTeam.frame = CGRectMake(6, 0, 309, 26);
        return sBarStaffTeam;
    }else{
        return nil;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView setSeparatorInset:UIEdgeInsetsZero];
    if (tableView==tblCubeAward)
    {
        static NSString *cellIdentifier = @"CellCube";
        ICCubeListCell  *cell = nil;
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell)
        {
            cell = [[ICCubeListCell alloc]
                    initWithStyle:UITableViewCellStyleDefault
                    reuseIdentifier:cellIdentifier];
        }
       
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        
        ICCubeAwardHolder *cubeHolder=[ICCubeAwardHolder new];
        cubeHolder=[arrCubeList objectAtIndex:indexPath.row];
        
        [cell.imgCube removeFromSuperview];
        cell.imgCube=[[UIImageView alloc]initWithFrame:CGRectMake(28, 6, 45, 40)];
        cell.imgCube.layer.cornerRadius=5.0;
        [cell.contentView addSubview:cell.imgCube];
        
        [cell.imgCube setImageWithUrl:[NSURL URLWithString:cubeHolder.strCubeImageUrl]
                        andPlaceHoder:[UIImage imageNamed:NO_IMAGE_AVAILABLE]
                           andNoImage:[UIImage imageNamed:NO_IMAGE]];

        cell.lblCubeTitle.text=cubeHolder.strCubeTitle;
        cell.lblCubeValue.text=cubeHolder.strCubeValue;
        
        return cell;
    }
    else if (tableView == tblSearchTeamOrPerson)
    {
        static NSString *cellIdentifier = @"searchCell";
        
        UITableViewCell *cell = nil;
        
//        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
//        if (!cell)
//        {
            cell = [[UITableViewCell alloc]
                    initWithStyle:UITableViewCellStyleDefault
                    reuseIdentifier:cellIdentifier];
//        }
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        
        cell.backgroundColor=[UIColor colorWithRed:45.0/255.0 green:41.0/255 blue:37.0/255 alpha:1];
        
        ICTeamOrPersonListHolder *teamOrPersonSearchDHolder=[arrSearchTeamOrPersonData objectAtIndex:indexPath.row];
         cell.textLabel.textColor=[UIColor whiteColor];
        [cell.textLabel setFont:[UIFont systemFontOfSize:14]];

        if([teamOrPersonSearchDHolder.strRecordType isEqualToString:@"u"]){
            
            cell.textLabel.text=[NSString stringWithFormat:@"%@ %@",teamOrPersonSearchDHolder.strPersonFirstName,teamOrPersonSearchDHolder.strPersonLastName];
            
            [cell.imageView setImageWithUrl:[NSURL URLWithString:teamOrPersonSearchDHolder.strPersonImageUrl] andPlaceHoder:[UIImage imageNamed:NO_IMAGE_AVAILABLE] andNoImage:[UIImage imageNamed:NO_IMAGE]];
            
        }else
        {
            cell.textLabel.text=teamOrPersonSearchDHolder.strTeamName;
            [cell.imageView setImageWithUrl:[NSURL URLWithString:teamOrPersonSearchDHolder.strTeamImageUrl] andPlaceHoder:[UIImage imageNamed:NO_IMAGE_AVAILABLE] andNoImage:[UIImage imageNamed:NO_IMAGE]];
            
        }
        
         return cell;
    }

    else
    {
        tableView.separatorStyle=UITableViewCellSeparatorStyleNone;

        static NSString *cellIdentifier = @"CommentCell";
        ICCubeFeedCell   *cell;
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell)
        {
            cell = [[ICCubeFeedCell alloc]
                    initWithStyle:UITableViewCellStyleDefault
                    reuseIdentifier:cellIdentifier];
        }
        
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        cell.separatorInset=UIEdgeInsetsZero;
           
        ICCubeFeedCommentHolder *cubeFeedHolder=[ICCubeFeedCommentHolder new];
        
        if (isSearchStaffTeam) {
            
            if (arrSearchStaffTeam.count>0) {
                
                cubeFeedHolder=[arrSearchStaffTeam objectAtIndex:indexPath.row];
            }else{
                
                cubeFeedHolder=[arrTempSearchStaffTeam objectAtIndex:indexPath.row];
            }
        }else{
            
            if (arrCubeFeedList.count>0) {
                
                cubeFeedHolder=[arrCubeFeedList objectAtIndex:indexPath.row];
            }else{
                
                cubeFeedHolder=[arrTempCubeFeedList objectAtIndex:indexPath.row];
            }
        }
        
        //comment
        cell.lblCubeComments.text=cubeFeedHolder.strComment;
        CGSize labelSize = [cubeFeedHolder.strComment
                            sizeWithFont:cell.lblCubeComments.font
                            constrainedToSize:CGSizeMake(224, 50)
                            lineBreakMode:cell.lblCubeComments.lineBreakMode];
        cell.lblCubeComments.frame = CGRectMake(6, 60, 224, labelSize.height);
        
        cell.lblCubeComments.userInteractionEnabled=YES;
      
        UITapGestureRecognizer *lblTapped = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(lblCommentDidClicked:)];
        lblTapped.numberOfTapsRequired = 1;
        [cell.lblCubeComments addGestureRecognizer:lblTapped];
        
        //cube image
        [cell.imgVCube removeFromSuperview];
        cell.imgVCube = [[ICCubeImageView alloc]initWithFrame:CGRectMake(238, 10, 60, 60)];
        cell.imgVCube.layer.cornerRadius=5.0;
        cell.imgVCube.layer.masksToBounds=YES;
        [cell.contentView addSubview:cell.imgVCube];

        [cell.imgVCube setImageWithUrl:[NSURL URLWithString:cubeFeedHolder.strCubeImageUrl]
                         andPlaceHoder:[UIImage imageNamed:NO_IMAGE_AVAILABLE]
                            andNoImage:[UIImage imageNamed:NO_IMAGE]];
        
        cell.imgVCube.userInteractionEnabled=YES;
        cell.imgVCube.imageIndex=indexPath.row;
        UITapGestureRecognizer *tapped = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(cubeImageDidClicked:)];
        tapped.numberOfTapsRequired = 1;
        [cell.imgVCube addGestureRecognizer:tapped];
        
        //receiver image
        [cell.imgVCubeReciever removeFromSuperview];
        cell.imgVCubeReciever =[[UIImageView alloc]initWithFrame:CGRectMake(125, 10, 35, 35)];
        cell.imgVCubeReciever.layer.cornerRadius=2.0f;
        cell.imgVCubeReciever.layer.masksToBounds=YES;
        [cell.contentView addSubview:cell.imgVCubeReciever];
        
        [cell.imgVCubeReciever setImageWithUrl:[NSURL URLWithString:cubeFeedHolder.strCubeRecievedImageUrl]                    andPlaceHoder:[UIImage imageNamed:NO_IMAGE_AVAILABLE]
                                     andNoImage:[UIImage imageNamed:NO_IMAGE]];
        
        //sender image
        [cell.imgVCubeSender removeFromSuperview];
        cell.imgVCubeSender = [[UIImageView alloc]initWithFrame:CGRectMake(15, 10, 35, 35)];
        cell.imgVCubeSender.layer.cornerRadius=2.0f;
        cell.imgVCubeSender.layer.masksToBounds=YES;
        [cell.contentView addSubview:cell.imgVCubeSender];
        [cell.imgVCubeSender setImageWithUrl:[NSURL URLWithString:cubeFeedHolder.strCubePosterImageUrl]             andPlaceHoder:[UIImage imageNamed:NO_IMAGE_AVAILABLE]
                                  andNoImage:[UIImage imageNamed:NO_IMAGE]];
        
        //cube sender and receiver name
        cell.lblCubeSender.text=cubeFeedHolder.strCubePosterName;
        cell.lblCubeReciever.text=cubeFeedHolder.strCubeRecievedName;
      
        //button action
        [cell.btnFeedDelete addTarget:self
                               action:@selector(btnFeedDeleteDidClicked:)
                     forControlEvents:UIControlEventTouchUpInside];
        cell.btnFeedDelete.index=indexPath.row;
        
        if ([loginDHolder.strUserType isEqualToString:@"General"]||[loginDHolder.strUserType isEqualToString:@"Manager"])
        {
            if(loginDHolder.icUserId == [cubeFeedHolder.strCubePostrId integerValue]){
                cell.btnFeedDelete.hidden=NO;
            }else{
                cell.btnFeedDelete.hidden=YES;
            }
        }else{
            
            cell.btnFeedDelete.hidden=NO;
        }
        
        [cell.btnComment addTarget:self
                            action:@selector(requestListCubeComment:)
                  forControlEvents:UIControlEventTouchUpInside];
        cell.btnComment.index=indexPath.row;
        
        [cell.btnLikeComment addTarget:self
                                action:@selector(requestLikeCubeComment:)
                      forControlEvents:UIControlEventTouchUpInside];
         cell.btnLikeComment.index=indexPath.row;
        
        [cell.btnCubeReceiver addTarget:self
                            action:@selector(btnViewProfileDidClicked:)
                  forControlEvents:UIControlEventTouchUpInside];
        cell.btnCubeReceiver.index=indexPath.row;
        cell.btnCubeReceiver.tag=1;
        
        [cell.btnCubeSender addTarget:self
                                action:@selector(btnViewProfileDidClicked:)
                      forControlEvents:UIControlEventTouchUpInside];
        cell.btnCubeSender.index = indexPath.row;
        cell.btnCubeSender.tag=2;
        
        if (cubeFeedHolder.strTotalComments<=1)
        {
            cell.lblCommentBtn.text=@"Comment";
        }
        else
        {
            cell.lblCommentBtn.text=@"Comments";
        }
        
        if (cubeFeedHolder.likestatus==1)
        {
            cell.lblLike.text=@"Unlike";
        }
        else
        {
             cell.lblLike.text=@"Like";
        }
        
        cell.lblNumberLike.text= [NSString stringWithFormat:@"%ld",(long)cubeFeedHolder.strTotalLike];
        cell.lblCommentCount.text=[NSString stringWithFormat: @"%ld",(long)cubeFeedHolder.strTotalComments];
        cell.lblCubeDate.text=[NSString stringWithFormat:@"%@:%@",@"Cubed",cubeFeedHolder.strCubePostedDate];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == tblCubeAward)
    {
        lblPickCube.hidden=NO;
        imgVCube.hidden=NO;
        lblBtnCube1.hidden=YES;
        lblBtnCube2.hidden=YES;
               
        ICCubeAwardHolder *cubeDHolder=[arrCubeList objectAtIndex:indexPath.row];
     
        [imgVCube setImageWithUrl:[NSURL URLWithString:cubeDHolder.strCubeImageUrl]
                          andPlaceHoder:[UIImage imageNamed:NO_IMAGE_AVAILABLE]
                             andNoImage:[UIImage imageNamed:NO_IMAGE]];
        
        strCubeId=cubeDHolder.strCubeId;
        [viewTbleCube removeFromSuperview];
        
    }
    else if(tableView == tblSearchTeamOrPerson)
    {
        searchEditBegin = YES;
        [searchTeamOrPerson resignFirstResponder];
      
        dispatch_async(dispatch_get_main_queue(), ^
             {
                    [UIView beginAnimations:nil context:nil];
                    [UIView setAnimationDuration:0.5];
                    searchTeamOrPerson.frame = CGRectMake(5, 8, 240, searchTeamOrPerson.frame.size.height);
                    UIView *view = [searchTeamOrPerson.subviews objectAtIndex:0];
                    [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, 240, 30)];
                    view.layer.cornerRadius = 5.0;
                    [UIView commitAnimations];
                    [searchTeamOrPerson resetLayout];
             });
       
        if (arrSearchTeamOrPersonData.count > 0)
        {
            if (isSearchStaffTeam) {
             
                ICTeamOrPersonListHolder *teamOrPersonSearchDHolder=[arrSearchTeamOrPersonData objectAtIndex:indexPath.row];
                arrSearchStaffTeam=[NSMutableArray new];
             
                if(teamOrPersonSearchDHolder.strPersonFirstName == 0)
                {
                    sBarStaffTeam.text = teamOrPersonSearchDHolder.strTeamName;
                    strSearchReceiverId = teamOrPersonSearchDHolder.strTeamId;
                    strSearchRecordType = teamOrPersonSearchDHolder.strRecordType;

                }
                else
                {
                    sBarStaffTeam.text = [NSString stringWithFormat:@"%@ %@",teamOrPersonSearchDHolder.strPersonFirstName,teamOrPersonSearchDHolder.strPersonLastName];
                    strSearchReceiverId = teamOrPersonSearchDHolder.strPersonUserId;
                    strSearchRecordType = teamOrPersonSearchDHolder.strRecordType;
                    
                }
                searchPageId=0;
                [self getSearchFeeds];
              
            }else{
                
                ICTeamOrPersonListHolder *teamOrPersonSearchDHolder=[arrSearchTeamOrPersonData objectAtIndex:indexPath.row];
                
                if(teamOrPersonSearchDHolder.strPersonFirstName == 0)
                {
                    searchTeamOrPerson.text=teamOrPersonSearchDHolder.strTeamName;
                    strReceiverId=teamOrPersonSearchDHolder.strTeamId;
                    strRecordType=teamOrPersonSearchDHolder.strRecordType;
                    
                }
                else
                {
                    searchTeamOrPerson.text=[NSString stringWithFormat:@"%@ %@",teamOrPersonSearchDHolder.strPersonFirstName,teamOrPersonSearchDHolder.strPersonLastName];
                    
                    strReceiverId=teamOrPersonSearchDHolder.strPersonUserId;
                    strRecordType=teamOrPersonSearchDHolder.strRecordType;
                    
                }
            }
        }
        
        tblSearchTeamOrPerson.frame = CGRectMake(tblSearchTeamOrPerson.frame.origin.x,tblSearchTeamOrPerson.frame.origin.y, tblSearchTeamOrPerson.frame.size.width,0);
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==tblCubeComments)
    {
        return 138;
    }
    else if (tableView==tblCubeAward)
    {
        return 65;
    }
    else
    {
        return 35;
    }
}

-(void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==tblSearchTeamOrPerson)
    {
        cell.imageView.layer.cornerRadius=2.0;
        cell.imageView.layer.masksToBounds=YES;
        CGSize itemSize = CGSizeMake(30, 30);
        UIGraphicsBeginImageContextWithOptions(itemSize, NO, UIScreen.mainScreen.scale);
        CGRect imageRect = CGRectMake(5, 5, itemSize.width, itemSize.height);
        [cell.imageView.image drawInRect:imageRect];
        cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        [cell.imageView setFrame:CGRectMake(2, 2, cell.imageView.frame.size.width-5, cell.imageView.frame.size.height-5)];
    }
    else if (tableView==tblCubeComments)
    {
        if (!isTableLoadedFirstTime) {
            
            isTableLoadedFirstTime = YES;
            if ([tableView isEqual:tblCubeComments])
            {
                if(isPulledToRefresh)
                {
                    [pullToRefreshManager_ tableViewReloadFinished];
                }
            }
        }
        [searchTeamOrPerson resignFirstResponder];
        [sBarStaffTeam resignFirstResponder];
    }   
    
    [HUD hide];
}

#pragma mark - UISEARCHBAR DELEGATE MATHODS

-(void)searchViewShouldBeginEditing:(UISearchBar *)searchBar
{
    if ([searchBar isEqual:sBarStaffTeam]) {
        isSearchStaffTeam = YES;
    }else{
        isSearchStaffTeam = NO;
    }
    popOverView.hidden = YES;
    popOverTextView.hidden=YES;
}

-(void)searchViewShouldSearchButtonClick:(UISearchBar *)searchBar searchText:(NSString *)searchText
{
    searchEditBegin = NO;
    
    if (![searchBar.text isEqualToString:currentSearchText])
    {
        if(searchText.length == 0)
        {
            strReceiverId = @"";
            
            dispatch_async(dispatch_get_main_queue(), ^
            {
                [UIView beginAnimations:nil context:nil];
                [UIView setAnimationDuration:0.3];
                searchTeamOrPerson.frame =CGRectMake(searchTeamOrPerson.frame.origin.x
                                                     , searchTeamOrPerson.frame.origin.y,240,searchTeamOrPerson.frame.size.height);
                UIView *view=[searchTeamOrPerson.subviews objectAtIndex:0];
                [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, 240, 30)];
                view.layer.cornerRadius=5.0;
               
                tblSearchTeamOrPerson.frame = CGRectMake(tblSearchTeamOrPerson.frame.origin.x,tblSearchTeamOrPerson.frame.origin.y, tblSearchTeamOrPerson.frame.size.width,0);
                [UIView commitAnimations];
                [searchTeamOrPerson resetLayout];
 
            });
            
            [searchTeamOrPerson resignFirstResponder];
        }
        else
        {
            [arrSearchPersonData removeAllObjects];
            [arrSearchTeamData removeAllObjects];
            
            for (ICTeamOrPersonListHolder *teamOrpersonDHolder in arrTeamOrPersonList)
            {
                NSString *strPersonName;
                NSString *strTeamName;
                
//                strPersonName =[NSString stringWithFormat:@"%@",teamOrpersonDHolder.strPersonFirstName];
                strPersonName=[NSString stringWithFormat:@"%@ %@",teamOrpersonDHolder.strPersonFirstName,teamOrpersonDHolder.strPersonLastName];
                strTeamName =[NSString stringWithFormat:@"%@",teamOrpersonDHolder.strTeamName];
                
                NSRange nameRange =[strPersonName rangeOfString:searchText options:NSCaseInsensitiveSearch];
                NSRange teamRange=[strTeamName rangeOfString:searchText options:NSCaseInsensitiveSearch];
                
                if(nameRange.location != NSNotFound)
                {
                    [arrSearchPersonData addObject:teamOrpersonDHolder];
                    
                }
                else if (teamRange.location !=NSNotFound){
                    
                    [arrSearchTeamData addObject:teamOrpersonDHolder];
                    
                }
                 arrSearchTeamOrPersonData=[[NSMutableArray alloc]init];
                [arrSearchTeamOrPersonData addObjectsFromArray:arrSearchPersonData];
                [arrSearchTeamOrPersonData addObjectsFromArray:arrSearchTeamData];
                
                dispatch_async(dispatch_get_main_queue(), ^
                   {
                       if (arrSearchTeamOrPersonData.count==0)
                       {
                           [UIView beginAnimations:nil context:nil];
                           [UIView setAnimationDuration:0.3];
                           searchTeamOrPerson.frame=CGRectMake(5, 8, 240, searchTeamOrPerson.frame.size.height);
                           UIView *view=[searchTeamOrPerson.subviews objectAtIndex:0];
                           [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, 240, 30)];
                           view.layer.cornerRadius=5.0;
                           [UIView commitAnimations];
                           [searchTeamOrPerson resetLayout];
                           
                       }
                       
                       [tblSearchTeamOrPerson reloadData];
                       //[tblSearchTeamOrPerson bringSubviewToFront:self.view];
                       
                       if ([searchBar isEqual:sBarStaffTeam]) {
                           
                           if(arrSearchTeamOrPersonData.count>8){
                               
                               if(IS_IPHONE_5)
                               {
                                   tblSearchTeamOrPerson.frame=CGRectMake(6,180,309,325);
                                   
                               }
                               else
                               {
                                   tblSearchTeamOrPerson.frame=CGRectMake(6,180,309,235);
                               }
                           }
                           else{
                               
                               tblSearchTeamOrPerson.frame=CGRectMake(6,180,309,35*arrSearchTeamOrPersonData.count);
                               
                           }
                       }else{
                           
                           if(arrSearchTeamOrPersonData.count>10){
                               
                               if(IS_IPHONE_5)
                               {
                                   tblSearchTeamOrPerson.frame=CGRectMake(5,35,310,456);
                                   
                               }
                               else
                               {
                                   tblSearchTeamOrPerson.frame=CGRectMake(5,35,310,376);
                               }
                           }
                           else{
                               tblSearchTeamOrPerson.frame=CGRectMake(5,35,310,35*arrSearchTeamOrPersonData.count);
                               
                           }
                       }
                   });
            }
            dispatch_async(dispatch_get_main_queue(), ^
                           {
            if (searchTeamOrPerson.text.length!=0)
            {
                if (tblSearchTeamOrPerson.frame.size.height!=0)
                {
                    [UIView beginAnimations:nil context:nil];
                    [UIView setAnimationDuration:0.3];
                    searchTeamOrPerson.frame=CGRectMake(5, 8, 310, searchTeamOrPerson.frame.size.height);
                    UIView *view=[searchTeamOrPerson.subviews objectAtIndex:0];
                    [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, 310, 30)];
                    view.layer.cornerRadius=5.0;
                    [UIView commitAnimations];
                    [searchTeamOrPerson resetLayout];
                }
              }
           });
        }
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
    [self searchViewShouldSearchButtonClick:searchBar searchText:searchBar.text];
    
    if (isSearchStaffTeam) {
        
        if(sBarStaffTeam.text.length == 0){
            
            isSearchStaffTeam = NO;
            [tblCubeComments reloadData];
            [pullToRefreshManager_ relocatePullToRefreshView];
        }
    }else{
        
        if(searchTeamOrPerson.text.length == 0)
        {
            [searchTeamOrPerson resignFirstResponder];
            
            tblSearchTeamOrPerson.frame = CGRectMake(tblSearchTeamOrPerson.frame.origin.x,tblSearchTeamOrPerson.frame.origin.y,tblSearchTeamOrPerson.frame.size.width,0);
            
            strReceiverId=@"";
            
        }
    }
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [self.searchDisplayController.searchBar setText:@""];
    dispatch_async(dispatch_get_main_queue(), ^
           {
               [tblSearchTeamOrPerson reloadData];
           });
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
   if (tblSearchTeamOrPerson.frame.size.height==0)
    {
        dispatch_async(dispatch_get_main_queue(), ^
               {
                   [UIView beginAnimations:nil context:nil];
                   [UIView setAnimationDuration:0.3];
                   searchTeamOrPerson.frame =CGRectMake(searchTeamOrPerson.frame.origin.x
                                                        , searchTeamOrPerson.frame.origin.y,240,searchTeamOrPerson.frame.size.height);
                   UIView *view=[searchTeamOrPerson.subviews objectAtIndex:0];
                   [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, 240, 30)];
                   view.layer.cornerRadius=5.0;
                   [UIView commitAnimations];
                   [searchTeamOrPerson resetLayout];
                   
               });
         }

     [searchTeamOrPerson resignFirstResponder];
     [sBarStaffTeam resignFirstResponder];
}

#pragma mark - UISCROLLVIEW DELEGATE METHOD

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [searchTeamOrPerson resignFirstResponder];
    [txtCubeComment resignFirstResponder];
    popOverView.hidden = YES;
    popOverTextView.hidden=YES;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if(isPulledToRefresh)
    {
        [pullToRefreshManager_ tableViewReleased];
    }
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if(isPulledToRefresh)
    {
        [pullToRefreshManager_ tableViewScrolled];
    }
    else{
        
    }
}

- (void)bottomPullToRefreshTriggered:(MNMBottomPullToRefreshManager *)manager {
  
    if(isPulledToRefresh)
    {
        [self performSelector:@selector(loadTable) withObject:nil afterDelay:1.0f];
    }
}
- (void)loadTable
{
    if(isSearchStaffTeam){
      
        searchPageId=searchPageId+1;
        [self getSearchFeeds];
    }else{
       
          pageId=pageId+1;
          [self getFeeds];
    }
}

-(void)getFeeds{
    
    NSMutableDictionary *info = [NSMutableDictionary dictionary];
    NSString *strPageId=[NSString stringWithFormat: @"%lu",(long)pageId];
    
    [info setValue:[NSString stringWithFormat:@"%ld",(long)loginDHolder.icUserId] forKey:@"user_id"];
    [info setObject:strPageId forKey:@"page_id"];
    
    [self performSelectorInBackground:@selector(requestCubeFeedList:) withObject:info];
}
-(void)getSearchFeeds{
 
    NSMutableDictionary *info = [NSMutableDictionary dictionary];
    NSString *strSearchPageId=[NSString stringWithFormat: @"%lu",(long)searchPageId];
    
    [info setValue:strSearchReceiverId forKey:@"user_id"];
    [info setValue:strSearchRecordType forKey:@"record_type"];
    [info setValue:strSearchPageId forKey:@"search_page_id"];
//    [info setObject:strPageId forKey:@"page_id"];
    
    [self performSelectorInBackground:@selector(requestSearchCubeFeedList:) withObject:info];
    
}
- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    if(isPulledToRefresh)
    {
        [pullToRefreshManager_ relocatePullToRefreshView];
    }
    else
    {
        [pullToRefreshManager_ removeFresherView];
    }
}

#pragma mark - UITEXTVIEW METHODS

- (BOOL) textViewShouldBeginEditing:(UITextView *)textView
{
    popOverView.hidden = YES;
    popOverTextView.hidden=YES;
    
    if ([txtCubeComment.text isEqualToString:MESSAGE_WRITE_MESSAGE])
    {
        txtCubeComment.text = @"";
    }
    
    return YES;
}
-(void) textViewDidChange:(UITextView *)textView
{
    if (textView.text.length>300)
    {
        [textView resignFirstResponder];
        [searchTeamOrPerson resetLayout];
        return;
    }
    lblCounterMessage.text=[NSString stringWithFormat:@"Remaining Character: %lu",(300-textView.text.length)];
    
    if(txtCubeComment.text.length == 0)
    {
        lblCounterMessage.text=@"";
        txtCubeComment.text = MESSAGE_WRITE_MESSAGE;
        [txtCubeComment resignFirstResponder];
    }

}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if([text isEqualToString:@"\n"])
    {
        [textView resignFirstResponder];
        if(txtCubeComment.text.length == 0)
        {
           lblCounterMessage.text=@"";
            txtCubeComment.text = MESSAGE_WRITE_MESSAGE;
            [txtCubeComment resignFirstResponder];
        }
        return NO;
    }
    
    NSUInteger newLength = [textView.text length] + [text length] - range.length;
    return (newLength > 300) ? NO : YES;
}


# pragma mark - API CAllING

-(void)requestUserDetail:(NSMutableDictionary*)info
{
    if([ICUtils isConnectedToHost])
    {
        [HUD show];
        [[ICRestIntraction sharedManager] requestForUserDetail:info];
    }
    else
    {
        [HUD hide];
        [searchTeamOrPerson resetLayout];
        [ICUtils showAlert:MESSAGE_NET_NOT_AVAILABLE delegate:self btnOk:@"Ok" btnCancel:nil];
    }
}

-(void)requestListOfEmployeeOrTeam
{
    if([ICUtils isConnectedToHost])
    {
        [[ICRestIntraction sharedManager] requestForListTeamOrEmployee];
    }
    else
    {
        [HUD hide];
        [searchTeamOrPerson resetLayout];
        [ICUtils showAlert:MESSAGE_NET_NOT_AVAILABLE delegate:self btnOk:@"Ok" btnCancel:nil];
        
    }
}

-(void)requestListCube
{
    if([ICUtils isConnectedToHost])
    {
//        [HUD show];
        [[ICRestIntraction sharedManager] requestForListCube];
    }
    else
    {
        [HUD hide];
        [searchTeamOrPerson resetLayout];
        [ICUtils showAlert:MESSAGE_NET_NOT_AVAILABLE delegate:self btnOk:@"Ok" btnCancel:nil];
        
    }
}

-(void)requestCubeFeedList:(NSMutableDictionary *)dict
{
    if([ICUtils isConnectedToHost])
    {
        [[ICRestIntraction sharedManager] requestForListCubeFeedComments:dict];
        
    }
    else
    {
        [HUD hide];
        [searchTeamOrPerson resetLayout];
        [refreshControl endRefreshing];
        [ICUtils showAlert:MESSAGE_NET_NOT_AVAILABLE delegate:self btnOk:@"Ok" btnCancel:nil];
        if(isPulledToRefresh)
        {
            [pullToRefreshManager_ tableViewReloadFinished];
        }
    }
}

-(void)requestSearchCubeFeedList:(NSMutableDictionary *)dict
{
    if([ICUtils isConnectedToHost])
    {
        [[ICRestIntraction sharedManager] requestForListSearchCubeFeed:dict];
        
    }
    else
    {
        [HUD hide];
        [searchTeamOrPerson resetLayout];
        [refreshControl endRefreshing];
        [ICUtils showAlert:MESSAGE_NET_NOT_AVAILABLE delegate:self btnOk:@"Ok" btnCancel:nil];
        if(isPulledToRefresh)
        {
            [pullToRefreshManager_ tableViewReloadFinished];
        }
    }
}
-(void)requestPostCube:(NSMutableDictionary*)info
{
    if([ICUtils isConnectedToHost])
    {
        [[ICRestIntraction sharedManager] requestForPostCube:info];
    }
    else
    {
        [HUD hide];
        [searchTeamOrPerson resetLayout];
        [ICUtils showAlert:MESSAGE_NET_NOT_AVAILABLE delegate:self btnOk:@"Ok" btnCancel:nil];
    }
}
-(void)requestListCubeComments:(NSMutableDictionary*)info{
    
    if([ICUtils isConnectedToHost])
    {
        [[ICRestIntraction sharedManager] requestForListCubeComment:info];
    }
    else
    {
        [searchTeamOrPerson resetLayout];
        [ICUtils showAlert:MESSAGE_NET_NOT_AVAILABLE delegate:self btnOk:@"Ok" btnCancel:nil];
    }
}
-(void)requestForLikeCubeComments:(NSMutableDictionary*)info
{    
    if([ICUtils isConnectedToHost])
    {
        [HUD show];
        [[ICRestIntraction sharedManager] requestForCubeFeedPostLike:info];
    }
    else
    {
        [searchTeamOrPerson resetLayout];
        [ICUtils showAlert:MESSAGE_NET_NOT_AVAILABLE delegate:self btnOk:@"Ok" btnCancel:nil];
    }
}
-(void)requestPostCommentOnCubeFeed:(NSMutableDictionary *)dict
{
    [[ICRestIntraction sharedManager] requestForCubeFeedPostComment:dict];
}

-(void)requestDeleteCubeFeed:(NSMutableDictionary*)info{
    
    if([ICUtils isConnectedToHost])
    {
        [[ICRestIntraction sharedManager] requestForDeleteCubeFeed:info];
    }
    else
    {
        [searchTeamOrPerson resetLayout];
        [ICUtils showAlert:MESSAGE_NET_NOT_AVAILABLE delegate:self btnOk:@"Ok" btnCancel:nil];
    }
}
# pragma mark - NSNOTIFICATION SELECTOR

-(void)cubeCommentDeleted:(NSNotification*)notification{
    
    [HUD show];
    NSMutableDictionary *info = (NSMutableDictionary*)notification.object;
    NSString *cubeFeedId = [info valueForKey:KEY_CUBE_FEED_ID];
    
    ICCubeFeedCommentHolder *cubeFeedDH = nil;
    for (ICCubeFeedCommentHolder *tempCubeFeedDH in arrCubeFeedList) {
        
        if ([tempCubeFeedDH.strCubeFeedId isEqualToString:cubeFeedId]) {
            
            cubeFeedDH = tempCubeFeedDH;
            break;
        }
    }
    
    if (cubeFeedDH) {
        cubeFeedDH.strTotalComments = cubeFeedDH.strTotalComments-1;
        [tblCubeComments reloadData];
    }else{
        
        [HUD hide];
    }
}
-(void)cubeFeedDeleted:(NSNotification*)notification{
    
    [HUD show];
    NSMutableDictionary *info = (NSMutableDictionary*)notification.object;
    NSString *cubeFeedId = [info valueForKey:KEY_CUBE_FEED_ID];
    
    ICCubeFeedCommentHolder *cubeFeedDH = nil;
    for (ICCubeFeedCommentHolder *tempCubeFeedDH in arrCubeFeedList) {
        
        if ([tempCubeFeedDH.strCubeFeedId isEqualToString:cubeFeedId]) {
            
            cubeFeedDH = tempCubeFeedDH;
            break;
        }
    }
    if (cubeFeedDH) {
        [arrCubeFeedList removeObject:cubeFeedDH];
        [tblCubeComments reloadData];
        [pullToRefreshManager_ relocatePullToRefreshView];
        
    }else{
        
        [HUD hide];
    }
}
-(void)userDetailSuccess:(NSNotification*)notification{
    
    [HUD hide];
    //set the value for login data
    isLoggedIn = NO;
    
}
-(void)userDetailFailed:(NSNotification*)notification{
    
    // NSString *strErrMessage=(NSString *)notification.object;
    [HUD hide];
     //set the value for login data
    isLoggedIn = NO;
    
}
-(void)getCubeListSuccess:(NSNotification *)notification
{
//    [HUD hide];
    arrCubeList = (NSMutableArray*)notification.object;
    
    [[ICDataBaseInteraction databaseInteractionManager] insertCubesTable:arrCubeList];
}

-(void)getCubeListFailed:(NSNotification *)notification
{
    [HUD hide];
}

-(void)getCubeFeedCommentListSuccess:(NSNotification *)notification
{
    [HUD hide];
    [refreshControl endRefreshing];
    
    [arrCubeFeedList addObjectsFromArray:(NSMutableArray*)notification.object];
    
//    if (isSearchStaffTeam) {
//        
//        ICTeamOrPersonListHolder *teamOrPersonSearchDHolder=teamOrStaffDH;
//        arrSearchStaffTeam = [NSMutableArray array];
//        if ([teamOrPersonSearchDHolder.strRecordType isEqualToString:@"t"]) {
//            
//            for (ICCubeFeedCommentHolder *tempCubeFeedDH in arrCubeFeedList) {
//                
//                if ([tempCubeFeedDH.strCubeRecievedId isEqualToString:teamOrPersonSearchDHolder.strTeamId]) {
//                    
//                    [arrSearchStaffTeam addObject:tempCubeFeedDH];
//                }
//            }
//        }else{
//            
//            for (ICCubeFeedCommentHolder *tempCubeFeedDH in arrCubeFeedList) {
//                
//                if ([tempCubeFeedDH.strCubeRecievedId isEqualToString:teamOrPersonSearchDHolder.strPersonUserId]) {
//                    
//                    [arrSearchStaffTeam addObject:tempCubeFeedDH];
//                }else if ([tempCubeFeedDH.strCubePostrId isEqualToString:teamOrPersonSearchDHolder.strPersonUserId]){
//                    
//                    [arrSearchStaffTeam addObject:tempCubeFeedDH];
//                }
//            }
//        }
//    }
    [tblCubeComments reloadData];
    if(isPulledToRefresh)
    {
        [pullToRefreshManager_ tableViewReloadFinished];
    }
}

-(void)getCubeFeedCommentListFail:(NSNotification *)notification
{
    [HUD hide];
    [refreshControl endRefreshing];
    
}

-(void)getTeamOrEmpListSuccess:(NSNotification *)notification
{
    NSMutableDictionary *dictRecentCubeRcvSent;
    NSMutableArray *arrPersonList;
    NSMutableArray *arrTeamList;
    
    dictRecentCubeRcvSent=(NSMutableDictionary*)notification.object;
    arrPersonList=[dictRecentCubeRcvSent valueForKey:@"personList"];
    arrTeamList=[dictRecentCubeRcvSent valueForKey:@"teamList"];
    
    arrTeamOrPersonList=[[NSMutableArray alloc]init];
    
    [arrTeamOrPersonList addObjectsFromArray:arrPersonList];
    [arrTeamOrPersonList addObjectsFromArray:arrTeamList];
    
}

-(void)getTeamOrEmpListFailed:(NSNotification *)notification
{
    [HUD hide];
}

-(void)cubePostSuccess:(NSNotification *)notification
{
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_CUBE_PROFILE_VIEW_REFRESH_SUCCESS object:nil];
    
    [searchTeamOrPerson resetLayout];
    searchTeamOrPerson.text =@"";
    sBarStaffTeam.text=@"";
    [searchTeamOrPerson resignFirstResponder];
    
    strReceiverId=@"";
    strRecordType=@"";
    strCubeId=@"";
    lblCounterMessage.text=@"";
    
    lblBtnCube1.hidden=NO;
    lblBtnCube2.hidden=NO;
    imgVCube.hidden=YES;
    lblPickCube.hidden=YES;
  
    [txtCubeComment setText:MESSAGE_WRITE_MESSAGE];
    arrTempCubeFeedList = [arrCubeFeedList copy];
    [arrCubeFeedList removeAllObjects];
    
    //api calling
    pageId=0;
    [self getFeeds];
    
//    [HUD hide];
  
}

-(void)cubePostFailed:(NSNotification *)notification
{
    [HUD hide];
    [searchTeamOrPerson resetLayout];
    [ICUtils showAlert:MESSAGE_UNSUCCESSFUL_POST delegate:self btnOk:@"Ok" btnCancel:nil];
    
}

-(void)cubeFeedPostCommentSuccess:(NSNotification *)notification
{
    NSMutableDictionary *info = (NSMutableDictionary*)notification.object;
    [self updateCubeFeedTable:info];
    [HUD hide];
}
-(void)cubeFeedPostCommentFailed:(NSNotification *)notification
{
    [HUD hide];
    [searchTeamOrPerson resetLayout];
    [ICUtils showAlert:MESSAGE_UNSUCCESSFUL_POST delegate:self btnOk:@"Ok" btnCancel:nil];
}

-(void)cubeFeedPostLikeSuccess:(NSNotification *)notification
{
    ICCubeFeedCommentHolder *feedCommentHolder;
    
    //reload perticular cell(row)
    NSMutableDictionary *info = (NSMutableDictionary*)notification.object;
    NSInteger cubeFeedId = [[info valueForKey:@"cubeFeed_id"]integerValue];
    NSInteger likeTotal = [[info valueForKey:@"likeTotal"] integerValue];
    NSInteger likeStatus = [[info valueForKey:@"likeStatus"] integerValue];
    NSInteger tblRowIdTemp=NSNotFound;
    NSMutableArray *arrTempFeedList=[NSMutableArray array];
    if(isSearchStaffTeam){
        arrTempFeedList=arrSearchStaffTeam;
        
    }else{
        arrTempFeedList=arrCubeFeedList;
    }
    
    for (int i=0; i<arrTempFeedList.count; i++)
    {
        feedCommentHolder=[arrTempFeedList objectAtIndex:i];
        if ([feedCommentHolder.strCubeFeedId integerValue]==cubeFeedId)
        {
            tblRowIdTemp=i;
            break;
        }
    }    
    if (tblRowIdTemp!=NSNotFound)
    {        
        feedCommentHolder.strTotalLike = likeTotal;
        feedCommentHolder.likestatus = likeStatus;
        [tblCubeComments beginUpdates];
        [tblCubeComments reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:tblRowIdTemp inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
        [tblCubeComments endUpdates];
    }
    [HUD hide];
}

-(void)cubeFeedPostLikeFailed:(NSNotification *)notification
{
    [HUD hide];
    [searchTeamOrPerson resetLayout];
}


-(void)updateCubeFeedUpdateSuccess:(NSNotification *)notification
{
    NSMutableDictionary *info = (NSMutableDictionary*)notification.object;
    [self updateCubeFeedTable:info];
    [HUD hide];
}

-(void)updateNotificationLabel:(NSNotification *)notification
{
    NSMutableArray *arrNotification=(NSMutableArray *)notification.object;
    if (arrNotification.count>0) {
        viewNotification.hidden=NO;
    }
    
    NSInteger notificationCount=[[ICDataBaseInteraction databaseInteractionManager] getNotificationMessageCount];
    NSString *strNotification=[NSString stringWithFormat:@"%ld",(long)notificationCount];
    viewNotification.lblNOtification.text=strNotification;
    
    [[ICDataBaseInteraction databaseInteractionManager] deletePreviousComments];
    
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isPushNotification"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [arrCubeList removeAllObjects];
    [arrTeamOrPersonList removeAllObjects];
    
    arrTempCubeFeedList = [arrCubeFeedList copy];
    [arrCubeFeedList removeAllObjects];
    pageId=0;
    
    [self requestListCube];
    [self requestListOfEmployeeOrTeam];
    [self getFeeds];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_CUBE_PROFILE_VIEW_REFRESH_SUCCESS object:nil];
}

-(void)updateNotificationSuccess:(NSNotification *)notification
{
    NSMutableArray *arrNotification=(NSMutableArray *)notification.object;
    for (int i=0; i<arrNotification.count; i++)
    {
        ICNotificationHolder *holder=[arrNotification objectAtIndex:i];
        NSString *strMess = holder.strMessage;
        NSString *strMessageId  = holder.strMessageId;
        NSString *strMessageType = holder.strMessageType;
        NSString *strNotificationId = holder.strNotificationId;
        NSMutableDictionary *info=[NSMutableDictionary new];
        [info setObject:strMess forKey:@"message"];
        [info setObject:strMessageId forKey:@"cubeFeedid"];
        [info setObject:strMessageType forKey:@"keyType"];
        [info setObject:strNotificationId forKey:@"notificationid"];
        [[ICDataBaseInteraction databaseInteractionManager] insertNotificationsTable:info];
    }
    [self updateNotificationLabel:notification];
    
}

-(void)updateNotificationFailed :(NSNotification *)notification
{
    [HUD hide];
}
-(void)cubeFeedDeleteSuccess:(NSNotification *)notification
{
    ICCubeFeedCommentHolder *feedCommentHolder;
    NSMutableDictionary *info = (NSMutableDictionary*)notification.object;
    NSInteger cubeFeedId = [[info valueForKey:@"cubeFeed_id"]integerValue];
    NSInteger tblRowIdTemp=NSNotFound;
    
    NSMutableArray *arrTempFeedList=[NSMutableArray array];
    if(isSearchStaffTeam){
        arrTempFeedList=arrSearchStaffTeam;
        
    }else{
        arrTempFeedList=arrCubeFeedList;
    }
    
    for (int i=0; i<arrTempFeedList.count; i++)
    {
        feedCommentHolder=[arrTempFeedList objectAtIndex:i];
        if ([feedCommentHolder.strCubeFeedId integerValue]==cubeFeedId)
        {
            tblRowIdTemp=i;
            break;
        }
    }
    if (tblRowIdTemp!=NSNotFound)
    {
        [tblCubeComments beginUpdates];
        [tblCubeComments deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:tblRowIdTemp inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
        
        if(isSearchStaffTeam){
             [arrSearchStaffTeam removeObjectAtIndex:tblRowIdTemp];
            
        }else
        {
             [arrCubeFeedList removeObjectAtIndex:tblRowIdTemp];
        }
       
        [tblCubeComments endUpdates];
        [tblCubeComments reloadData];
    }
    [HUD hide];
}

-(void)cubeFeedDeleteFailed:(NSNotification *)notification
{
    [HUD hide];
}

-(void)getSearchCubeFeedListSuccess:(NSNotification *)notification
{
    [HUD hide];
    [refreshControl endRefreshing];
    
    [arrSearchStaffTeam addObjectsFromArray:(NSMutableArray*)notification.object];
    
    [tblCubeComments reloadData];
    if(isPulledToRefresh)
    {
        [pullToRefreshManager_ tableViewReloadFinished];
    }
}

-(void)getSearchCubeFeedListFail:(NSNotification *)notification
{
    [HUD hide];
    [refreshControl endRefreshing];
}

#pragma mark - OTHER  METHODS

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [searchTeamOrPerson resetLayout];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    viewTbleCube.frame = CGRectMake(viewTbleCube.frame.origin.x, viewTbleCube.frame.origin.y, viewTbleCube.frame.size.width, 0);
    tblCubeAward.frame = CGRectMake(tblCubeAward.frame.origin.x, tblCubeAward.frame.origin.y, tblCubeAward.frame.size.width, 0);
    btnCancel.frame =CGRectMake(btnCancel.frame.origin.x, btnCancel.frame.origin.y, btnCancel.frame.size.width, 0);
    [UIView commitAnimations];
    
    if(txtCubeComment.text.length == 0)
    {
        txtCubeComment.text = MESSAGE_WRITE_MESSAGE;
    }
    
    [txtCubeComment resignFirstResponder];
    [searchTeamOrPerson resignFirstResponder];
    [sBarStaffTeam resignFirstResponder];
    
    tblSearchTeamOrPerson.frame = CGRectMake(tblSearchTeamOrPerson.frame.origin.x,tblSearchTeamOrPerson.frame.origin.y, tblSearchTeamOrPerson.frame.size.width,0);
    
    popOverView.hidden = YES;
    popOverTextView.hidden=YES;
    
}
-(void)cubeImageDidClicked:(UITapGestureRecognizer*)sender{
    
    popOverTextView.hidden=YES;
    
    ICCubeImageView *imgCube = (ICCubeImageView*)sender.view;
    CGPoint location= [sender locationInView:self.view];
    
    NSMutableArray *arrCubeDetailList=[[NSMutableArray alloc]init];
    arrCubeDetailList= [[ICDataBaseInteraction databaseInteractionManager] getCubeFromDatabase];
    
    NSString *strCubeClickedId;
    if(isSearchStaffTeam){
       
        if(arrSearchStaffTeam.count>0){
            strCubeClickedId=[[arrSearchStaffTeam objectAtIndex:imgCube.imageIndex]valueForKey:@"strCubeId"];
        }
        
    }else{
        if(arrCubeFeedList.count>0){
            strCubeClickedId=[[arrCubeFeedList objectAtIndex:imgCube.imageIndex]valueForKey:@"strCubeId"];
        }
    }
    
    if(strCubeClickedId)
    {
        for(int i=0;i<arrCubeList.count;i++)
        {
            ICCubeAwardHolder *cubeAwardDHolder=[arrCubeDetailList objectAtIndex:i];
            
            if([cubeAwardDHolder.strCubeId isEqualToString:strCubeClickedId])
            {
                popOverView.txtView.frame=CGRectMake(imgCube.frame.size.height+108,location.y,75,18);
                popOverView.txtView.font=[UIFont systemFontOfSize:8];
                popOverView.txtView.backgroundColor=[UIColor blackColor];
                popOverView.txtView.layer.opacity=0.8f;
                popOverView.txtView.textColor=[UIColor whiteColor];
                
                popOverView.txtView.text=[NSString stringWithFormat:@"%@",cubeAwardDHolder.strCubeTitle];
                
                popOverView.hidden = NO;
            }
        }
    }
}
-(void)lblCommentDidClicked:(id)sender{
    
    popOverView.hidden = YES;
    
    UITapGestureRecognizer *tap = (UITapGestureRecognizer *)sender;
    CGPoint location = [tap locationInView:self.view];
    CGPoint locationTbl = [tap locationInView:tblCubeComments];
    
    NSIndexPath *indexPath = [tblCubeComments indexPathForRowAtPoint:locationTbl];
    NSString *strComments;
  
    if(isSearchStaffTeam){
        if(arrSearchStaffTeam.count>0){
             strComments =[[arrSearchStaffTeam objectAtIndex:indexPath.row] valueForKey:@"strComment"];
        }
       
    }else{
        if(arrCubeFeedList.count>0){
            strComments=[[arrCubeFeedList objectAtIndex:indexPath.row] valueForKey:@"strComment"];
        }
        
    }
    if(strComments){
        
        popOverTextView.txtView.text=strComments;
        
        strComments = [strComments stringByTrimmingCharactersInSet:
                       [NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        NSUInteger txtLength;
        txtLength=strComments.length;
        
//        [ICUtils showAlert:[NSString stringWithFormat:@"%lu",(unsigned long)txtLength]];
        if(txtLength>130)
        {
            popOverTextView.txtView.frame=CGRectMake(10,location.y,230,txtLength/62*22);
        }
        else
        {
            popOverTextView.txtView.frame=CGRectMake(10,location.y,230,34);
        }
        popOverTextView.txtView.backgroundColor=[UIColor colorWithRed:240.0/255 green:240.0/255 blue:240.0/255 alpha:1];
        popOverTextView.txtView.textColor=[UIColor blackColor];
        popOverTextView.txtView.layer.borderColor=[UIColor lightGrayColor].CGColor;
        popOverTextView.txtView.layer.borderWidth=0.5;
        
        popOverTextView.hidden=NO;
    }
}
-(void)closeTableCube:(UIButton *)sender
{
    dispatch_async(dispatch_get_main_queue(), ^
               {
                   [UIView beginAnimations:nil context:NULL];
                   [UIView setAnimationDuration:0.1];
                   
                   viewTbleCube.frame = CGRectMake(viewTbleCube.frame.origin.x, viewTbleCube.frame.origin.y, viewTbleCube.frame.size.width, 0);
                   tblCubeAward.frame = CGRectMake(tblCubeAward.frame.origin.x, tblCubeAward.frame.origin.y, tblCubeAward.frame.size.width, 0);
                   btnCancel.frame =CGRectMake(btnCancel.frame.origin.x, btnCancel.frame.origin.y, btnCancel.frame.size.width, 0);
                   [UIView commitAnimations];
//                   [UIView commitAnimations];
               });
    
}
-(void)requestListCubeComment:(ICLikeCommentButton *)sender
{
    if ([ICUtils isConnectedToHost])
    {
        ICLikeCommentButton *btnComment = (ICLikeCommentButton*)sender;
        ICCubeFeedCommentHolder *myCubeFeedDHolder;
        if(isSearchStaffTeam){
            if(arrSearchStaffTeam.count>0){
                myCubeFeedDHolder =[arrSearchStaffTeam objectAtIndex:btnComment.index];
            }
        }else
        {
            if(arrCubeFeedList.count>0){
                 myCubeFeedDHolder =[arrCubeFeedList objectAtIndex:btnComment.index];
            }
        }
        
        if(myCubeFeedDHolder){
            NSString *strFeedId=myCubeFeedDHolder.strCubeFeedId;
            NSMutableDictionary *info=[[NSMutableDictionary alloc]init];
            [info setObject:strFeedId forKey:@"cubeFeed_id"];
            [info setValue:[NSString stringWithFormat:@"%lu",(unsigned long)btnComment.index] forKey:@"tblRowId"];
            [self performSegueWithIdentifier:@"HomecommentListView" sender:info];
        }
   }
    else
    {
        [searchTeamOrPerson resetLayout];
        [ICUtils showAlert:MESSAGE_NET_NOT_AVAILABLE delegate:self btnOk:@"Ok" btnCancel:nil];

    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"HomecommentListView"])
    {
        ICCommentViewController *commentViewController = [segue destinationViewController];
        NSMutableDictionary *info=(NSMutableDictionary *)sender;
        commentViewController.strCommentFeedId = [info valueForKey:@"cubeFeed_id"];
        commentViewController.strNotificationId =[info valueForKey:@"notification_id"];
        
    }else if([segue.identifier isEqualToString:@"viewProfileHome"])
    {
        ICSearchProfileViewController *searchProfileVController= [segue destinationViewController] ;
        searchProfileVController.profileInfo = sender;
        searchProfileVController.delegate = self;
        
    }
}

///request for post like

-(void)requestLikeCubeComment:(ICLikeCommentButton *)sender
{
    ICLikeCommentButton *btnLike = (ICLikeCommentButton*)sender;
    ICCubeFeedCommentHolder *myCubeFeedDHolder;
    if(isSearchStaffTeam){
        if(arrSearchStaffTeam.count>0){
             myCubeFeedDHolder =[arrSearchStaffTeam objectAtIndex:btnLike.index];
        }
       
    }else
    {
        if (arrCubeFeedList.count>0) {
             myCubeFeedDHolder =[arrCubeFeedList objectAtIndex:btnLike.index];
        }
    }
    
    if(myCubeFeedDHolder){
    
        NSString *strFeedId=myCubeFeedDHolder.strCubeFeedId;
        
        NSMutableDictionary *info=[[NSMutableDictionary alloc]init];
        [info setObject:strFeedId forKey:@"cubeFeed_id"];
        [info setObject:[NSString stringWithFormat:@"%ld",(long)loginDHolder.icUserId] forKey:@"user_id"];
        [info setValue:[NSString stringWithFormat:@"%lu",(unsigned long)btnLike.index] forKey:@"tblRowId"];
        
        
        //[HUD setHUDText:@"Cube Liking..."];
        [self requestForLikeCubeComments:info];
    }
}

-(void)updateCubeFeedTable:(NSMutableDictionary *)info
{
    ICCubeFeedCommentHolder *feedCommentHolder;
    NSInteger cubeFeedId = [[info valueForKey:@"cubeFeed_id"]integerValue];
    NSInteger totalComments = [[info valueForKey:@"totalComment"] integerValue];
    NSInteger tblRowIdTemp=NSNotFound;
    
    NSMutableArray *arrTempFeedList=[NSMutableArray array];
    if(isSearchStaffTeam){
        arrTempFeedList=arrSearchStaffTeam;
        
    }else{
        arrTempFeedList=arrCubeFeedList;
    }
    for (int i=0; i<arrTempFeedList.count; i++)
    {
        feedCommentHolder=[arrTempFeedList objectAtIndex:i];
        if ([feedCommentHolder.strCubeFeedId integerValue]==cubeFeedId)
        {
            tblRowIdTemp=i;
            break;
        }
    }
    
    if (tblRowIdTemp!=NSNotFound)
    {
        feedCommentHolder.strTotalComments = totalComments;
        [tblCubeComments beginUpdates];
        [tblCubeComments reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:tblRowIdTemp inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
        [tblCubeComments endUpdates];
    }
    
}

-(void)btnViewProfileDidClicked:(id)sender{
    
    isProfileView=NO;
    ICLikeCommentButton *btnViewProfile = (ICLikeCommentButton*)sender;
    NSMutableDictionary * info = [[NSMutableDictionary alloc]init];
    
    if(btnViewProfile.tag == 1){
       
        if(isSearchStaffTeam){
            if(arrSearchStaffTeam.count >0){
                 userDetailDHolder = [arrSearchStaffTeam objectAtIndex:btnViewProfile.index];
            }
            
        }else{
            if (arrCubeFeedList.count >0) {
                 userDetailDHolder = [arrCubeFeedList objectAtIndex:btnViewProfile.index];
            }
        }
        
    if(userDetailDHolder){
       [info setValue:[NSString stringWithFormat:@"%ld",(long)userDetailDHolder.intReceiverId]forKey:@"searchId"];
       [info setValue:userDetailDHolder.strCubeType forKey:@"searchType"];

    }
        
    }else{
        
        if(isSearchStaffTeam){
            if(arrSearchStaffTeam.count>0){
                 userDetailDHolder = [arrSearchStaffTeam objectAtIndex:btnViewProfile.index];
            }
           
        }else{
            if(arrCubeFeedList.count>0){
                
                 userDetailDHolder = [arrCubeFeedList objectAtIndex:btnViewProfile.index];
            }
        }
        
    if(userDetailDHolder){
        [info setValue:[NSString stringWithFormat:@"%ld",(long)userDetailDHolder.intSenderId]forKey:@"searchId"];
        [info setValue:@"u" forKey:@"searchType"];
    }
  
  }
    
    if(info.count>0){
       
        [self performSegueWithIdentifier:@"viewProfileHome" sender:info];
    }
}
-(void)btnFeedDeleteDidClicked:(ICLikeCommentButton *)sender{
    
    [HUD show];
    ICLikeCommentButton *btnDelete = (ICLikeCommentButton*)sender;
   
    ICCubeFeedCommentHolder *cubeFeedDHolder;
    if(isSearchStaffTeam){
        
        if(arrSearchStaffTeam.count>0){
             cubeFeedDHolder =[arrSearchStaffTeam objectAtIndex:btnDelete.index];
        }
      
    }else
    {
        if(arrCubeFeedList.count>0){
            cubeFeedDHolder =[arrCubeFeedList objectAtIndex:btnDelete.index];
        }
    }
    if(cubeFeedDHolder){
      
        NSMutableDictionary *info=[NSMutableDictionary new];
        [info setObject:cubeFeedDHolder.strCubeFeedId forKey:@"cubeFeed_id"];
        [self requestDeleteCubeFeed:info];
    }
}

-(void)sendCubeDetail:(ICLoginDataHolder *)profileDHolder :(ICTeamListDataHolder*)teamDHolder{
    
    NSLog(@"test");
    
    searchTeamOrPerson.text = @"";
    strReceiverId = @"";
    strRecordType = @"";
    [self showRightMenuPressed:nil];
    [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];

    if (profileDHolder.icUserId) {
      
        searchTeamOrPerson.text = profileDHolder.strUserName;
        strReceiverId = [NSString stringWithFormat:@"%ld",(long)profileDHolder.icUserId];
        strRecordType = profileDHolder.strUserType;
        
    }else{
        
        searchTeamOrPerson.text = teamDHolder.strTeamName;
        strReceiverId = [NSString stringWithFormat:@"%ld",(long)teamDHolder.intTeamId];
        strRecordType = @"t";

    }
    
    searchEditBegin = YES;
    
//    [self.delegate updateSlideTable];
    
}

@end
