//
//  ICForgotPwdViewController.m
//  IntegrityCubes
//
//  Created by aditi on 13/03/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//

#import "ICForgotPwdViewController.h"

@interface ICForgotPwdViewController ()

@end

@implementation ICForgotPwdViewController


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
    txtFEmail.leftView= [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"userIphone.png"]];
    [txtFEmail setLeftViewMode:UITextFieldViewModeAlways];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(forgetPwdSuccess:) name:NOTIFICATION_FORGOT_PWD_SUCCESS object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(forgetPwdFailed:) name:NOTIFICATION_FORGOT_PWD_FAILED object:nil];

    btnSubmit.layer.cornerRadius=4.0f;
    btnSubmit.layer.masksToBounds=YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [txtFEmail resignFirstResponder];
    [self keyboardDisappeared];
}


-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [self keyboardAppeared];
    return  YES;
}
-(void) keyboardAppeared
{
    [UIView beginAnimations:@"animate" context:nil];
    [UIView setAnimationDuration:0.2f];
    [UIView setAnimationBeginsFromCurrentState: NO];
    
    bgForgotPwdView.frame = CGRectMake(0,-110, bgForgotPwdView.frame.size.width, bgForgotPwdView.frame.size.height);
    
    [UIView commitAnimations];
}
-(void) keyboardDisappeared
{
    [UIView beginAnimations:@"animate" context:nil];
    [UIView setAnimationDuration:0.2f];
    [UIView setAnimationBeginsFromCurrentState: NO];
    
    if ([[UIScreen mainScreen] bounds].size.height==568)
    {
       bgForgotPwdView.frame =CGRectMake(0,0,  bgForgotPwdView.frame.size.width, bgForgotPwdView.frame.size.height);
        
        //this is iphone 5
    } else
    {
       bgForgotPwdView.frame =CGRectMake(0,0,  bgForgotPwdView.frame.size.width, bgForgotPwdView.frame.size.height);
        
        // this is iphone 4
    }
   [UIView commitAnimations];
}

#pragma mark - IB_ACTIONS

-(IBAction)ReturnKeyButton:(id)sender
{
    [sender resignFirstResponder];
    [self keyboardDisappeared];
    
}
-(IBAction)btnBackDidClicked:(id)sender{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)btnSubmitDidClicked:(id)sender{
    
    if ([Validate isValidEmailId:txtFEmail.text])
    {
        if([ICUtils isConnectedToHost])
        {
     
            NSMutableDictionary *info = [NSMutableDictionary dictionary];
            [info setValue:txtFEmail.text forKey:@"user_email"];
            [self performSelector:@selector(requestForgotPwd:) withObject:info];
            
        }
        else
        {
            [ICUtils showAlert:MESSAGE_NET_NOT_AVAILABLE];
        }
        
    }else{
        
        [ICUtils showAlert:MESSAGE_EMAIL_NOT_VALID];
        return;
    }
    
}

#pragma mark  - API CALLING
-(void)requestForgotPwd:(NSMutableDictionary*)info{
    
    if([ICUtils isConnectedToHost])
    {
        [[ICRestIntraction sharedManager]requestForForgotPwd:info];
    }
    else{
        
        [ICUtils showAlert:MESSAGE_NET_NOT_AVAILABLE];
    }
    
}

#pragma mark -  NOTIFICATION SELECTORS

-(void)forgetPwdSuccess:(NSNotification*)notification{
    
    [ICUtils showAlert:MESSAGE_NEW_PASSWORD_SENT];
}
-(void)forgetPwdFailed:(NSNotification*)notification{

    NSString *errMsg = (NSString*)notification.object;
    [ICUtils showAlert:errMsg];
}


@end
