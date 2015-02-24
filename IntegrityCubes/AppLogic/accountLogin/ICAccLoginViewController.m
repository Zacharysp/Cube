//
//  ICAccLoginViewController.m
//  IntegrityCubes
//
//  Created by aditi on 13/03/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//
#import "MFSideMenuContainerViewController.h"
#import "ICAccLoginViewController.h"

@interface ICAccLoginViewController ()

@end

@implementation ICAccLoginViewController

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
    txtFPwd.leftView= [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"passwordIphone.png"]];
    [txtFPwd setLeftViewMode:UITextFieldViewModeAlways];
    
    
    UIButton *btnLogo = [UIButton buttonWithType:UIButtonTypeCustom];
    btnLogo = [[UIButton alloc]initWithFrame:CGRectMake(0,4,120,30)];
    [btnLogo setImage:[UIImage imageNamed:@"logo.png"] forState:UIControlStateNormal];
    //btnLogo.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"logo.png"]];
    
    btnLogoImage = [[UIBarButtonItem alloc] initWithCustomView:btnLogo];
    self.navigationItem.titleView=nil;
    self.navigationItem.leftBarButtonItem=nil;
    self.navigationItem.leftBarButtonItem = btnLogoImage;
    [navBar setItems:[NSArray arrayWithObject:self.navigationItem]];
    
    HUD=[AryaHUD new];
    [self.view addSubview:HUD];
    HUD.userInteractionEnabled=YES;
    
    btnSubmit.layer.cornerRadius=4.0f;
    btnSubmit.layer.masksToBounds=YES;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(loginSuccess:) name:NOTIFICATION_LOGIN_SUCCESS object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(loginFailed:) name:NOTIFICATION_LOGIN_FAILED object:nil];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:NOTIFICATION_LOGIN_SUCCESS object:nil];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:NOTIFICATION_LOGIN_FAILED object:nil];
    [self keyboardDisappeared];
}
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [self keyboardAppeared];
    return  YES;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [txtFEmail resignFirstResponder];
    [txtFPwd resignFirstResponder];
    [self keyboardDisappeared];
}
-(void) keyboardAppeared
{
    [UIView beginAnimations:@"animate" context:nil];
    [UIView setAnimationDuration:0.2f];
    [UIView setAnimationBeginsFromCurrentState: NO];
    
    bgView.frame = CGRectMake(0,-120, bgView.frame.size.width, bgView.frame.size.height);
    
    [UIView commitAnimations];
}
-(void) keyboardDisappeared
{
    [UIView beginAnimations:@"animate" context:nil];
    [UIView setAnimationDuration:0.2f];
    [UIView setAnimationBeginsFromCurrentState: NO];
    
    if (IS_IPHONE_5)
    {
        bgView.frame =CGRectMake(0,0,  bgView.frame.size.width, bgView.frame.size.height);
        //this is iphone 5
    } else
    {
        bgView.frame =CGRectMake(0,0,  bgView.frame.size.width, bgView.frame.size.height);
      // this is iphone 4
    }
    [UIView commitAnimations];
    [txtFEmail resignFirstResponder];
    [txtFPwd resignFirstResponder];
}

#pragma mark - IB_ACTIONS
-(IBAction)ReturnKeyButton:(id)sender
{
    [sender resignFirstResponder];
    [self keyboardDisappeared];
   
}
-(IBAction)btnSubmitClicked:(id)sender
{
    [self keyboardDisappeared];
    if ([Validate isValidEmailId:txtFEmail.text] || [Validate isValidMobileNumber:txtFEmail.text])
    {
        if (txtFPwd.text.length == 0)
        {
            [ICUtils showAlert:@"Please enter Password."];
            return;
        }
           if([ICUtils isConnectedToHost])
            {
                 NSMutableDictionary *info = [NSMutableDictionary dictionary];
                [info setValue:txtFEmail.text forKey:@"user_email"];
                [info setValue:txtFPwd.text forKey:@"user_password"];
                
                [HUD show];
                [self requestLogin:info];
                
            }
             else{
            
                  [ICUtils showAlert:MESSAGE_NET_NOT_AVAILABLE];
            }
        
    }
   else{
            
            [ICUtils showAlert:MESSAGE_EMAIL_NOT_VALID];
            return;
    }
    
}
#pragma mark  - API CALLING
    
-(void)requestLogin:(NSMutableDictionary*)info{
    
    if([ICUtils isConnectedToHost])
    {
         [[ICRestIntraction sharedManager]requestForLogin:info];
    }
    else
    {        
        [ICUtils showAlert:MESSAGE_NET_NOT_AVAILABLE];
        
    }
}
#pragma mark - NOTIFICATION SELECTORS

-(void)loginSuccess:(NSNotification*)notification
{
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:KEY_NOTIFICATION_FIRST];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [HUD hide];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:[NSBundle mainBundle]];
    
    MFSideMenuContainerViewController *container = (MFSideMenuContainerViewController *)[storyboard instantiateViewControllerWithIdentifier:@"MFSideMenuContainerViewController"];
    
    UINavigationController *navigationController = (UINavigationController*)[storyboard instantiateViewControllerWithIdentifier:@"navigationController"];
    
    UIViewController *rightSideMenuViewController = (UIViewController*)[storyboard instantiateViewControllerWithIdentifier:@"rightSideMenuViewController"];
    
    [container setRightMenuViewController:rightSideMenuViewController];
    [container setCenterViewController:navigationController];
    
    [HUD hide];
    UIWindow *window = [[UIApplication sharedApplication].windows objectAtIndex:0];
    window.rootViewController = container;
    [[NSUserDefaults standardUserDefaults]setValue:loginDHolder.strBamBooId forKey:KEY_USER_BAMBOO_ID];
    [[NSUserDefaults standardUserDefaults]setValue:loginDHolder.strCity forKey:KEY_USER_CITY];
    [[NSUserDefaults standardUserDefaults]setValue:loginDHolder.strDivision forKey:KEY_USER_DIVISION];
    [[NSUserDefaults standardUserDefaults]setValue:loginDHolder.strEmail forKey:KEY_USER_EMAIL];
    [[NSUserDefaults standardUserDefaults]setValue:loginDHolder.strFirstName forKey:KEY_USER_FIRST_NAME];
    [[NSUserDefaults standardUserDefaults]setValue:[NSString stringWithFormat:@"%ld",(long)loginDHolder.icUserId] forKey:KEY_USER_ID];
    [[NSUserDefaults standardUserDefaults]setValue:loginDHolder.strUserImageUrl forKey:KEY_USER_IMG_URL];
    [[NSUserDefaults standardUserDefaults]setValue:loginDHolder.strJobTitle forKey:KEY_USER_JOB_TITLE];
    [[NSUserDefaults standardUserDefaults]setValue:loginDHolder.strLastName forKey:KEY_USER_LAST_NAME];
    [[NSUserDefaults standardUserDefaults]setValue:loginDHolder.strUserName forKey:KEY_USER_NAME];
    [[NSUserDefaults standardUserDefaults]setValue:loginDHolder.strPhone forKey:KEY_USER_PHONE];
    [[NSUserDefaults standardUserDefaults]setValue:loginDHolder.strState forKey:KEY_USER_STATE];
    [[NSUserDefaults standardUserDefaults]setValue:loginDHolder.strUserType forKey:KEY_USER_TYPE];
    
    if (loginDHolder.arrTeamId.count>0) {
        NSString *strTeamId=[[loginDHolder.arrTeamId objectAtIndex:0] valueForKey:@"team_id"];
        [[NSUserDefaults standardUserDefaults]setValue:strTeamId forKey:KEY_USER_TEAM_ID];
    }
    
    hostReachable = [Reachability reachabilityWithHostName: @"www.google.com"] ;
   [hostReachable startNotifier];
}
-(void)loginFailed:(NSNotification*)notification
{
    NSString *strErrMessage=(NSString *)notification.object;
    
    [HUD hide];
    [ICUtils showAlert:strErrMessage];
}


@end
