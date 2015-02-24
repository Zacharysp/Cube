//
//  SideMenuViewController.h
//  IntegrityCubes
//
//  Created by aditi on 19/03/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICHomeViewController.h"
#import "ICAccLoginViewController.h"
#import "ICProfileViewController.h"
#import "ICTeamViewController.h"
#import "ICReportViewController.h"
#import "ICCubeTranslatorViewController.h"
#import "ICChangePwdViewController.h"
#import "ICEditLinksViewController.h"
#import "ICLeaderBoardViewController.h"
#import "ICSlideNotificationViewController.h"

@interface SideMenuViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UpdateSlideTableDelegate>{
    
    NSMutableArray   *arrSlideMenu;
    NSMutableArray   *arrSlideMenuImage;
    NSMutableArray   *arrManageItems;
    NSMutableArray   *arrManageItemsImage;
    
    IBOutlet UITableView  *tblSlideMenu;
    IBOutlet UILabel      *lblName;
    IBOutlet UIImageView  *imgUserProfile;
   
    NSMutableIndexSet     *expandedSections;
    UIImageView           *imgDrop;
    NSInteger             currentExpandedIndex;
    
    
    ICProfileViewController        *profileViewController;
    ICTeamViewController           *teamViewController;
    ICCubeTranslatorViewController *cubeTranslatorViewController;
    ICChangePwdViewController      *changePwdViewController;
    ICEditLinksViewController      *editLinksViewController;
    ICLeaderBoardViewController    *leaderBoardViewController;
    ICSlideNotificationViewController    *icslideNotificationViewController;
    BOOL settable;
    
}

@end
