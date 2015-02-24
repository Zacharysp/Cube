//
//  SideMenuViewController.m
//  IntegrityCubes
//
//  Created by aditi on 19/03/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//

#import "SideMenuViewController.h"
#import "MFSideMenu.h"
#import "ICAppDelegate.h"

@interface SideMenuViewController ()

@end

@implementation SideMenuViewController

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
    
    settable=NO;
    currentExpandedIndex = -1;
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(userDetailSuccess:) name:NOTIFICATION_USER_DETAIL_SUCCESS object:nil];
    
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(logoutFailed:) name:NOTIFICATION_LOGOUT_FAILED object:nil];
//     [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(logoutSuccess:) name:NOTIFICATION_LOGOUT_FAILED object:nil];
    
    arrSlideMenu=[[NSMutableArray alloc]init];
    arrSlideMenuImage=[[NSMutableArray alloc]init];
    
    arrManageItems=[[NSMutableArray alloc]initWithObjects:@"Edit Social Links",@"Notification",@"Change Password",@"Log out",nil];
    arrManageItemsImage=[[NSMutableArray alloc]initWithObjects:@"editLinkIphone.png",
                                                               @"notification.png",
                                                               @"changePwdIphone.png",
                                                               @"btnLogoutIphone.png",nil];
    
    imgDrop=[[UIImageView alloc]initWithFrame:CGRectMake(230, 10, 16, 16)];
    
    if([loginDHolder.strUserType isEqual:@"General"])
    {
        arrSlideMenu=[NSMutableArray arrayWithObjects:@"Home",
                      @"My Profile",
                      @"Teams",
                      @"The Cube Board",
                      @"Cube Translator",
                      @"Manage Setting",nil];
        
        arrSlideMenuImage=[NSMutableArray arrayWithObjects:@"homeIphone.png",
                           @"profileIphone.png",
                           @"teamIphone.png",
                           @"leaderBoardIphone.png",
                           @"cubeTranslatorIphone.png",
                           @"setting.png",nil];
        
        tblSlideMenu.frame=CGRectMake(tblSlideMenu.frame.origin.x, tblSlideMenu.frame.origin.y, tblSlideMenu.frame.size.width, 210);
    }
    else
    {
        arrSlideMenu=[NSMutableArray arrayWithObjects:@"Home",
                      @"My Profile",
                      @"Teams",
                      @"Report",
                      @"Cube Translator",
                      @"Manage Setting",nil];
        
        arrSlideMenuImage=[NSMutableArray arrayWithObjects:@"homeIphone.png",
                           @"profileIphone.png",
                           @"teamIphone.png",
                           @"reportIphone.png",
                           @"cubeTranslatorIphone.png",
                           @"setting.png",nil];
        
        tblSlideMenu.frame=CGRectMake(tblSlideMenu.frame.origin.x, tblSlideMenu.frame.origin.y, tblSlideMenu.frame.size.width, 210);
        
    }
    tblSlideMenu.scrollEnabled=NO;
    
}

-(void)userDetailSuccess:(NSNotification*)notification
{
    [self userDetails];
    
}
-(void)userDetails
{
    lblName.text=[NSString stringWithFormat:@"%@ %@",loginDHolder.strFirstName,loginDHolder.strLastName];
    [imgUserProfile setImageWithUrl:[NSURL URLWithString:loginDHolder.strUserImageUrl]
                      andPlaceHoder:[UIImage imageNamed:NO_IMAGE_AVAILABLE]
                         andNoImage:[UIImage imageNamed:NO_IMAGE]];
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    lblName.text=[NSString stringWithFormat:@"%@ %@",loginDHolder.strFirstName,loginDHolder.strLastName];
    [imgUserProfile setImageWithUrl:[NSURL URLWithString:loginDHolder.strUserImageUrl]
                      andPlaceHoder:[UIImage imageNamed:NO_IMAGE_AVAILABLE]
                         andNoImage:[UIImage imageNamed:NO_IMAGE]];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(indexPath.row<6)
    {
        return 35;
        
    }else{
        
        return 30;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    

   
    return [arrSlideMenu count] + ((currentExpandedIndex > -1) ?[arrManageItems count] : 0);
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ParentCellIdentifier = @"ParentCell";
    static NSString *ChildCellIdentifier = @"ChildCell";
    
    BOOL isChild =
    currentExpandedIndex > -1
    && indexPath.row > currentExpandedIndex
    && indexPath.row <= currentExpandedIndex + [arrManageItems count];
    
    UITableViewCell *cell;
    
    if (isChild)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:ChildCellIdentifier];
    }
    else
    {
        cell = [tableView dequeueReusableCellWithIdentifier:ParentCellIdentifier];
    }
    
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ParentCellIdentifier];
    }
    
    UIFont *myFont = [ UIFont fontWithName: @"Arial" size:15 ];
    cell.textLabel.font  = myFont;
    cell.backgroundColor= [UIColor colorWithWhite:0.7f alpha:0.2f];
    
    if (isChild)
    {
        cell.detailTextLabel.text = [arrManageItems objectAtIndex:indexPath.row - currentExpandedIndex - 1];
        cell.imageView.image=[UIImage imageNamed:[arrManageItemsImage objectAtIndex:indexPath.row - currentExpandedIndex - 1]];
    }
    else
    {
        NSInteger topIndex = (currentExpandedIndex > -1 && indexPath.row > currentExpandedIndex)
        ? indexPath.row - [arrManageItems count]
        : indexPath.row;
        cell.textLabel.text = [NSString stringWithFormat:@"%@",[arrSlideMenu objectAtIndex:topIndex]];
        cell.imageView.image=[UIImage imageNamed:[arrSlideMenuImage objectAtIndex:topIndex]];
        cell.detailTextLabel.text = @"";
    }
    if (arrSlideMenu.count==5)
    {
        if (indexPath.row==4)
        {
            imgDrop.image=[UIImage imageNamed:@"menuDrop.png"];
            [cell.contentView addSubview:imgDrop];
        }
    }
    else
    {
        if (indexPath.row==5)
        {
            imgDrop.image=[UIImage imageNamed:@"menuDrop.png"];
            [cell.contentView addSubview:imgDrop];
        }
    }
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([loginDHolder.strUserType isEqual:@"General"])
    {
        if (indexPath.row ==0)
        {
            if (!homeViewController)
            {
                homeViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"homeViewController"];
            }
            UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
            NSArray *controllers = [NSArray arrayWithObject:homeViewController];
            navigationController.viewControllers = controllers;
//            homeViewController.delegate = self;
            [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
        }
        else if (indexPath.row ==1)
        {
            if (!profileViewController)
            {
                profileViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"profileViewController"];
            }
            
            UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
            NSArray *controllers = [NSArray arrayWithObject:profileViewController];
            navigationController.viewControllers = controllers;
            [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
            
            
        }
        else if (indexPath.row == 2)
        {
            if (!teamViewController)
            {
                teamViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"teamViewController"];
            }
            UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
            NSArray *controllers = [NSArray arrayWithObject:teamViewController];
            navigationController.viewControllers = controllers;
            [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
            
        }
        else if (indexPath.row == 3){
            
            if (!leaderBoardViewController)
            {
                leaderBoardViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"leaderBoardViewController"];
            }
            UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
            NSArray *controllers = [NSArray arrayWithObject:leaderBoardViewController];
            navigationController.viewControllers = controllers;
            [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
            
        }

        else if (indexPath.row == 4){
            
            if (!cubeTranslatorViewController)
            {
                cubeTranslatorViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"cubeTranslatorViewController"];
            }
            UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
            NSArray *controllers = [NSArray arrayWithObject:cubeTranslatorViewController];
            navigationController.viewControllers = controllers;
            [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
            
        }
        else if (indexPath.row == 5)
        {
            [tblSlideMenu beginUpdates];
            if (currentExpandedIndex == indexPath.row)
            {
                [self collapseSubItemsAtIndex:currentExpandedIndex];
                currentExpandedIndex = -1;
                UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
                imgDrop.image=[UIImage imageNamed:@"menuDrop.png"];
                [cell.contentView addSubview:imgDrop];
                
            }
            else
            {
                BOOL shouldCollapse = currentExpandedIndex > -1;
                if (shouldCollapse)
                {
                    [self collapseSubItemsAtIndex:currentExpandedIndex];
                }
                currentExpandedIndex = (shouldCollapse && indexPath.row > currentExpandedIndex) ? indexPath.row - [arrManageItems count] : indexPath.row;
                [self expandItemAtIndex:currentExpandedIndex];
                UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
                imgDrop.image=[UIImage imageNamed:@"menuDropUp.png"];
                [cell.contentView addSubview:imgDrop];
                
            }
            [tblSlideMenu endUpdates];
        }
        else if(indexPath.row == 6)
        {
            if (!editLinksViewController)
            {
                editLinksViewController = [self.storyboard
                                           instantiateViewControllerWithIdentifier:@"editLinksViewController"];
            }
            
            UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
            NSArray *controllers = [NSArray arrayWithObject:editLinksViewController];
            navigationController.viewControllers = controllers;
            [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
            
        }
        
        
        else if(indexPath.row == 7)
        {
            if(!icslideNotificationViewController){
            icslideNotificationViewController = [self.storyboard
                                               instantiateViewControllerWithIdentifier:@"SlideNotification"];
            }
                UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
            NSArray *controllers = [NSArray arrayWithObject:icslideNotificationViewController];
            navigationController.viewControllers = controllers;
            [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];

        
        }
        
        else if(indexPath.row == 8)
        {
            if (!changePwdViewController)
            {
                changePwdViewController = [self.storyboard
                                           instantiateViewControllerWithIdentifier:@"changePwdViewController"];
            }
            
            UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
            NSArray *controllers = [NSArray arrayWithObject:changePwdViewController];
            navigationController.viewControllers = controllers;
            [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
        }
        
        else if(indexPath.row == 9)
        {
            if([ICUtils isConnectedToHost]) {
                
                [self requestLogout];
                [self dismissViewControllerAnimated:YES completion:NULL];
                [[ICDataBaseInteraction databaseInteractionManager]clearUserNotificationData];
                [[ICDataBaseInteraction databaseInteractionManager]clearUserCubeData];
                ICAppDelegate *appdelegate = (ICAppDelegate *)[UIApplication sharedApplication].delegate;
                [appdelegate logout];
                
            }
            
            
            
            else{
                
                [ICUtils showAlert:MESSAGE_NET_NOT_AVAILABLE];
            }
        }
    }
    else{
        
        if (indexPath.row ==0){
            
            if (!homeViewController) {
                
                homeViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"homeViewController"];
            }
            
            UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
            NSArray *controllers = [NSArray arrayWithObject:homeViewController];
            navigationController.viewControllers = controllers;
//            homeViewController.delegate = self;
            homeViewController.delegate = self;
            [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
            
        }
        else if (indexPath.row ==1){
            
            if (!profileViewController)
            {
                profileViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"profileViewController"];
            }
            
            UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
            NSArray *controllers = [NSArray arrayWithObject:profileViewController];
            navigationController.viewControllers = controllers;
            [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
                
        }
        else if (indexPath.row ==2){
            
            if (!teamViewController) {
                teamViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"teamViewController"];
            }
            
            UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
            NSArray *controllers = [NSArray arrayWithObject:teamViewController];
            navigationController.viewControllers = controllers;
            [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
            
        }
        else if (indexPath.row == 3){
            
            ICReportViewController *reportViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"reportViewController"];
            
            UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
            NSArray *controllers = [NSArray arrayWithObject:reportViewController];
            navigationController.viewControllers = controllers;
            [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
            
        }
        else if(indexPath.row == 4)
        {
            if (!cubeTranslatorViewController)
            {
                cubeTranslatorViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"cubeTranslatorViewController"];
            }
            UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
            NSArray *controllers = [NSArray arrayWithObject:cubeTranslatorViewController];
            navigationController.viewControllers = controllers;
            [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
        }
        else if (indexPath.row == 5)
        {
            [tblSlideMenu beginUpdates];
            if (currentExpandedIndex == indexPath.row)
            {
                [self collapseSubItemsAtIndex:currentExpandedIndex];
                currentExpandedIndex = -1;
                UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
                imgDrop.image=[UIImage imageNamed:@"menuDrop.png"];
                [cell.contentView addSubview:imgDrop];
                
            }
            else
            {
                BOOL shouldCollapse = currentExpandedIndex > -1;
                if (shouldCollapse)
                {
                    [self collapseSubItemsAtIndex:currentExpandedIndex];
                }
                
              
                currentExpandedIndex = (shouldCollapse && indexPath.row > currentExpandedIndex) ? indexPath.row - [arrManageItems count] : indexPath.row;
                [self expandItemAtIndex:currentExpandedIndex];
                UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
                imgDrop.image=[UIImage imageNamed:@"menuDropUp.png"];
                [cell.contentView addSubview:imgDrop];
                
            }
            [tblSlideMenu endUpdates];
        }
        else if(indexPath.row == 6)
        {
            if (!editLinksViewController)
            {
                editLinksViewController = [self.storyboard
                                           instantiateViewControllerWithIdentifier:@"editLinksViewController"];
            }
            
            UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
            NSArray *controllers = [NSArray arrayWithObject:editLinksViewController];
            navigationController.viewControllers = controllers;
            [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
        }
        
        else if(indexPath.row == 7)
                            {
          if(!icslideNotificationViewController)
          {
               icslideNotificationViewController = [self.storyboard
                            instantiateViewControllerWithIdentifier:@"SlideNotification"];
          }
                                
            UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
            NSArray *controllers = [NSArray arrayWithObject:icslideNotificationViewController];
            navigationController.viewControllers = controllers;
            [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
        }
        
        else if(indexPath.row == 8)
        {
            if (!changePwdViewController)
            {
                changePwdViewController = [self.storyboard
                                           instantiateViewControllerWithIdentifier:@"changePwdViewController"];
            }
            
            UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
            NSArray *controllers = [NSArray arrayWithObject:changePwdViewController];
            navigationController.viewControllers = controllers;
            [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
        }
        
        else if(indexPath.row == 9)
        {
            if([ICUtils isConnectedToHost]) {
                
                [self requestLogout];
                [self dismissViewControllerAnimated:YES completion:NULL];
                [[ICDataBaseInteraction databaseInteractionManager]clearUserNotificationData];
                [[ICDataBaseInteraction databaseInteractionManager]clearUserCubeData];
                ICAppDelegate *appdelegate = (ICAppDelegate *)[UIApplication sharedApplication].delegate;
                [appdelegate logout];
                
            }
                    
            else{
                
                [ICUtils showAlert:MESSAGE_NET_NOT_AVAILABLE];
            }
        }
    }
}

- (void)expandItemAtIndex:(NSInteger)index
{
    NSMutableArray *indexPaths = [NSMutableArray new];
    NSArray *currentSubItems =(NSArray *)arrManageItems;
    NSInteger insertPos = index + 1;
    for (int i = 0; i < [currentSubItems count]; i++)
    {
        [indexPaths addObject:[NSIndexPath indexPathForRow:insertPos++ inSection:0]];
    }
    [tblSlideMenu insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    
    tblSlideMenu.frame=CGRectMake(tblSlideMenu.frame.origin.x, tblSlideMenu.frame.origin.y, tblSlideMenu.frame.size.width, tblSlideMenu.frame.size.height+120);
    [UIView commitAnimations];
    
    [tblSlideMenu scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0] atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
}

- (void)collapseSubItemsAtIndex:(NSInteger)index
{
    NSMutableArray *indexPaths = [NSMutableArray new];
    for (NSInteger i = index + 1; i <= index + [arrManageItems count]; i++) {
        [indexPaths addObject:[NSIndexPath indexPathForRow:i inSection:0]];
    }
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    
    tblSlideMenu.frame=CGRectMake(tblSlideMenu.frame.origin.x, tblSlideMenu.frame.origin.y, tblSlideMenu.frame.size.width, tblSlideMenu.frame.size.height-120);
    [UIView commitAnimations];
    
    [tblSlideMenu deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
}

#pragma mark API CALLING

-(void)requestLogout{
    
    if([ICUtils isConnectedToHost])
    {
        [[ICRestIntraction sharedManager]requestForLogout];
    }
    else
    {
        [ICUtils showAlert:MESSAGE_NET_NOT_AVAILABLE];
    }
}

-(void)updateSlideTable{
    
    [[tblSlideMenu delegate]
     tableView:tblSlideMenu
     didSelectRowAtIndexPath:0];
    
    [tblSlideMenu selectRowAtIndexPath:0
                              animated:YES
                        scrollPosition:UITableViewScrollPositionNone];
}
@end
