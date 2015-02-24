//
//  ICEditLinksViewController.m
//  IntegrityCubes
//
//  Created by aditi on 29/04/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//

#import "ICEditLinksViewController.h"

@interface ICEditLinksViewController ()

@end

@implementation ICEditLinksViewController

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
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(editLinkSuccess:) name:NOTIFICATION_EDIT_LINK_SUCCESS object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(editLinkFailed:) name:NOTIFICATION_EDIT_LINK_FAILED object:nil];
    
    btnUpdate.layer.cornerRadius=4.0f;
    btnUpdate.layer.masksToBounds=YES;
     
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [txtFFBLink resignFirstResponder];
    [txtFTwitterLink resignFirstResponder];
    [txtFLinkedinLink resignFirstResponder];
    
}
#pragma mark - IB_ACTIONS
- (IBAction)showRightMenuPressed:(id)sender{
    
    [self.menuContainerViewController toggleRightSideMenuCompletion:nil];
}
-(IBAction)ReturnKeyButton:(id)sender
{
    [sender resignFirstResponder];
    
}
-(IBAction)btnUpdateDidClicked:(id)sender
{    
    NSMutableDictionary *info = [NSMutableDictionary dictionary];
    NSString *strTextField1;
    NSString *strTextField2;
    NSString *strTextField3;
    
    if(![txtFFBLink.text isEqualToString:@""]){
     
       strTextField1 =[txtFFBLink.text substringToIndex:1];
        
    }else{
        
        strTextField1=@"";
    }
    
    if (![txtFLinkedinLink.text isEqualToString:@""]) {
        
       strTextField2 =[txtFLinkedinLink.text substringToIndex:1];
        
    }else{
        
        strTextField2=@"";
    }
    
    if(![txtFTwitterLink.text isEqualToString:@""]){
        
      strTextField3 =[txtFTwitterLink.text substringToIndex:1];
        
    }else{
        
        strTextField3=@"";
    }
    
    if(![txtFFBLink.text isEqualToString:@""]||![txtFLinkedinLink.text isEqualToString:@""]||![txtFTwitterLink.text isEqualToString:@""])
    {
      if([Validate isValidUrl:txtFFBLink.text]||[txtFFBLink.text isEqualToString:@""])
      {
        if([Validate isValidUrl:txtFTwitterLink.text]||[txtFTwitterLink.text isEqualToString:@""])
        {
            if([Validate isValidUrl:txtFLinkedinLink.text]||[txtFLinkedinLink.text isEqualToString:@""])
            {
                if(![strTextField1 isEqual:@" "]&&![strTextField2 isEqual:@" "]&&![strTextField3 isEqual:@" "])
                {
                    [info setValue:txtFFBLink.text forKey:@"facebook"];
                    [info setValue:txtFLinkedinLink.text forKey:@"linkedin"];
                    [info setValue:txtFTwitterLink.text forKey:@"twitter"];
                    [info setValue:[NSString stringWithFormat:@"%ld",(long)loginDHolder.icUserId] forKey:@"userid"];
                    
                    [[NSUserDefaults standardUserDefaults] setObject:info forKey:@"EditLink"];
                    [[NSUserDefaults standardUserDefaults] synchronize];
                    
                    [self performSelector:@selector(requestEditLink:) withObject:info];

                }
                else{
                    
                    [ICUtils showAlert:@"Please enter valid links."];
                    return;
                }
           }else{
            
            [ICUtils showAlert:@"Please enter valid links."];
            return;
        }
        }else{
            [ICUtils showAlert:@"Please enter valid links."];
            return;
        }
      }else{
          
          [ICUtils showAlert:@"Please enter valid links."];
          return;
      }
    }else{
        [ICUtils showAlert:@"Please enter links."];
        return;
    }
}
#pragma mark - API CALLING
-(void)requestEditLink:(NSMutableDictionary*)info
{
    if([ICUtils isConnectedToHost])
    {
        [[ICRestIntraction sharedManager]requestForEditLink:info];
    }
    else{
        
        [ICUtils showAlert:MESSAGE_NET_NOT_AVAILABLE];
    }
}
#pragma mark - NOTIFICATION SELECTORS
-(void)editLinkSuccess:(NSNotification*)notification
{
    txtFTwitterLink.text=@"";
    txtFLinkedinLink.text=@"";
    txtFFBLink.text=@"";
    
    [HUD hide];
    [ICUtils showAlert:@"Link successfully updated."];
}
-(void)editLinkFailed:(NSNotification*)notification
{
    [HUD hide];
    
    txtFTwitterLink.text=@"";
    txtFLinkedinLink.text=@"";
    txtFFBLink.text=@"";
    NSString *errMsg = (NSString*)notification.object;
    [ICUtils showAlert:errMsg];
}


@end
