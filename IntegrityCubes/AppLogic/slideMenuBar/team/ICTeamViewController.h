//
//  ICTeamViewController.h
//  IntegrityCubes
//
//  Created by aditi on 18/03/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MFSideMenu.h"
#import "ICPopOverView.h"
#import "ICCubeImageView.h"
#import "ICLikeCommentButton.h"
#import "ICCubeImageView.h"
#import "ICCubeAwardHolder.h"
#import "ICPopOverViewController.h"
#import "FPPopoverController.h"
#import "Reachability.h"

@interface ICTeamViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>{
    
    IBOutlet UILabel      *lblTeamCubeReceived;
    IBOutlet UILabel      *lblTeamName;
    IBOutlet UILabel      *lblTeamDescription;
    IBOutlet UILabel      *lblTeamReceivedCube;
    IBOutlet UILabel      *lblTeamProfileContainer;
    IBOutlet UILabel      *lblTeamNameHeadline;
    IBOutlet UILabel      *lblTeamCubeLine;
    IBOutlet UILabel      *lblRecentCube;
    
    IBOutlet UIImageView  *imgTeamView;
    
    IBOutlet UITableView  *tblTeamPosterView;
    IBOutlet UITableView  *tblTeamList;
    
    IBOutlet UIScrollView *scrollVRecentCube;
    IBOutlet UISearchBar  *searchTeamBar;
    
    NSMutableArray   *arrTeamCubeRcv;
    NSMutableArray   *arrTeamCubeScroll;
    
    NSMutableArray   *arrTeamPoster;
    NSMutableArray   *arrPosterCubeRcvSend;
    NSMutableArray   *arrRcvSendCubeScroll;
    
    NSMutableArray   *arrTeamList;
    NSMutableArray   *arrSearchTeamList;
    NSMutableArray  *arrTeamDetail;
    
    NSString *currentSearchText;
    
    ICPopOverView *popOverView;
    FPPopoverController *popOver;
    
    AryaHUD       *HUD;
           
}
-(IBAction)showRightMenuPressed:(id)sender;


@end
