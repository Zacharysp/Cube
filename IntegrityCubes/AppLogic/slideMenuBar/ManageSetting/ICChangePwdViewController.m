//
//  ICChangePwdViewController.m
//  IntegrityCubes
//
//  Created by aditi on 29/04/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//

#import "ICChangePwdViewController.h"

@interface ICChangePwdViewController ()

@end

@implementation ICChangePwdViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changePwdSuccess:) name:NOTIFICATION_CHANGE_PWD_SUCCESS object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changePwdFailed:) name:NOTIFICATION_CHANGE_PWD_FAILED object:nil];
    
    btnUpdate.layer.cornerRadius = 4.0f;
    btnUpdate.layer.masksToBounds = YES;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [txtFOldPwd resignFirstResponder];
    [txtFConfirmPwd resignFirstResponder];
    [txtFNewPwd resignFirstResponder];
    
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if([string isEqualToString:@" "])
    {
        return NO;
    }
    else
    {
        return YES;
    }

}
#pragma mark - IB_ACTIONS
- (IBAction)showRightMenuPressed:(id)sender{
    
    [self.menuContainerViewController toggleRightSideMenuCompletion:nil];
}
-(IBAction)ReturnKeyButton:(id)sender
{
    [sender resignFirstResponder];
    
}
-(IBAction)btnUpdateDidClicked:(id)sender{
    
    if(![txtFNewPwd.text isEqual:@""] && ![txtFConfirmPwd.text isEqual:@""]&& ![txtFOldPwd.text isEqual:@""])
    {
        if ([txtFNewPwd.text isEqual:txtFConfirmPwd.text])
        {
            if([ICUtils isConnectedToHost])
            {
                [HUD show];
                NSMutableDictionary *info = [NSMutableDictionary dictionary];
                [info setValue:txtFNewPwd.text forKey:@"newPassword"];
                [info setValue:txtFOldPwd.text forKey:@"oldPassword"];
                [info setValue:[NSString stringWithFormat:@"%ld",(long)loginDHolder.icUserId] forKey:@"userid"];
                
                [self performSelector:@selector(requestChangePwd:) withObject:info];
                
            }
            else
            {
                [ICUtils showAlert:MESSAGE_NET_NOT_AVAILABLE];
            }
        }
       else{
            
            [ICUtils showAlert:@"Password does not match."];
            return;
        }
        
    }else{
            
            [ICUtils showAlert:@"Please enter all password."];
            return;
     }
}
#pragma mark - API CALLING
-(void)requestChangePwd:(NSMutableDictionary*)info
{
    if([ICUtils isConnectedToHost])
    {
        [[ICRestIntraction sharedManager]requestForChangePassword:info];
    }
    else{
        
        [ICUtils showAlert:MESSAGE_NET_NOT_AVAILABLE];
    }
}
#pragma mark - NOTIFICATION SELECTORS
-(void)changePwdSuccess:(NSNotification*)notification
{
    txtFConfirmPwd.text=@"";
    txtFNewPwd.text=@"";
    txtFOldPwd.text=@"";
    
    [HUD hide];
    [ICUtils showAlert:@"Password successfully updated."];
}
-(void)changePwdFailed:(NSNotification*)notification
{
    
    [HUD hide];
    NSString *errMsg = (NSString*)notification.object;
    [ICUtils showAlert:errMsg];
}


@end
