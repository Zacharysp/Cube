//
//  ICProfileViewController.m
//  IntegrityCubes
//
//  Created by aditi on 18/03/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//

#import "ICProfileViewController.h"
#import "ICCommentViewController.h"


@interface ICProfileViewController ()

@end

@implementation ICProfileViewController

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
    arrCubeMyFeedList = [NSMutableArray new];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(userDetailSuccess:) name:NOTIFICATION_USER_DETAIL_SUCCESS object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(userDetailFailed:) name:NOTIFICATION_USER_DETAIL_FAILED object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getCubeReceivedMyFeedListSuccess:) name:NOTIFICATION_CUBE_RECEIVED_MY_FEED_LIST_SUCCESS object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getCubeReceivedMyFeedListFailed:) name:NOTIFICATION_CUBE_RECEIVED_MY_FEED_LIST_FAILED object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getCubeSentMyFeedListSuccess:) name:NOTIFICATION_CUBE_SENT_MY_FEED_LIST_SUCCESS object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getCubeSentMyFeedListFailed:) name:NOTIFICATION_CUBE_SENT_MY_FEED_LIST_FAILED object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getCubeRecentSuccess:) name:NOTIFICATION_CUBE_RECENT_SUCCESS object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getCubeRecentFailed:) name:NOTIFICATION_CUBE_RECENT_FAILED object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(cubeFeedPostCommentSuccess:) name:NOTIFICATION_CUBE_FEED_POST_COMMENT_SUCCESS object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(cubeFeedPostCommentFailed:) name:NOTIFICATION_CUBE_FEED_POST_COMMENT_FAILED object:nil];

    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getCubeFeedPostLikeSuccess:) name:NOTIFICATION_CUBE_FEED_POST_LIKE_SUCCESS object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getCubeFeedPostLikeFailed:) name:NOTIFICATION_CUBE_FEED_POST_LIKE_FAILED object:nil];
    
   [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(refreshThroughHomeView:) name:NOTIFICATION_CUBE_PROFILE_VIEW_REFRESH_SUCCESS object:nil];
    
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(cubeFeedRowDeleteSuccess:) name:NOTIFICATION_DELETE_CUBE_FEED_SUCCESS object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(updateCubeFeedUpdateSuccess:) name:NOTIFICATION_DELETE_COMMENT_SUCCESS object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(updateShareButtons:) name:NOTIFICATION_PROFILE_EDIT_LINK_SUCCESS object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(cubeFeedDeleted:) name:NOTIFICATION_CUBE_FEED_DELETED object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(cubeCommentDeleted:) name:NOTIFICATION_CUBE_COMMENT_DELETED object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(cubeFeedDeleteSuccess:) name:NOTIFICATION_DELETE_CUBE_FEED_SUCCESS object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(cubeFeedDeleteFailed:) name:NOTIFICATION_DELETE_CUBE_FEED_FAILED object:nil];
    
    arrTempCubeReceived = [NSMutableArray array];
    arrTempCubeReceivedFeedList = [NSMutableArray array];
    arrTempCubeSent = [NSMutableArray array];
    arrTempCubeSentFeedList = [NSMutableArray array];
    arrCubeMyFeedList = [NSMutableArray array];
    arrCubeReceivedFeedList = [NSMutableArray array];
    arrCubeSentFeedList = [NSMutableArray array];
    
    UIImage* imgSideMenu = [UIImage imageNamed:@"menu-icon.png"];
    CGRect imgSideFrame = CGRectMake(0, 0, imgSideMenu.size.width, imgSideMenu.size.height);
    UIButton *btnSideMenu = [[UIButton alloc] initWithFrame:imgSideFrame];
    [btnSideMenu setBackgroundImage:imgSideMenu forState:UIControlStateNormal];
    [btnSideMenu addTarget:self action:@selector(showRightMenuPressed:)
          forControlEvents:UIControlEventTouchUpInside];
    [btnSideMenu setShowsTouchWhenHighlighted:YES];
    
    UIBarButtonItem *btnBarSideMenu =[[UIBarButtonItem alloc] initWithCustomView:btnSideMenu];
//    UIBarButtonItem *btnBarRefresh =[[UIBarButtonItem alloc] initWithCustomView:BtnRefresh];
    
    [self.navigationItem setRightBarButtonItem:btnBarSideMenu];
    
    //user profile info
    [imgUserProfile setImageWithUrl:[NSURL URLWithString:loginDHolder.strUserImageUrl]
                      andPlaceHoder:[UIImage imageNamed:NO_IMAGE_AVAILABLE]
                         andNoImage:[UIImage imageNamed:NO_IMAGE]];
    
    lblUserName.text=[NSString stringWithFormat:@"%@ %@",loginDHolder.strFirstName,loginDHolder.strLastName];
    lbluserJobTitle.text=loginDHolder.strJobTitle;
    lblEmail.text=loginDHolder.strEmail;
    lblPhone.text=loginDHolder.strPhone;
    lblState.text=[NSString stringWithFormat:@"%@, %@",loginDHolder.strCity,loginDHolder.strState];
    
    for (int i=0; i<loginDHolder.arrTeamId.count; i++)
    {
        NSString *strTeamName=[[loginDHolder.arrTeamId valueForKey:@"team_name"]objectAtIndex:i];
        if (i==0)
        {
            lblTeams.text=strTeamName;
        }
        else
        {
            lblTeams.text=[strTeamName stringByAppendingString:[NSString stringWithFormat:@",%@",strTeamName]];
        }
    }
    
    btnCubeReceived.layer.cornerRadius=3;
    btnCubeSent.layer.cornerRadius=3;
    
    scrollView.delegate = self;
    scrollView.scrollEnabled = YES;
    scrollView.showsHorizontalScrollIndicator=NO;
    
    [btnCubeReceived setBackgroundColor:[UIColor blackColor]];
    [btnCubeSent setBackgroundColor:[UIColor lightGrayColor]];
    
    pullToRefreshManager_ = [[MNMBottomPullToRefreshManager alloc] initWithPullToRefreshViewHeight:60.0f tableView:tblMyCubeFeed withClient:self];
    
    //BOOL value assign
    isPulledToRefresh = YES;
    isReceivedCube=YES;
    
    //HUD Loading
    HUD=[AryaHUD new];
    [HUD setHUDText:@"Loading..."];
    [self.view addSubview:HUD];
    
    //ICPopOver View
    popOverView = [[ICPopOverView alloc]init];
    popOverView.hidden = YES;
    [self.view addSubview:popOverView];
    
    //ICPopOver View
    popOverTextView = [[ICPopOverView alloc]init];
    popOverTextView.hidden = YES;
    [self.view addSubview:popOverTextView];
    
     //api calling
    [self userDetails];
    
    pageId=0;
    NSMutableDictionary *info = [NSMutableDictionary dictionary];
    [info setValue:[NSString stringWithFormat:@"%ld",(long)loginDHolder.icUserId] forKey:@"user_id"];
    [HUD show];
    [self requestCubeRecent:info];
    [self getFeed];
    
     //check for reachability change
    [[NSNotificationCenter defaultCenter]addObserver:self
                                           selector:@selector(reachabilityProfileStatusChange:)
                                            name:kReachabilityChangedNotification
                                              object:nil];
    
    NSString *strFacebook=[[NSUserDefaults standardUserDefaults]valueForKey:KEY_FACEBOOK];
    NSString *strTwitter=[[NSUserDefaults standardUserDefaults]valueForKey:KEY_TWITTER];
    NSString *strLinkedin=[[NSUserDefaults standardUserDefaults]valueForKey:KEY_LINKEDIN];
 
    //facebook link
    if ([strFacebook isEqualToString:@"Y"]){
          btnFacebook.hidden=NO;
          strFacebookLink=[[NSUserDefaults standardUserDefaults]valueForKey:KEY_FACEBOOK_LINK];
        
    }else{
          btnFacebook.hidden=YES;
    }
    
    //twitter link
    if ([strTwitter isEqualToString:@"Y"]){
        btnTwitter.hidden=NO;
        strTwiiterLink=[[NSUserDefaults standardUserDefaults]valueForKey:KEY_TWITTER_LINK];
        
    }else{
        btnTwitter.hidden=YES;
    }
    
    //Linkedin link
    if ([strLinkedin isEqualToString:@"Y"]){
        btnLinkedin.hidden=NO;
        strLinkedinLink=[[NSUserDefaults standardUserDefaults]valueForKey:KEY_LINKEDIN_LINK];
        
    }else{
         btnLinkedin.hidden=YES;
    }
}
-(void)viewWillAppear:(BOOL)animated{
    
  
}
-(void)reachabilityProfileStatusChange:(NSNotification*)notification{
    
    if ([ICUtils isConnectedToHost])
    {
        pageId=0;
        NSMutableDictionary *info = [NSMutableDictionary dictionary];
        [info setValue:[NSString stringWithFormat:@"%ld",(long)loginDHolder.icUserId] forKey:@"user_id"];
        
        //api calling
        [HUD show];
        [self requestCubeRecent:info];
        [self requestUserDetail:info];
        [self getFeed];
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    popOverView.hidden = YES;
    popOverTextView.hidden=YES;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    popOverView.hidden = YES;
    popOverTextView.hidden=YES;
}

#pragma mark - IB_ACTIONS

- (IBAction)showRightMenuPressed:(id)sender{
    
    [self.menuContainerViewController toggleRightSideMenuCompletion:nil];
}

-(IBAction)btnCubeReceivedDidClicked:(id)sender{
    
      isReceivedCube=YES;
      popOverView.hidden = YES;
      popOverTextView.hidden=YES;
      [btnCubeReceived setBackgroundColor:[UIColor blackColor]];
      [btnCubeSent setBackgroundColor:[UIColor lightGrayColor]];
      
      int scrollWidth = 70;
      int xOffset = 0;
      
      arrCubeScroll = [[NSMutableArray alloc]init];
      ICCubeRecentHolder *receiveCubeDHolder;
      
      for(UIView *subview in [scrollView subviews])
      {
          [subview removeFromSuperview];
      }
      
      if(arrCubeReceived.count==0 && arrTempCubeReceived.count==0)
      {
          arrCubeMyFeedList = [NSMutableArray array];
          UILabel *lbl=[[UILabel alloc]initWithFrame:scrollView.bounds];
          lbl.frame=CGRectMake(85, 16, 150, 30);
          [lbl setFont:[UIFont fontWithName:@"Times New Roman" size:14]];
          lbl.text=@"Cubes are not available.";
          lbl.textColor=[UIColor grayColor];
          [scrollView addSubview:lbl];
          scrollView.contentSize = CGSizeMake(scrollWidth,60);
      }
      else
      {
          NSMutableArray *arrTempCR = nil;
          if (arrCubeReceived.count>0) {
              
              arrTempCR = arrCubeReceived;
          }else{
              
              arrTempCR = arrTempCubeReceived;
          }
          
          for(int index=0; index < [arrTempCR count]; index++)
          {
              ICCubeImageView *imgView = [[ICCubeImageView alloc] init];
              imgView.bounds = CGRectMake(10,10,50,50);
              imgView.frame = CGRectMake(10+xOffset,5,50,50);
              receiveCubeDHolder=[arrTempCR objectAtIndex:index];
              
              [imgView setImageWithUrl:[NSURL URLWithString:receiveCubeDHolder.strCubeReceivedImageUrl]
                         andPlaceHoder:[UIImage imageNamed:NO_IMAGE_AVAILABLE]
                            andNoImage:[UIImage imageNamed:NO_IMAGE]];
              
              imgView.userInteractionEnabled=YES;
              
              imgView.imageIndex = index;
              UITapGestureRecognizer *tapped = [[UITapGestureRecognizer alloc]
                                                initWithTarget:self
                                                action:@selector(scrollViewCubeImageDidClicked:)];
              tapped.numberOfTapsRequired = 1;
              [imgView addGestureRecognizer:tapped];
              
              [arrCubeScroll insertObject:imgView atIndex:index];
              scrollView.contentSize = CGSizeMake(scrollWidth+xOffset,60);
              [scrollView addSubview:[arrCubeScroll objectAtIndex:index]];
              
              xOffset+=60;
          }
      }
    [tblMyCubeFeed reloadData];
    [pullToRefreshManager_ relocatePullToRefreshView];
}
-(IBAction)btnCubeSentDidClicked:(id)sender{
    
    isReceivedCube=NO;
    popOverView.hidden = YES;
    popOverTextView.hidden=YES;
    [btnCubeReceived setBackgroundColor:[UIColor lightGrayColor]];
    [btnCubeSent setBackgroundColor:[UIColor blackColor]];
    
    int scrollWidth = 70;
    int xOffset = 0;
    
    arrCubeScroll = [[NSMutableArray alloc]init];
    ICCubeRecentHolder *receiveCubeDHolder;
    
    for(UIView *subview in [scrollView subviews])
    {
        [subview removeFromSuperview];
    }
    
    if(arrCubeSent.count==0 && arrTempCubeSent.count==0)
    {
        arrCubeMyFeedList = [NSMutableArray array];
        UILabel *lbl=[[UILabel alloc]initWithFrame:scrollView.bounds];
        lbl.frame=CGRectMake(85, 16, 150, 30);
        [lbl setFont:[UIFont fontWithName:@"Times New Roman" size:14]];
        lbl.text=@"Cubes are not available.";
        lbl.textColor=[UIColor grayColor];
        [scrollView addSubview:lbl];
        scrollView.contentSize = CGSizeMake(scrollWidth,60);
    }
    else
    {
        NSMutableArray *arrTempCR = nil;
        if (arrCubeSent.count>0) {
            
            arrTempCR = arrCubeSent;
        }else{
            
            arrTempCR = arrTempCubeSent;
        }
        
        for(int index=0; index < [arrTempCR count]; index++)
        {
            ICCubeImageView *imgView = [[ICCubeImageView alloc] init];
            imgView.bounds = CGRectMake(10,10,50,50);
            imgView.frame = CGRectMake(10+xOffset,5,50,50);
            receiveCubeDHolder=[arrTempCR objectAtIndex:index];
            
            [imgView setImageWithUrl:[NSURL URLWithString:receiveCubeDHolder.strCubeSentImageUrl]
                       andPlaceHoder:[UIImage imageNamed:NO_IMAGE_AVAILABLE]
                          andNoImage:[UIImage imageNamed:NO_IMAGE]];
            
            imgView.userInteractionEnabled=YES;
            
            imgView.imageIndex=index;
            UITapGestureRecognizer *tapped = [[UITapGestureRecognizer alloc]
                                              initWithTarget:self
                                              action:@selector(scrollViewCubeImageDidClicked:)];
            tapped.numberOfTapsRequired = 1;
            [imgView addGestureRecognizer:tapped];
            
            [arrCubeScroll insertObject:imgView atIndex:index];
            scrollView.contentSize = CGSizeMake(scrollWidth+xOffset,60);
            [scrollView addSubview:[arrCubeScroll objectAtIndex:index]];
            
            xOffset+=60;
        }
    }
    [tblMyCubeFeed reloadData];
    [pullToRefreshManager_ relocatePullToRefreshView];
}

-(IBAction)btnFacebookLink:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:strFacebookLink]];
}
-(IBAction)btnTwitterLink:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:strTwiiterLink]];
}
-(IBAction)btnLinkedInLink:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:strLinkedinLink]];
}

#pragma mark - UITableView Methods

-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
}
-(void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!isTableLoadedFirstTime) {
     isTableLoadedFirstTime = YES;
        if ([tableView isEqual:tblMyCubeFeed])  
        {
            if(isPulledToRefresh)
            {
                self.view.userInteractionEnabled = YES;
                [pullToRefreshManager_ tableViewReloadFinished];
            }
        }
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (isReceivedCube) {
        
        return arrCubeReceivedFeedList.count;
    }
    
    return arrCubeSentFeedList.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"myCubeFeedCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:cellIdentifier];
    }
    
    
    if (isReceivedCube) {
        
        if (arrCubeReceivedFeedList.count>0) {
            
            arrCubeMyFeedList = arrCubeReceivedFeedList;
            
        }else{
            
            arrCubeMyFeedList = arrTempCubeReceivedFeedList;
        }
        
    }else{
        
        if (arrCubeSentFeedList.count>0) {
            
            arrCubeMyFeedList = arrCubeSentFeedList;
        }else{
            arrCubeMyFeedList = arrTempCubeSentFeedList;
        }
    }
    
    ICCubeFeedCommentHolder *myCubeFeedDHolder =(ICCubeFeedCommentHolder*)[arrCubeMyFeedList objectAtIndex:indexPath.row];
    
    //image for cubeSender
    UIImageView *imgVCubeSender = (UIImageView*)[cell.contentView viewWithTag:1];
    [imgVCubeSender removeFromSuperview];
    imgVCubeSender = nil;
    imgVCubeSender = [[UIImageView alloc]initWithFrame:CGRectMake(20,8, 35,35)];
    imgVCubeSender.tag = 1;
    [cell.contentView addSubview:imgVCubeSender];
    [imgVCubeSender setImageWithUrl:[NSURL URLWithString:myCubeFeedDHolder.strCubePosterImageUrl]
                    andPlaceHoder:[UIImage imageNamed:NO_IMAGE_AVAILABLE]
                    andNoImage:[UIImage imageNamed:NO_IMAGE]];
    
    //image for cube receiver
    UIImageView *imgVCubeReciever = (UIImageView*)[cell.contentView viewWithTag:2];
    [imgVCubeReciever removeFromSuperview];
    imgVCubeReciever = nil;
    imgVCubeReciever = [[UIImageView alloc]initWithFrame:CGRectMake(130,8,35,35)];
    imgVCubeReciever.tag = 2;
    [cell.contentView addSubview:imgVCubeReciever];
    [imgVCubeReciever setImageWithUrl:[NSURL URLWithString:myCubeFeedDHolder.strCubeRecievedImageUrl]
                      andPlaceHoder:[UIImage imageNamed:NO_IMAGE_AVAILABLE]
                      andNoImage:[UIImage imageNamed:NO_IMAGE]];
    
    //image for cube
    ICCubeImageView *imgVCube = (ICCubeImageView*)[cell.contentView viewWithTag:3];
    [imgVCube removeFromSuperview];
    imgVCube = nil;
    imgVCube = [[ICCubeImageView alloc]initWithFrame:CGRectMake(245,10,60,60)];
    imgVCube.tag = 3;
    [cell.contentView addSubview:imgVCube];
    [imgVCube setImageWithUrl:[NSURL URLWithString:myCubeFeedDHolder.strCubeImageUrl]
              andPlaceHoder:[UIImage imageNamed:NO_IMAGE_AVAILABLE]
              andNoImage:[UIImage imageNamed:NO_IMAGE]];
    
    imgVCube.userInteractionEnabled=YES;
    
    imgVCube.imageIndex=indexPath.row;
    UITapGestureRecognizer *tapped = [[UITapGestureRecognizer alloc]
                                      initWithTarget:self
                                      action:@selector(cubeImageDidClicked:)];
    tapped.numberOfTapsRequired = 1;
    [imgVCube addGestureRecognizer:tapped];
    
    UILabel  *lblSenderName=(UILabel*)[cell.contentView viewWithTag:4];
    UILabel  *lblReceiverName=(UILabel*)[cell.contentView viewWithTag:5];
    UILabel  *lblComment =(UILabel*)[cell.contentView viewWithTag:6];
    UILabel  *lblTotalLike=(UILabel*)[cell.contentView viewWithTag:7];
    UILabel  *lblTotalComments=(UILabel*)[cell.contentView viewWithTag:8];
    UILabel  *lblBgView=(UILabel*)[cell.contentView viewWithTag:11];
    UILabel  *lblTLike=(UILabel*)[cell.contentView viewWithTag:12];
    UILabel  *lblTComment=(UILabel*)[cell.contentView viewWithTag:13];
    UILabel  *lblCubeDate=(UILabel*)[cell.contentView viewWithTag:21];
           
    ICLikeCommentButton *btnLikeComment=(ICLikeCommentButton*)[cell.contentView viewWithTag:16];
    ICLikeCommentButton *btnPreviousComment=(ICLikeCommentButton*)[cell.contentView viewWithTag:10];
    ICLikeCommentButton *btnFeedDelete=(ICLikeCommentButton*)[cell.contentView viewWithTag:20];
  
    //button action
    [btnFeedDelete setBackgroundColor:[UIColor colorWithRed:193.0/255 green:0 blue:33.0/255 alpha:1]];
    [btnFeedDelete setTitle:@"Delete" forState:UIControlStateNormal];
    [btnFeedDelete setTintColor:[UIColor whiteColor]];
    [btnFeedDelete.titleLabel setFont:[UIFont systemFontOfSize:12]];
    btnFeedDelete.layer.cornerRadius = 2.0f;
    btnFeedDelete.showsTouchWhenHighlighted=YES;
   
    [btnFeedDelete addTarget:self
                           action:@selector(btnFeedDeleteDidClicked:)
                 forControlEvents:UIControlEventTouchUpInside];
    btnFeedDelete.index=indexPath.row;
    
    if ([loginDHolder.strUserType isEqualToString:@"General"]||[loginDHolder.strUserType isEqualToString:@"Manager"])
    {
        if(loginDHolder.icUserId == myCubeFeedDHolder.intSenderId){
            
            btnFeedDelete.hidden=NO;
            
        }else{
            btnFeedDelete.hidden=YES;
            
        }
    }else{
        
         btnFeedDelete.hidden=NO;
    }
    
    [btnLikeComment addTarget:self
                       action:@selector(btnLikeDidClicked:)
             forControlEvents:UIControlEventTouchUpInside];
    btnLikeComment.index=indexPath.row;
    
    [btnPreviousComment addTarget:self
                           action:@selector(btnPreviousCommentDidClicked:)
                 forControlEvents:UIControlEventTouchUpInside];
    btnPreviousComment.index=indexPath.row;
    
    imgVCubeSender.layer.cornerRadius=2.0f;
    imgVCubeSender.layer.masksToBounds=YES;
    
    imgVCubeReciever.layer.cornerRadius=2.0f;
    imgVCubeReciever.layer.masksToBounds=YES;
    
    lblBgView.layer.masksToBounds = NO;
    lblBgView.layer.cornerRadius=2.0f;
    lblBgView.layer.borderColor = [UIColor grayColor].CGColor;
    lblBgView.layer.borderWidth=0.1;
    
    lblComment.adjustsFontSizeToFitWidth=YES;
    lblSenderName.adjustsFontSizeToFitWidth=YES;
    lblReceiverName.adjustsFontSizeToFitWidth=YES;
    
    lblReceiverName.text=myCubeFeedDHolder.strCubeRecievedName;
    lblSenderName.text=myCubeFeedDHolder.strCubePosterName;
  
    lblComment.text=myCubeFeedDHolder.strComment;
    lblComment.userInteractionEnabled=YES;
    
    UITapGestureRecognizer *lblTapped = [[UITapGestureRecognizer alloc]
                                         initWithTarget:self
                                         action:@selector(lblCommentDidClicked:)];
    lblTapped.numberOfTapsRequired = 1;
    [lblComment addGestureRecognizer:lblTapped];
    
    lblComment.lineBreakMode=YES;
    lblComment.adjustsFontSizeToFitWidth=YES;
    CGSize labelSize = [myCubeFeedDHolder.strComment
                        sizeWithFont:lblComment.font
                        constrainedToSize:CGSizeMake(224, 50) lineBreakMode:lblComment.lineBreakMode];
    lblComment.frame = CGRectMake(10, 60, 224, labelSize.height);
    
    lblTotalLike.text=[NSString stringWithFormat:@"%ld",(long)myCubeFeedDHolder.strTotalLike];
    lblTotalComments.text=[NSString stringWithFormat:@"%ld",(long)myCubeFeedDHolder.strTotalComments];
    lblCubeDate.text=[NSString stringWithFormat:@"%@:%@",@"Cubed",myCubeFeedDHolder.strCubePostedDate];
    
    if(myCubeFeedDHolder.likestatus==1){
        
        lblTLike.text=@"Unlike";
    }
    else{
        
        lblTLike.text=@"Like";
        
    }
    if (myCubeFeedDHolder.strTotalComments<=1)
    {
        lblTComment.text=@"Comment";
    }
    else
    {
        lblTComment.text=@"Comments";
    }
    
    ICLikeCommentButton *btnRightViewProfile=(ICLikeCommentButton*)[cell.contentView viewWithTag:17];
    [btnRightViewProfile addTarget:self
                        action:@selector(btnViewProfileDidClicked:)
              forControlEvents:UIControlEventTouchUpInside];
    btnRightViewProfile.index=indexPath.row;
    btnRightViewProfile.tag=1;
    
    ICLikeCommentButton *btnLeftViewProfile=(ICLikeCommentButton*)[cell.contentView viewWithTag:18];
    [btnLeftViewProfile addTarget:self
                        action:@selector(btnViewProfileDidClicked:)
              forControlEvents:UIControlEventTouchUpInside];
    btnLeftViewProfile.index=indexPath.row;
    btnLeftViewProfile.tag=2;
    
    return cell;
    
}

#pragma mark - UISCROLLVIEW DELEGATE METHOD

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if(isPulledToRefresh)
    {
        [pullToRefreshManager_ tableViewReleased];
    }
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if(isPulledToRefresh)
    {
        [pullToRefreshManager_ tableViewScrolled];
    }

}
- (void)bottomPullToRefreshTriggered:(MNMBottomPullToRefreshManager *)manager
{
    if(isPulledToRefresh)
    {
        self.view.userInteractionEnabled = YES;
        [self performSelector:@selector(loadTable) withObject:nil afterDelay:1.0f];
    }
}
- (void)loadTable
{
    pageId=pageId+1;
    [self getFeed];
    
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

#pragma mark - API CALLING

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
        [ICUtils showAlert:MESSAGE_NET_NOT_AVAILABLE delegate:self btnOk:@"Ok" btnCancel:nil];
    }
}
-(void)requestCubeRecent:(NSMutableDictionary*)info
{
   if([ICUtils isConnectedToHost])
    {
        [[ICRestIntraction sharedManager]requestForCubeRecent:info];
        
    }
    else{
        
        [HUD hide];
//        [ICUtils showAlert:MESSAGE_NET_NOT_AVAILABLE];
    }
}

-(void)requestCubeReceivedMyFeedList:(NSMutableDictionary*)info
{
    if([ICUtils isConnectedToHost])
    {
        [[ICRestIntraction sharedManager]requestForCubeReceivedMyFeedList:info];
        
    }
    else{
        
        [HUD hide];
        [ICUtils showAlert:MESSAGE_NET_NOT_AVAILABLE];
        if(isPulledToRefresh)
        {
            [pullToRefreshManager_ tableViewReloadFinished];
        }
    }
}
-(void)requestCubeSentMyFeedList:(NSMutableDictionary*)info
{
    if([ICUtils isConnectedToHost])
    {
         [[ICRestIntraction sharedManager]requestForCubeSentMyFeedList:info];
        
    }
    else{
        
        [HUD hide];
//        [ICUtils showAlert:MESSAGE_NET_NOT_AVAILABLE];
        if(isPulledToRefresh)
        {
            [pullToRefreshManager_ tableViewReloadFinished];
        }
    }
}
-(void)requestLikeCubeComments:(NSMutableDictionary*)info
{
    if([ICUtils isConnectedToHost])
    {
        [[ICRestIntraction sharedManager] requestForCubeFeedPostLike:info];
    }
    else
    {
        [HUD hide];
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
        [HUD hide];
        [ICUtils showAlert:MESSAGE_NET_NOT_AVAILABLE delegate:self btnOk:@"Ok" btnCancel:nil];
    }
}
-(void)requestPostCommentOnCubeFeed:(NSMutableDictionary *)info
{
    if([ICUtils isConnectedToHost])
    {
       [[ICRestIntraction sharedManager] requestForCubeFeedPostComment:info];
        
    }else
    {
        [HUD hide];
        [ICUtils showAlert:MESSAGE_NET_NOT_AVAILABLE delegate:self btnOk:@"Ok" btnCancel:nil];
        
    }
}
-(void)requestDeleteCubeFeed:(NSMutableDictionary*)info{
    
    if([ICUtils isConnectedToHost])
    {
        [[ICRestIntraction sharedManager] requestForDeleteCubeFeed:info];
    }
    else
    {
        [ICUtils showAlert:MESSAGE_NET_NOT_AVAILABLE delegate:self btnOk:@"Ok" btnCancel:nil];
    }
}
# pragma mark - NSNotification Selector

-(void)cubeCommentDeleted:(NSNotification*)notification{
    
    [HUD show];
    NSMutableDictionary *info = (NSMutableDictionary*)notification.object;
    NSString *cubeFeedId = [info valueForKey:KEY_CUBE_FEED_ID];
    
    ICCubeFeedCommentHolder *cubeFeedDH = nil;
    BOOL isCubeReceivedSection = NO;
    for (ICCubeFeedCommentHolder *tempCubeFeedDH in arrCubeReceivedFeedList) {
        
        if ([tempCubeFeedDH.strCubeFeedId isEqualToString:cubeFeedId]) {
            isCubeReceivedSection = YES;
            cubeFeedDH = tempCubeFeedDH;
            break;
        }
    }
    if (!cubeFeedDH) {
        
        for (ICCubeFeedCommentHolder *tempCubeFeedDH in arrCubeSentFeedList) {
            
            if ([tempCubeFeedDH.strCubeFeedId isEqualToString:cubeFeedId]) {
                
                cubeFeedDH = tempCubeFeedDH;
                break;
            }
        }
    }
    
    if (cubeFeedDH) {
        cubeFeedDH.strTotalComments = cubeFeedDH.strTotalComments-1;
        if (isCubeReceivedSection) {
            
            if (isReceivedCube) {
                
                [tblMyCubeFeed reloadData];
            }
        }else{
            
            if (!isReceivedCube) {
                
                [tblMyCubeFeed reloadData];
            }
        }
    }
    
    [HUD hide];
}
-(void)cubeFeedDeleted:(NSNotification*)notification{
    
    [HUD show];
    NSMutableDictionary *info = (NSMutableDictionary*)notification.object;
    NSString *cubeFeedId = [info valueForKey:KEY_CUBE_FEED_ID];
    
    ICCubeFeedCommentHolder *cubeFeedDH = nil;
    BOOL isCubeReceivedSection = NO;
    for (ICCubeFeedCommentHolder *tempCubeFeedDH in arrCubeReceivedFeedList) {
        
        if ([tempCubeFeedDH.strCubeFeedId isEqualToString:cubeFeedId]) {
            isCubeReceivedSection = YES;
            cubeFeedDH = tempCubeFeedDH;
            break;
        }
    }
    if (!cubeFeedDH) {
        
        for (ICCubeFeedCommentHolder *tempCubeFeedDH in arrCubeSentFeedList) {
            
            if ([tempCubeFeedDH.strCubeFeedId isEqualToString:cubeFeedId]) {
                
                cubeFeedDH = tempCubeFeedDH;
                break;
            }
        }
    }
    if (cubeFeedDH) {
        
        if (isCubeReceivedSection) {
            
            [arrCubeReceivedFeedList removeObject:cubeFeedDH];
            
            ICCubeRecentHolder *cubeRecentDH = nil;
            for (ICCubeRecentHolder *tempRecentDH in arrCubeReceived) {
                
                if ([tempRecentDH.strCubeFeedId isEqualToString:cubeFeedId]) {
                    
                    cubeRecentDH = tempRecentDH;
                    break;
                }
            }
            if (cubeRecentDH) {
                
                [arrCubeReceived removeObject:cubeRecentDH];
                [self btnCubeReceivedDidClicked:nil];
            }
            
            lblCubeReceivedCount.text = [NSString stringWithFormat:@"%ld",([lblCubeReceivedCount.text integerValue])-1];
            if (isReceivedCube) {
                
                [tblMyCubeFeed reloadData];
                [pullToRefreshManager_ relocatePullToRefreshView];
            }
        }else{
            [arrCubeSentFeedList removeObject:cubeFeedDH];
            ICCubeRecentHolder *cubeRecentDH = nil;
            for (ICCubeRecentHolder *tempRecentDH in arrCubeSent) {
                
                if ([tempRecentDH.strCubeFeedId isEqualToString:cubeFeedId]) {
                    
                    cubeRecentDH = tempRecentDH;
                    break;
                }
            }
            if (cubeRecentDH) {
                
                [arrCubeSent removeObject:cubeRecentDH];
                [self btnCubeSentDidClicked:nil];
            }
            lblCubeSentCount.text = [NSString stringWithFormat:@"%ld",([lblCubeSentCount.text integerValue])-1];
            if (!isReceivedCube) {
                
                [tblMyCubeFeed reloadData];
                [pullToRefreshManager_ relocatePullToRefreshView];
            }
        }
    }
    
    [HUD hide];
}
-(void)userDetailSuccess:(NSNotification*)notification{
 
    [HUD hide];
    [self userDetails];
    
}
-(void)userDetailFailed:(NSNotification*)notification{
    
      [HUD hide];
   // NSString *strErrMessage=(NSString *)notification.object;
   //[ICUtils showAlert:strErrMessage];
}

-(void)getCubeRecentSuccess:(NSNotification *)notification
{
    [HUD hide];
    
    dictRecentCubeRcvSent=(NSMutableDictionary*)notification.object;
    arrCubeReceived=[dictRecentCubeRcvSent valueForKey:@"receivedCube"];
    arrCubeSent=[dictRecentCubeRcvSent valueForKey:@"sentCube"];
    
    ICCubeRecentHolder *recentDH;
    
    if (arrCubeReceived.count>0)
    {
         recentDH = [arrCubeReceived objectAtIndex:0];
        lblCubeReceivedCount.text=[NSString stringWithFormat:@"%lu",(long)[recentDH.strCubeReceived integerValue]];
         lblCubeLine1.text=@"Cubes";
        
    }else
    {
        lblCubeReceivedCount.text=@"0";
        lblCubeLine1.text=@"Cube";
    }
    
    if (arrCubeSent.count>0)
    {
        recentDH = [arrCubeSent objectAtIndex:0];
        lblCubeSentCount.text=[NSString stringWithFormat:@"%lu",(long)[recentDH.strCubeSent integerValue]];
        lblCubeLine2.text=@"Cubes";
    }
    else
    {
         lblCubeSentCount.text=@"0";
         lblCubeLine2.text=@"Cube";
    }
    
    if(isReceivedCube==YES) {
       
        [self performSelector:@selector(btnCubeReceivedDidClicked:) withObject:nil];
        
    }else{
        
        [self performSelector:@selector(btnCubeSentDidClicked:) withObject:nil];
    }
//  [self performSelector:@selector(btnCubeReceivedDidClicked:) withObject:nil];
}
-(void)getCubeRecentFailed:(NSNotification*)notification{
    
    [HUD hide];
    // NSString *strErrMessage=(NSString *)notification.object;
    //[ICUtils showAlert:strErrMessage];
}

-(void)getCubeReceivedMyFeedListSuccess:(NSNotification *)notification
{
    [HUD hide];
    NSMutableArray *arrCRFeedList=(NSMutableArray*)notification.object;
  
    if(isReceivedCube){
    
         [arrCubeReceivedFeedList addObjectsFromArray:arrCRFeedList];
    }else{
      
//        arrCubeReceivedFeedList=[NSMutableArray new];
        [arrCubeReceivedFeedList addObjectsFromArray:arrCRFeedList];
    }
    
    [tblMyCubeFeed reloadData];
    if(isPulledToRefresh)
    {
        [pullToRefreshManager_ tableViewReloadFinished];
    }
}
-(void)getCubeReceivedMyFeedListFailed:(NSNotification *)notification
{
    [HUD hide];
    
}
-(void)getCubeSentMyFeedListSuccess:(NSNotification *)notification
{
    [HUD hide];
    
    NSMutableArray *arrCSFeedList=(NSMutableArray*)notification.object;
    
    if(isReceivedCube){
//         arrCubeSentFeedList=[NSMutableArray new];
        [arrCubeSentFeedList addObjectsFromArray:arrCSFeedList];
    }else{
        
        [arrCubeSentFeedList addObjectsFromArray:arrCSFeedList];
    }
    
    [tblMyCubeFeed reloadData];
    if(isPulledToRefresh)
    {
        [pullToRefreshManager_ tableViewReloadFinished];
    }
}
-(void)getCubeSentMyFeedListFailed:(NSNotification *)notification
{
    [HUD hide];
    // [ICUtils showAlert:MESSAGE_UNSUCCESSFUL];
    
}
-(void)getCubeFeedPostLikeSuccess:(NSNotification *)notification
{
    [HUD hide];
    
    ICCubeFeedCommentHolder *feedCommentHolder;
    
    //reload particular cell(row)
    NSMutableDictionary *info = (NSMutableDictionary*)notification.object;
    NSInteger cubeFeedId = [[info valueForKey:@"cubeFeed_id"]integerValue];
    NSInteger likeTotal = [[info valueForKey:@"likeTotal"] integerValue];
    NSInteger likeStatus = [[info valueForKey:@"likeStatus"] integerValue];
    NSInteger tblRowIdTemp=NSNotFound;
    for (int i=0; i<arrCubeMyFeedList.count; i++)
    {
        feedCommentHolder=[arrCubeMyFeedList objectAtIndex:i];
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
        [tblMyCubeFeed beginUpdates];
        [tblMyCubeFeed reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:tblRowIdTemp inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
        [tblMyCubeFeed endUpdates];
    }
}
-(void)getCubeFeedPostLikeFailed:(NSNotification *)notification
{
    [HUD hide];
   // [ICUtils showAlert:MESSAGE_UNSUCCESSFUL delegate:self btnOk:@"Ok" btnCancel:nil];
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
    //[ICUtils showAlert:MESSAGE_UNSUCCESSFUL_POST delegate:self btnOk:@"Ok" btnCancel:nil];
}

-(void)cubeFeedDeleteSuccess:(NSNotification *)notification
{
    ICCubeFeedCommentHolder *feedCommentHolder;
    //reload perticular cell(row)
    NSMutableDictionary *info = (NSMutableDictionary*)notification.object;
    NSInteger cubeFeedId = [[info valueForKey:@"cubeFeed_id"]integerValue];
    NSInteger tblRowIdTemp=NSNotFound;
    for (int i=0; i<arrCubeMyFeedList.count; i++)
    {
        feedCommentHolder=[arrCubeMyFeedList objectAtIndex:i];
        if ([feedCommentHolder.strCubeFeedId integerValue]==cubeFeedId)
        {
            tblRowIdTemp = i;
            break;
        }
    }
    
    ICCubeFeedCommentHolder *cubeFeedDH = nil;
    BOOL isCubeReceivedSection = NO;
    for (ICCubeFeedCommentHolder *tempCubeFeedDH in arrCubeReceivedFeedList) {
        
        if ([tempCubeFeedDH.strCubeFeedId isEqualToString:[info valueForKey:@"cubeFeed_id"]]) {
            isCubeReceivedSection = YES;
            cubeFeedDH = tempCubeFeedDH;
            break;
        }
    }
    if (!cubeFeedDH) {
        
        for (ICCubeFeedCommentHolder *tempCubeFeedDH in arrCubeSentFeedList) {
            
            if ([tempCubeFeedDH.strCubeFeedId isEqualToString:[info valueForKey:@"cubeFeed_id"]]) {
                
                cubeFeedDH = tempCubeFeedDH;
                break;
            }
        }
    }
    if (cubeFeedDH) {
        
        if (isCubeReceivedSection) {
            
            [arrCubeReceivedFeedList removeObject:cubeFeedDH];
            
            ICCubeRecentHolder *cubeRecentDH = nil;
            for (ICCubeRecentHolder *tempRecentDH in arrCubeReceived) {
                
                if ([tempRecentDH.strCubeFeedId isEqualToString:[info valueForKey:@"cubeFeed_id"]]) {
                    
                    cubeRecentDH = tempRecentDH;
                    break;
                }
            }
            if (cubeRecentDH) {
                
                [arrCubeReceived removeObject:cubeRecentDH];
                [self btnCubeReceivedDidClicked:nil];
            }
            
            lblCubeReceivedCount.text = [NSString stringWithFormat:@"%ld",([lblCubeReceivedCount.text integerValue])-1];
            if (isReceivedCube) {
                
                [tblMyCubeFeed reloadData];
                [pullToRefreshManager_ relocatePullToRefreshView];
            }
        }else{
            [arrCubeSentFeedList removeObject:cubeFeedDH];
            ICCubeRecentHolder *cubeRecentDH = nil;
            for (ICCubeRecentHolder *tempRecentDH in arrCubeSent) {
                
                if ([tempRecentDH.strCubeFeedId isEqualToString:[info valueForKey:@"cubeFeed_id"]]) {
                    
                    cubeRecentDH = tempRecentDH;
                    break;
                }
            }
            if (cubeRecentDH) {
                
                [arrCubeSent removeObject:cubeRecentDH];
                [self btnCubeSentDidClicked:nil];
            }
            lblCubeSentCount.text = [NSString stringWithFormat:@"%ld",([lblCubeSentCount.text integerValue])-1];
            if (!isReceivedCube) {
                
                [tblMyCubeFeed reloadData];
                [pullToRefreshManager_ relocatePullToRefreshView];
            }
        }
    }
    
//    if (tblRowIdTemp!= NSNotFound)
//    {
//        [tblMyCubeFeed beginUpdates];
//        [tblMyCubeFeed deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:tblRowIdTemp inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
//        [arrCubeMyFeedList removeObjectAtIndex:tblRowIdTemp];
//        [tblMyCubeFeed endUpdates];
//        [pullToRefreshManager_ relocatePullToRefreshView];
//    }

    [HUD hide];
}

-(void)cubeFeedDeleteFailed:(NSNotification *)notification
{
    [HUD hide];
}

-(void)updateCubeFeedUpdateSuccess:(NSNotification *)notification
{
    NSMutableDictionary *info = (NSMutableDictionary*)notification.object;
    [self updateCubeFeedTable:info];
    [HUD hide];
}
-(void)updateShareButtons:(NSNotification *)notification
{
    NSDictionary *info=(NSDictionary *)notification.object;
    NSString *strFac=[info objectForKey:@"facebook"];
    NSString *strTwi=[info objectForKey:@"twitter"];
    NSString *strLin=[info objectForKey:@"linkedin"];
    
    NSMutableDictionary *dict=[(NSMutableDictionary *)[NSUserDefaults standardUserDefaults] valueForKey:@"EditLink"];
    if ([strFac isEqualToString:@"Y"])
    {
        btnFacebook.hidden=NO;
        strFacebookLink=[dict valueForKey:@"facebook"];
        
        [[NSUserDefaults standardUserDefaults]setValue:strFac forKey:KEY_FACEBOOK];
        [[NSUserDefaults standardUserDefaults]setValue:strFacebookLink forKey:KEY_FACEBOOK_LINK];
        
    }
    if ([strTwi isEqualToString:@"Y"])
    {
        btnTwitter.hidden=NO;
        strTwiiterLink=[dict valueForKey:@"twitter"];
        
        [[NSUserDefaults standardUserDefaults]setValue:strTwi forKey:KEY_TWITTER];
        [[NSUserDefaults standardUserDefaults]setValue:strTwiiterLink forKey:KEY_TWITTER_LINK];
    }
    if ([strLin isEqualToString:@"Y"])
    {
        btnLinkedin.hidden=NO;
        strLinkedinLink=[dict valueForKey:@"linkedin"];
        
        [[NSUserDefaults standardUserDefaults]setValue:strLin forKey:KEY_LINKEDIN];
        [[NSUserDefaults standardUserDefaults]setValue:strLinkedinLink forKey:KEY_LINKEDIN_LINK];
    }
    
}
-(void)refreshThroughHomeView:(NSNotification *)notification
{
    [self refreshProfileViewController];
}

#pragma mark - CUBE SCROLL_VIEW ACTION

-(void)cubeImageDidClicked:(UITapGestureRecognizer*)sender{
    
    popOverTextView.hidden=YES;
    
    ICCubeImageView *imgCube = (ICCubeImageView*)sender.view;
    CGPoint location= [sender locationInView:self.view];
    
    NSMutableArray *arrCubeList=[[NSMutableArray alloc]init];
    arrCubeList= [[ICDataBaseInteraction databaseInteractionManager] getCubeFromDatabase];
    
    NSString *strCubeClickedId;
    if(arrCubeMyFeedList.count>0){
        strCubeClickedId=[[arrCubeMyFeedList objectAtIndex:imgCube.imageIndex]valueForKey:@"strCubeId"];
        
        for(int i=0;i<arrCubeList.count;i++)
        {
            ICCubeAwardHolder *cubeAwardDHolder=[arrCubeList objectAtIndex:i];
            
            if([cubeAwardDHolder.strCubeId isEqualToString:strCubeClickedId])
            {
                popOverView.txtView.frame=CGRectMake(imgCube.frame.size.height+108,location.y,75,18);
                popOverView.txtView.font=[UIFont systemFontOfSize:8];
                popOverView.txtView.backgroundColor=[UIColor blackColor];
                popOverView.txtView.layer.opacity=0.8f;
                popOverView.txtView.textColor=[UIColor whiteColor];
                popOverView.txtView.text=[NSString stringWithFormat:@"%@",
                                          cubeAwardDHolder.strCubeTitle];
                
                popOverView.hidden = NO;
            }
        }
    }
}
-(void)scrollViewCubeImageDidClicked:(UITapGestureRecognizer*)sender{
    
    popOverView.hidden = YES;
    popOverTextView.hidden = YES;
    
    ICCubeImageView    *imgCube = (ICCubeImageView*)sender.view;
    ICCubeRecentHolder *cubeRecentDHolder;
    
    if(isReceivedCube){
        if(arrCubeReceived.count>0){
            cubeRecentDHolder =[arrCubeReceived objectAtIndex:imgCube.imageIndex];
        }
        
    }else{
        
        if(arrCubeSent.count>0){
            cubeRecentDHolder =[arrCubeSent objectAtIndex:imgCube.imageIndex];
        }
    }
    
    CGPoint location= [sender locationInView:self.view];
    
    ICPopOverViewController *popOverController= [[ICPopOverViewController alloc] init];
    popOverController.cubeRecentDetailDHolder = cubeRecentDHolder;
    FPPopoverController *popover = [[FPPopoverController alloc] initWithViewController:popOverController];
    
    if(cubeRecentDHolder.strCubeComment.length<101){
        
        popover.contentSize = CGSizeMake(170,158);
        
    }else{
        
        popover.contentSize = CGSizeMake(170,185);
    }
    
    popover.arrowDirection=FPPopoverArrowDirectionUp;
    popover.border = NO;
    popover.tint = FPPopoverLightGrayTint;
    popover.alpha = 1;
    popOver=popover;
    
    if(IS_IPHONE_5){
        
        [popOver presentPopoverFromPoint:CGPointMake(location.x, 245)];
        
    }else{
        
        [popOver presentPopoverFromPoint:CGPointMake(location.x, 239)];
    }
}
-(void)lblCommentDidClicked:(id)sender{
    
    popOverView.hidden = YES;
    
    UITapGestureRecognizer *tap = (UITapGestureRecognizer *)sender;
    CGPoint location = [tap locationInView:self.view];
    CGPoint locationTbl = [tap locationInView:tblMyCubeFeed];
    
    NSIndexPath *indexPath = [tblMyCubeFeed indexPathForRowAtPoint:locationTbl];
    
    if(arrCubeMyFeedList.count>0){
        NSString *strComments=[[arrCubeMyFeedList objectAtIndex:indexPath.row] valueForKey:@"strComment"];
        popOverTextView.txtView.text=strComments;
        
        strComments = [strComments stringByTrimmingCharactersInSet:
                       [NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        NSUInteger txtLength;
        txtLength=strComments.length;
        
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

#pragma mark - Other_Methods

-(void)refreshProfileViewController
{
//    [HUD show];
//    [HUD setHUDText:@"Refreshing..."];
    arrTempCubeReceivedFeedList = [arrCubeReceivedFeedList mutableCopy];
    arrTempCubeSentFeedList = [arrCubeSentFeedList mutableCopy];
    arrTempCubeReceived = [arrCubeReceived mutableCopy];
    arrTempCubeSent = [arrCubeSent mutableCopy];
    
    [arrCubeMyFeedList removeAllObjects];
    [dictRecentCubeRcvSent removeAllObjects];
    [arrCubeReceived removeAllObjects];
    [arrCubeSent removeAllObjects];
    
    if(isReceivedCube){
        
        arrCubeSentFeedList=[NSMutableArray new];
    }else{
        
        arrCubeReceivedFeedList=[NSMutableArray new];
    }
    
    NSMutableDictionary *info = [NSMutableDictionary dictionary];
    [info setValue:[NSString stringWithFormat:@"%ld",(long)loginDHolder.icUserId] forKey:@"user_id"];

    //api calling
    pageId=0;
    [self requestUserDetail:info];
    [self requestCubeRecent:info];
    [self getFeed];
    
}

-(void)getFeed{
    
    NSMutableDictionary *info = [NSMutableDictionary dictionary];
    
    NSString *strPageId=[NSString stringWithFormat: @"%lu",(long)pageId];
    [info setValue:[NSString stringWithFormat:@"%ld",(long)loginDHolder.icUserId] forKey:@"user_id"];
    [info setObject:strPageId forKey:@"page_id"];
    [self performSelectorInBackground:@selector(requestCubeReceivedMyFeedList:) withObject:info];
    [self performSelectorInBackground:@selector(requestCubeSentMyFeedList:) withObject:info];
    
}
-(void)userDetails
{        
    [imgUserProfile setImageWithUrl:[NSURL URLWithString:loginDHolder.strUserImageUrl]
                      andPlaceHoder:[UIImage imageNamed:NO_IMAGE_AVAILABLE]
                         andNoImage:[UIImage imageNamed:NO_IMAGE]];
    
    lblUserName.text=[NSString stringWithFormat:@"%@ %@",loginDHolder.strFirstName,loginDHolder.strLastName];
    lbluserJobTitle.text=loginDHolder.strJobTitle;
    lblEmail.text=loginDHolder.strEmail;
    lblPhone.text=loginDHolder.strPhone;
    lblState.text=[NSString stringWithFormat:@"%@, %@",loginDHolder.strCity,loginDHolder.strState];
    
    for (int i=0; i<loginDHolder.arrTeamId.count; i++)
    {
        NSString *strTeamName=[[loginDHolder.arrTeamId valueForKey:@"team_name"]objectAtIndex:i];
        if (i==0)
        {
            lblTeams.text=strTeamName;
        }
        else
        {
            lblTeams.text=[lblTeams.text stringByAppendingString:[NSString stringWithFormat:@",%@",strTeamName]];
        }
    }
}
-(void)updateCubeFeedTable:(NSMutableDictionary *)info
{
    ICCubeFeedCommentHolder *feedCommentHolder;
    NSInteger cubeFeedId = [[info valueForKey:@"cubeFeed_id"]integerValue];
    NSInteger totalComments = [[info valueForKey:@"totalComment"] integerValue];
    NSInteger tblRowIdTemp=NSNotFound;
    for (int i=0; i<arrCubeMyFeedList.count; i++)
    {
        feedCommentHolder=[arrCubeMyFeedList objectAtIndex:i];
        if ([feedCommentHolder.strCubeFeedId integerValue]==cubeFeedId)
        {
            tblRowIdTemp=i;
            break;
        }
    }
    if (tblRowIdTemp!=NSNotFound)
    {
        feedCommentHolder.strTotalComments = totalComments;
        [tblMyCubeFeed beginUpdates];
        [tblMyCubeFeed reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:tblRowIdTemp inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
        [tblMyCubeFeed endUpdates];
    }
    [HUD hide];
}

-(void)btnLikeDidClicked:(id)sender{
    
    ICLikeCommentButton *btnLike = (ICLikeCommentButton*)sender;
    if (arrCubeMyFeedList.count>0) {
        ICCubeFeedCommentHolder *myCubeFeedDHolder =[arrCubeMyFeedList objectAtIndex:btnLike.index];
        NSString *strFeedId=myCubeFeedDHolder.strCubeFeedId;
        
        NSMutableDictionary *info=[[NSMutableDictionary alloc]init];
        [info setObject:strFeedId forKey:@"cubeFeed_id"];
        [info setObject:[NSString stringWithFormat:@"%ld",(long)loginDHolder.icUserId] forKey:@"user_id"];
        [info setValue:[NSString stringWithFormat:@"%lu",(unsigned long)btnLike.index] forKey:@"tblRowId"];
        [HUD show];
        [self requestLikeCubeComments:info];

    }
}

-(void)btnPreviousCommentDidClicked:(id)sender
{
    if ([ICUtils isConnectedToHost])
    {
        ICLikeCommentButton *btnComment = (ICLikeCommentButton*)sender;
        ICCubeFeedCommentHolder*myCubeFeedDHolder = [arrCubeMyFeedList objectAtIndex:btnComment.index];
        NSMutableDictionary *info=[[NSMutableDictionary alloc]init];
        [info setObject:myCubeFeedDHolder.strCubeFeedId forKey:@"cubeFeed_id"];
        [info setValue:[NSString stringWithFormat:@"%lu",(unsigned long)btnComment.index] forKey:@"tblRowId"];
        [self performSegueWithIdentifier:@"commentListView" sender:info];
    }
    else
    {
        [ICUtils showAlert:MESSAGE_NET_NOT_AVAILABLE delegate:self btnOk:@"Ok" btnCancel:nil];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"commentListView"])
    {
        ICCommentViewController *commentViewController = [segue destinationViewController];
        NSMutableDictionary *info=(NSMutableDictionary *)sender;
        commentViewController.strCommentFeedId = [info valueForKey:@"cubeFeed_id"];
        commentViewController.strTblRowId = [info valueForKey:@"tblRowId"];
        
    }else if([segue.identifier isEqualToString:@"viewProfile"]){
        
        ICSearchProfileViewController *searchProfileVController= [segue destinationViewController] ;
        searchProfileVController.profileInfo=sender;
     
    }

}
-(IBAction)btnSearchOrViewProfileDidClicked:(id)sender{
    
    isProfileView=YES;
    [self performSegueWithIdentifier:@"viewProfile" sender:self];
    
}
-(void)btnViewProfileDidClicked:(id)sender{
    
    isProfileView=NO;
     ICLikeCommentButton *btnComment = (ICLikeCommentButton*)sender;
     NSMutableDictionary * info=[[NSMutableDictionary alloc]init];
    
    if(btnComment.tag==1){
      
      if(arrCubeMyFeedList.count>0){
         
       userDetailDHolder = [arrCubeMyFeedList objectAtIndex:btnComment.index];
       [info setValue:[NSString stringWithFormat:@"%ld",(long)userDetailDHolder.intReceiverId]forKey:@"searchId"];
       [info setValue:userDetailDHolder.strCubeType forKey:@"searchType"];
    }
        
    }else{
        
        if(arrCubeMyFeedList.count>0){
            
        userDetailDHolder = [arrCubeMyFeedList objectAtIndex:btnComment.index];
        [info setValue:[NSString stringWithFormat:@"%ld",(long)userDetailDHolder.intSenderId]forKey:@"searchId"];
        [info setValue:@"u" forKey:@"searchType"];

    }
  }
    if(info.count>0){
         [self performSegueWithIdentifier:@"viewProfile" sender:info];
    }

}
-(void)btnFeedDeleteDidClicked:(ICLikeCommentButton *)sender{
    
    [HUD show];
    ICLikeCommentButton *btnDelete = (ICLikeCommentButton*)sender;
  
    if(arrCubeMyFeedList.count>0){
        
        ICCubeFeedCommentHolder *cubeFeedDHolder=[arrCubeMyFeedList objectAtIndex:btnDelete.index];
        NSMutableDictionary *info=[NSMutableDictionary new];
        [info setObject:cubeFeedDHolder.strCubeFeedId forKey:@"cubeFeed_id"];
        [self requestDeleteCubeFeed:info];
    }
    
}

@end
