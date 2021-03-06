//
//  ICNotificationViewController.m
//  IntegrityCubes
//
//  Created by Bhuvan Sharma on 30/04/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//

#import "ICNotificationViewController.h"

@interface ICNotificationViewController ()

@end

@implementation ICNotificationViewController
@synthesize delegate;

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
    
    arrNotification = [[NSMutableArray alloc]init];
    arrNotification=[[ICDataBaseInteraction databaseInteractionManager] getNotificationMessage];
    
    tblNotification=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 200, 260)];
    tblNotification.dataSource=self;
    tblNotification.delegate=self;
    
    [tblNotification reloadData];
    [self.view addSubview:tblNotification];
    
    tblNotification.tableFooterView = [UIView new];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
    
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
    
      ICNotificationHolder *notificationDHolder=[arrNotification objectAtIndex:indexPath.row];
      NSInteger notification_id=[[NSString stringWithFormat:@"%@",notificationDHolder.strNotificationId]integerValue];
      [[ICDataBaseInteraction databaseInteractionManager] deleteNotification:notification_id];
      [arrNotification removeObjectAtIndex:indexPath.row];
      [tableView reloadData];
    
    }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==1) {
        return arrNotification.count;
    }
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section==0) {
        
         return 25;
    }
    return 0;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *view = nil;
    if (section==0) {
        
        view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 26)];
        view.backgroundColor = [UIColor colorWithRed:59.0/255.0 green:59.0/255.0 blue:59.0/255.0 alpha:1];
        UILabel*lblTitle=[[UILabel alloc]initWithFrame:CGRectMake(5, 5, 100, 15)];
        lblTitle.text = @"Cube Notification";
        lblTitle.font=[UIFont systemFontOfSize:10];
        lblTitle.textColor=[UIColor whiteColor];
        UIButton *btnClearAllN=[[UIButton alloc]initWithFrame:CGRectMake(144, 0, 60, 26)];
        [btnClearAllN setShowsTouchWhenHighlighted:YES];
//        btnClearAllN.backgroundColor = [UIColor orangeColor];
        [btnClearAllN setTitle:@"Clear All" forState:UIControlStateNormal];
        [btnClearAllN setTintColor:[UIColor whiteColor]];
        [btnClearAllN.titleLabel setFont:[UIFont systemFontOfSize:10]];
        [btnClearAllN addTarget:self
                         action:@selector(btnClearAllNDidClicked:)
               forControlEvents:UIControlEventTouchUpInside];
        
        
        [view addSubview:lblTitle];
        [view addSubview:btnClearAllN];
    }
    return view;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 25;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier=@"NotificationCell";
    tableView.separatorInset=UIEdgeInsetsZero;
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.contentView.backgroundColor=[UIColor colorWithRed:245.0/255 green:245.0/255 blue:245.0/255 alpha:1];
    if (cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    ICNotificationHolder *holder=[ICNotificationHolder new];
    holder=[arrNotification objectAtIndex:indexPath.row];
    if ([holder.strSeenFlag isEqualToString:@"0"])
    {
        cell.contentView.backgroundColor=[UIColor colorWithRed:220.0/255 green:220.0/255 blue:220.0/255 alpha:1];
    }
    cell.textLabel.numberOfLines=2;
    cell.textLabel.text=holder.strMessage;
    [cell.textLabel setFont:[UIFont systemFontOfSize:10]];
    cell.textLabel.adjustsFontSizeToFitWidth=YES;
    cell.textLabel.minimumScaleFactor=0.5f;

    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ICNotificationHolder *holder=[ICNotificationHolder new];
    holder=[arrNotification objectAtIndex:indexPath.row];
    if ([ICUtils isConnectedToHost])
    {
        [[ICDataBaseInteraction databaseInteractionManager] updateParticulerNotification:holder];
        [delegate commentPage:holder];
    }else{
        [ICUtils showAlert:MESSAGE_NET_NOT_AVAILABLE];
    }
}
-(void)btnClearAllNDidClicked:(id)sender{
    
    if (arrNotification.count>0) {
        [[ICDataBaseInteraction databaseInteractionManager]clearUserNotificationData];
        [arrNotification removeAllObjects];
        [tblNotification reloadData];
    }
    
}

@end
