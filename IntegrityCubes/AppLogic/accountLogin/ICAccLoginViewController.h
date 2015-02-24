//
//  ICAccLoginViewController.h
//  IntegrityCubes
//
//  Created by aditi on 13/03/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBJSON.h"
#import "Validate.h"
#import "ASIFormDataRequest.h"

@interface ICAccLoginViewController : UIViewController
{    
    IBOutlet UIView      *bgView;
    IBOutlet UITextField *txtFEmail;
    IBOutlet UITextField *txtFPwd;
    IBOutlet UINavigationBar *navBar;
    
    UIBarButtonItem   *btnLogoImage;
    IBOutlet UIButton *btnSubmit;
    
    AryaHUD *HUD;
}

-(IBAction)btnSubmitClicked:(id)sender;
-(IBAction)ReturnKeyButton:(id)sender;
@end
