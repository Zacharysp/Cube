//
//  ICHomeViewController.h
//  IntegrityCubes
//
//  Created by aditi on 18/03/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICAppDelegate.h"
#import "MFSideMenu.h"
#import "ICSearchBar.h"
#import "ICPopOverView.h"
#import "ICCubeFeedCell.h"
#import "ICCubeListCell.h"
#import "ICCubeImageView.h"
#import "ICNotificationView.h"
#import "ICLikeCommentButton.h"
#import "FPPopoverController.h"
#import "ICDataBaseInteraction.h"
#import "ICCommentViewController.h"
#import "ICNotificationViewController.h"
#import "MNMBottomPullToRefreshManager.h"
#import "ICSearchProfileViewController.h"
#import "Reachability.h"
#import "ICSearchListCell.h"

@protocol UpdateSlideTableDelegate <NSObject>
-(void)updateSlideTable;
@end

@interface ICHomeViewController : UIViewController<UITableViewDataSource,
                                                    UITableViewDelegate,
                                                    UIAlertViewDelegate,
                                                    UIScrollViewDelegate,
                                                    NotificationDeledate,
                                                    MNMBottomPullToRefreshManagerClient,UISearchBarDelegate,
                                                    ProfileSendCubeDelegate>

{
    IBOutlet ICSearchBar *searchTeamOrPerson;
    ICSearchBar *sBarStaffTeam;
    IBOutlet UIButton  *btnCubeAward;
    IBOutlet UIButton  *btnCubeSubmit;
    IBOutlet UIButton  *btnAddToList;
    
    IBOutlet UILabel   *lblPickCube;
    IBOutlet UILabel   *lblBtnCube1;
    IBOutlet UILabel   *lblBtnCube2;
    IBOutlet UILabel   *lblCounterMessage;
   
    IBOutlet UIImageView *imgVCube;
  
    IBOutlet UITextView *txtCubeComment;
    IBOutlet UITableView *tblSearchTeamOrPerson;
    
    UITableView *tblCubeAward;
    UITableView *tblCubeComments;
    
    UIView   *viewTbleCube;
    UIButton *btnCancel;
        
    NSMutableArray *arrCubeList;
    NSMutableArray *arrTempCubeFeedList;
    NSMutableArray *arrCubeFeedList;
    NSMutableArray *arrSearchTeamData;

    NSMutableArray *arrSearchPersonData;
    NSMutableArray *arrTeamOrPersonList;
    NSMutableArray *arrSearchTeamOrPersonData;
    
    NSString *strCubeId;
    NSString *strReceiverId;
    NSString *strRecordType;
    NSString *strSearchReceiverId;
    NSString *strSearchRecordType;
    NSString *currentSearchText;
    
    NSInteger pageId;
    NSInteger searchPageId;
    
    BOOL isTopToBottom;
    BOOL isCommentAppear;
    BOOL searchEditBegin;
    BOOL ButtonClickedForExpand;
    BOOL isTableLoadedFirstTime;
    
    ICCubeFeedCell          *CellFeed;
    FPPopoverController     *popOver;
    ICPopOverView           *popOverView;
    ICPopOverView           *popOverTextView;
    ICNotificationView      *viewNotification;
    ICCubeFeedCommentHolder *userDetailDHolder;
    
    UIRefreshControl *refreshControl;
    AryaHUD *HUD;
    
    MNMBottomPullToRefreshManager *pullToRefreshManager_;
    NSUInteger reloads_;
    BOOL isSearchStaffTeam;
    ICTeamOrPersonListHolder *teamOrStaffDH;
    NSMutableArray *arrSearchStaffTeam;
    NSMutableArray *arrTempSearchStaffTeam;
}
@property(nonatomic) UIScrollViewIndicatorStyle indicatorStyle;

-(IBAction)listOfCubeAwards:(id)sender;
-(IBAction)showRightMenuPressed:(id)sender;
-(IBAction)btnSubmitPostCubeDidClicked:(id)sender;
- (IBAction)btnAddedPressed:(id)sender;

@property(nonatomic,assign)id<UpdateSlideTableDelegate>delegate;

@end
