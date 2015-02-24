//
//  ICSearchProfileViewController.h
//  IntegrityCubes
//
//  Created by aditi on 30/04/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICCubeImageView.h"
#import "FPPopoverController.h"
#import "ICPopOverViewController.h"
#import "ICCubeFeedCommentHolder.h"
#import "ICSearchProfileViewController.h"

@protocol ProfileSendCubeDelegate <NSObject>
-(void)sendCubeDetail:(ICLoginDataHolder*)profileDHolder :(ICTeamListDataHolder*)teamDHolder;
@end


@interface ICSearchProfileViewController : UIViewController<UIScrollViewDelegate,UISearchBarDelegate>{
    
    IBOutlet UISearchBar  *searchPersonBar;
    IBOutlet UITableView  *tblPersonView;
    IBOutlet UIScrollView *scrollView;
    
    IBOutlet UIImageView *imgUserProfile;
    IBOutlet UITextView  *txtVTeamDescription;
    
    IBOutlet UILabel  *lblUserName;
    IBOutlet UILabel  *lbluserJobTitle;
    IBOutlet UILabel  *lblEmail;
    IBOutlet UILabel  *lblPhone;
    IBOutlet UILabel  *lblState;
    IBOutlet UILabel  *lblTeams;
    
    IBOutlet UILabel  *lblCubeReceivedCount;
    IBOutlet UILabel  *lblCubeSentCount;
    IBOutlet UILabel  *lblCubeReceived;
    IBOutlet UILabel  *lblCubeSent;
    
    IBOutlet UILabel  *lblRecentCube;
    IBOutlet UILabel  *lblProfile;
    
    IBOutlet UIButton *btnCubeReceived;
    IBOutlet UIButton *btnCubeSent;
    IBOutlet UIButton *btnSendCube;
    
    IBOutlet UIView   *viewBgProfile;
    IBOutlet UIView   *viewBgRecentCube;
    IBOutlet UIView   *viewBgProfileDetail;
             UIView   *bgHudView;
    
    NSMutableArray    *arrCubeReceived;
    NSMutableArray    *arrCubeSent;
    NSMutableArray    *arrCubeScroll;
    
    NSMutableArray    *arrPersonList;
    NSMutableArray    *arrSearchPersonList;
    
    NSString *currentSearchText;
    NSString *searchType;
    
    ICLoginDataHolder    *profileDetailDHolder;
    ICTeamListDataHolder *teamDetailDHolder;
    FPPopoverController  *popOver;

    AryaHUD *HUD;
    
    BOOL isReceivedCube;
    
}
@property(nonatomic,strong)NSMutableDictionary *profileInfo;
-(IBAction)btnCubeSentDidClicked:(id)sender;
-(IBAction)btnCubeReceivedDidClicked:(id)sender;
-(IBAction)btnSendCubeDidClicked:(id)sender;

@property(nonatomic,assign)id<ProfileSendCubeDelegate>delegate;
@end
