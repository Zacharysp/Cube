//
//  ICProfileViewController.h
//  IntegrityCubes
//
//  Created by aditi on 18/03/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MFSideMenu.h"
#import "ICCubeFeedCell.h"
#import "ICCubeListCell.h"
#import "ICLikeCommentButton.h"
#import "ICCubeCommentHolder.h"
#import <QuartzCore/QuartzCore.h>
#import "MNMBottomPullToRefreshManager.h"
#import "ICPopOverView.h"
#import "ICCubeImageView.h"
#import "ICPopOverViewController.h"
#import "FPPopoverController.h"
#import "ICSearchProfileViewController.h"
#import "ICDataBaseInteraction.h"
#import "Reachability.h"
#import "ICGroupImageTappedViewController.h"

@interface ICProfileViewController : UIViewController<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate,MNMBottomPullToRefreshManagerClient,FPPopoverControllerDelegate>
{ 
        
    IBOutlet UIButton    *btnCubeReceived;
    IBOutlet UIButton    *btnCubeSent;
    IBOutlet UIButton    *btnFacebook;
    IBOutlet UIButton    *btnTwitter;
    IBOutlet UIButton    *btnLinkedin;
       
    IBOutlet UIImageView *imgUserProfile;
    IBOutlet UILabel     *lblUserName;
    IBOutlet UILabel     *lbluserJobTitle;
    IBOutlet UILabel     *lblEmail;
    IBOutlet UILabel     *lblPhone;
    IBOutlet UILabel     *lblState;
    IBOutlet UILabel     *lblTeams;
    IBOutlet UILabel     *lblCubeReceivedCount;
    IBOutlet UILabel     *lblCubeSentCount;
    IBOutlet UILabel     *lblCubeLine1;
    IBOutlet UILabel     *lblCubeLine2;
    
    IBOutlet UIScrollView*scrollView;
    IBOutlet UITableView *tblMyCubeFeed;
    
    NSString *strFacebookLink;
    NSString *strTwiiterLink;
    NSString *strLinkedinLink;
    NSString *receiverIDWhenImageTapped;
    NSInteger pageId;
    
    NSMutableArray       *arrCubeMyFeedList;
    NSMutableArray       *arrCubeReceivedFeedList;
    NSMutableArray       *arrCubeSentFeedList;
    
    
    NSMutableArray       *arrCubeReceived;
    NSMutableArray       *arrCubeSent;
    NSMutableArray       *arrCubeScroll;
    
    NSMutableArray       *arrTempCubeReceived;
    NSMutableArray       *arrTempCubeSent;
    NSMutableArray       *arrTempCubeReceivedFeedList;
    NSMutableArray       *arrTempCubeSentFeedList;
    
    NSMutableDictionary  *dictRecentCubeRcvSent;
    NSMutableDictionary  *dictCubeFeedRcvSent;
    
    MNMBottomPullToRefreshManager *pullToRefreshManager_;
    NSUInteger reloads_;
    
    ICPopOverView       *popOverView;
    ICPopOverView       *popOverTextView;
    FPPopoverController *popOver;
    ICCubeFeedCommentHolder *userDetailDHolder;
    
    BOOL isTableLoadedFirstTime;
    BOOL ButtonClickedForExpand;
    BOOL isCommentAppear;
    BOOL isReceivedCube;

    AryaHUD      *HUD;

}
-(IBAction)showRightMenuPressed:(id)sender;
-(IBAction)btnCubeSentDidClicked:(id)sender;
-(IBAction)btnCubeReceivedDidClicked:(id)sender;
-(IBAction)btnSearchOrViewProfileDidClicked:(id)sender;
-(IBAction)btnFacebookLink:(id)sender;
-(IBAction)btnTwitterLink:(id)sender;
-(IBAction)btnLinkedInLink:(id)sender;


@end
