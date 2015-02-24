//
//  ICForgotPwdViewController.h
//  IntegrityCubes
//
//  Created by aditi on 13/03/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Validate.h"
#import "ASIFormDataRequest.h"

@interface ICForgotPwdViewController : UIViewController{
    
    IBOutlet UITextField *txtFEmail;
    IBOutlet UIView   *bgForgotPwdView;
    IBOutlet UIButton *btnSubmit;
}
/**
 Hide the keyBoard.
 */
-(IBAction)ReturnKeyButton:(id)sender;
-(IBAction)btnSubmitDidClicked:(id)sender;
-(IBAction)btnBackDidClicked:(id)sender;
@end
