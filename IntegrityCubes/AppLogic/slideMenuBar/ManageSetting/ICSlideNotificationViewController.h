//
//  ICSlideNotificationViewController.h
//  Cube
//
//  Created by Balkaran on 01/11/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MFSideMenu.h"

@interface ICSlideNotificationViewController : UIViewController
{   
    IBOutlet UIButton *btnUpdate;
    NSString *String_post;
    NSString *String_like;
    NSString *String_Cmt;
    NSString *String_teamcube;
    
   IBOutlet UILabel *lbl_team;
   IBOutlet UIView *view_team;
    
    AryaHUD *HUD;
}
-(IBAction)showRightMenuPressed:(id)sender;
@property (strong, nonatomic) IBOutlet UISwitch *Switch_post;
@property (strong, nonatomic) IBOutlet UISwitch *Switch_like;
@property (strong, nonatomic) IBOutlet UISwitch *Switch_Cmt;
@property(strong,nonatomic) IBOutlet UISwitch *Switch_teamcube;


- (IBAction)Update:(id)sender;

@end
