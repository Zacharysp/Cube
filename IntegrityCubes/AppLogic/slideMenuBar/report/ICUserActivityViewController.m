//
//  ICUserActivityViewController.m
//  IntegrityCubes
//
//  Created by Bhuvan Sharma on 07/04/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//

#import "ICUserActivityViewController.h"

@interface ICUserActivityViewController ()

@end

@implementation ICUserActivityViewController

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
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getNoUserActivitySuccess:) name:NOTIFICATION_NO_USER_ACTIVITY_SUCCESS object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getNoUserActivityFailed:) name:NOTIFICATION_NO_USER_ACTIVITY_FAILED object:nil];
    
    if (IS_IPHONE_5)
    {
        tblNoCubeSent.frame=CGRectMake(5, 52, 310, 205);
        viewNoReceive.frame=CGRectMake(0, 288, 320, 35);
        tblNoCubeReceive.frame=CGRectMake(5, 356, 310, 205);
        
    }
    else
    {
        tblNoCubeSent.frame=CGRectMake(5, 55, 310, 160);
        viewNoReceive.frame=CGRectMake(0, 245, 320, 35);
        tblNoCubeReceive.frame=CGRectMake(5, 313, 310, 160);
    }
   
    HUD=[[AryaHUD alloc]init];
    [self.view addSubview:HUD];
    [HUD show];
    
    tblNoCubeReceive.tableFooterView = [UIView new];
    tblNoCubeSent.tableFooterView = [UIView new];
    
    [self requestNoUserActivity:nil];

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITABLEVIEW DELEGATE DATASOURCE METHODS

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(IS_IPHONE_5){
        
        return 41;
        
    }else{
        
        return 40;
    }
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView == tblNoCubeReceive)
    {
        return arrNoCubeReceived.count;
        
    }else
    {
        return arrNoCubeSent.count;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView ==tblNoCubeReceive){
        
        NSString *cellIdentifier = @"noCubeReceiveCell";
        UITableViewCell *cell = nil;
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
      
        tableView.separatorColor=[UIColor colorWithRed:220.0/255 green:217.0/255 blue:219.0/255 alpha:1];
        ICMostCubesRcvSentDHolder *noCubeRcvDHolder=(ICMostCubesRcvSentDHolder*)[arrNoCubeReceived objectAtIndex:indexPath.row];
        
        if (!cell) {
            
            cell = [[UITableViewCell alloc]
                    initWithStyle:UITableViewCellStyleDefault
                    reuseIdentifier:cellIdentifier];
        }
        
        UILabel    *lblUserName = (UILabel *)[cell.contentView viewWithTag:1];
        lblUserName.text=noCubeRcvDHolder.strUserName;
        
        UIImageView   *imgUserName=(UIImageView *)[cell.contentView viewWithTag:2];
        [imgUserName removeFromSuperview];
        imgUserName=nil;
        imgUserName = [[UIImageView alloc]initWithFrame:CGRectMake(8, 5, 30, 30)];
        imgUserName.tag=2;
        [cell.contentView addSubview:imgUserName];
        
        [imgUserName setImageWithUrl:[NSURL URLWithString:noCubeRcvDHolder.strUserImageUrl]
                       andPlaceHoder:[UIImage imageNamed:NO_IMAGE_AVAILABLE]
                          andNoImage:[UIImage imageNamed:NO_IMAGE]];
        imgUserName.layer.cornerRadius=2.0f;
        imgUserName.layer.masksToBounds=YES;
        return cell;
        

    }else{
        
        NSString *cellIdentifier = @"noCubeSentCell";
        UITableViewCell *cell = nil;
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        
        tableView.separatorColor=[UIColor colorWithRed:220.0/255 green:217.0/255 blue:219.0/255 alpha:1];
        ICMostCubesRcvSentDHolder *noCubeSentDHolder=(ICMostCubesRcvSentDHolder*)[arrNoCubeSent objectAtIndex:indexPath.row];
        
        if (!cell) {
            
            cell = [[UITableViewCell alloc]
                    initWithStyle:UITableViewCellStyleDefault
                    reuseIdentifier:cellIdentifier];
        }
        
        UILabel    *lblUserName = (UILabel *)[cell.contentView viewWithTag:1];
        lblUserName.text=noCubeSentDHolder.strUserName;
        
        UIImageView   *imgUserName=(UIImageView *)[cell.contentView viewWithTag:2];
        [imgUserName removeFromSuperview];
        imgUserName=nil;
        imgUserName = [[UIImageView alloc]initWithFrame:CGRectMake(8, 5, 30, 30)];
        imgUserName.tag=2;
        [cell.contentView addSubview:imgUserName];
        [imgUserName setImageWithUrl:[NSURL URLWithString:noCubeSentDHolder.strUserImageUrl]
                         andPlaceHoder:[UIImage imageNamed:NO_IMAGE_AVAILABLE]
                            andNoImage:[UIImage imageNamed:NO_IMAGE]];
        
        imgUserName.layer.cornerRadius=2.0f;
        imgUserName.layer.masksToBounds=YES;
        return cell;
      
    }
}

#pragma mark - API CALLING
-(void)requestNoUserActivity:(NSMutableDictionary*)info
{
    if([ICUtils isConnectedToHost])
    {
         [HUD show];
        [[ICRestIntraction sharedManager] requestForNoUserActivity:info];
    }
    else
    {
        [HUD hide];
        [ICUtils showAlert:MESSAGE_NET_NOT_AVAILABLE delegate:self btnOk:@"Ok" btnCancel:nil];
    }
}
# pragma mark - NSNotification Selector

-(void)getNoUserActivitySuccess:(NSNotification*)notification{
    
    [HUD hide];
    
    dictNoUserActivityList=(NSMutableDictionary*)notification.object;
    arrNoCubeReceived=[dictNoUserActivityList valueForKey:@"noCubeReceive"];
    arrNoCubeSent=[dictNoUserActivityList valueForKey:@"noCubeSent"];
    
    [tblNoCubeSent reloadData];
    [tblNoCubeReceive reloadData];
    
}
-(void)getNoUserActivityFailed:(NSNotification*)notification{
    
    [HUD hide];
    
}

-(IBAction)btnShowDateViewController:(id)sender
{
    ICDateSPickerViewController *controller = [[ICDateSPickerViewController alloc] init];
    controller.delegate = self;
    FPPopoverController *popover = [[FPPopoverController alloc] initWithViewController:controller];
    popover.contentSize = CGSizeMake(320,240);
    
    popover.border = NO;
    popover.tint = FPPopoverRedTint;
    popover.alpha = 1;
    [popover presentPopoverFromPoint:CGPointMake(320, 18)];
    
    //[popover setShadowsHidden:YES];
    popOver=popover;
}

-(void)removePopoverView
{
    [popOver dismissPopoverAnimated:YES];
}

-(void)selectDoneStartDate:(NSString *)startDate endDate:(NSString *)endDate
{
    [popOver dismissPopoverAnimated:YES];
    
    NSMutableDictionary *info=[NSMutableDictionary new];
    [info setObject:startDate forKey:@"start_date"];
    [info setObject:endDate forKey:@"end_date"];
    
    [self requestNoUserActivity:info];
}


@end
