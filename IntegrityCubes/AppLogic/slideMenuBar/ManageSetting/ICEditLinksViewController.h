//
//  ICEditLinksViewController.h
//  IntegrityCubes
//
//  Created by aditi on 29/04/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MFSideMenu.h"
#import "Validate.h"

@interface ICEditLinksViewController : UIViewController{
    
    IBOutlet UITextField *txtFFBLink;
    IBOutlet UITextField *txtFTwitterLink;
    IBOutlet UITextField *txtFLinkedinLink;
    
    IBOutlet UIButton *btnUpdate;
    
    AryaHUD *HUD;
    
}
-(IBAction)showRightMenuPressed:(id)sender;
-(IBAction)ReturnKeyButton:(id)sender;
-(IBAction)btnUpdateDidClicked:(id)sender;
@end
