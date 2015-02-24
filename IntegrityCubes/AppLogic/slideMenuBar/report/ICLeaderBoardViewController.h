//
//  ICLeaderBoardViewController.h
//  IntegrityCubes
//
//  Created by Bhuvan Sharma on 07/04/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICCubeOfTheWeekDHolder.h"
#import "ICMostCubesRcvSentDHolder.h"
#import "ICCubeImageView.h"
#import "ICPopOverView.h"
#import "MFSideMenu.h"
#import "FPPopoverController.h"
#import "ICDateSPickerViewController.h"

@interface ICLeaderBoardViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,datePickerDelegate>
{
    IBOutlet UITableView *tblPeopleCube;
    IBOutlet UITableView *tblTeamsCube;
    
    IBOutlet UIView      *viewMostCubeReceive;
    IBOutlet UIView      *viewMostCubeSent;
    IBOutlet UIView      *viewTblContainer;
    IBOutlet UIView      *viewlblTeams;
    IBOutlet UIView      *viewlblPerson;
    IBOutlet UIView      *viewlblSentPerson;
    
    IBOutlet UIBarButtonItem *btnSlideMenu;
    
    IBOutlet UILabel     *lblTeams;
    IBOutlet UILabel     *lblPerson;

    IBOutlet ICCubeImageView *imgVCube;
    IBOutlet UIImageView     *imgVUserOfWeek;
    IBOutlet UIImageView     *imgVReceivedDropDown;
    IBOutlet UIImageView     *imgVSentDropDown;
    
    NSMutableArray *arrMostRcvSentCubesByPerson;
    NSMutableArray *arrMostRcvSentCubesByTeam;
    
    BOOL isDropReceive;
    BOOL isDropSent;
    BOOL isPopOver;
    
    ICPopOverView *popOverView;
    ICCubeOfTheWeekDHolder*cubeOfTheDHolder;
       
    AryaHUD *HUD;
    NSInteger rank;
      
    FPPopoverController *popOver;
}

-(IBAction)btnMostCubeReceivedClicked:(id)sender;
-(IBAction)btnMostCubeSentClicked:(id)sender;



@end
