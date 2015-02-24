//
//  ICReportViewController.m
//  IntegrityCubes
//
//  Created by aditi on 18/03/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//

#import "ICReportViewController.h"

@interface ICReportViewController ()

@end

@implementation ICReportViewController

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
    
    arrReportsHeadline=[[NSMutableArray alloc]
                        initWithObjects:@"The Cube Board",
                        @"User Activity",@"Cube Over Time",
                        @"Cube By Value",@"Cube By Division",
                        @"Cube By Team", nil];
    
    tblReportHeadLines.scrollEnabled = NO;
    tblReportHeadLines.tableFooterView = [UIView new];
  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
        
}
#pragma mark - IB_ACTIONS
- (IBAction)showRightMenuPressed:(id)sender
{
    [self.menuContainerViewController toggleRightSideMenuCompletion:nil];
}

#pragma mark - UITABLEVIEW DELEGATE AND DATASOURCE METHODS

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrReportsHeadline.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"myCubeFeedCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text=[arrReportsHeadline objectAtIndex:indexPath.row];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0)
    {
       [self performSegueWithIdentifier:@"LeaderBoardController" sender:nil];
    }
    else if (indexPath.row==1)
    {
        [self performSegueWithIdentifier:@"UserActivityController" sender:nil];
    }
    else if (indexPath.row==2)
    {
         [self performSegueWithIdentifier:@"ChartOverTimeController" sender:nil];
        
    }
    else if (indexPath.row==3)
    {
        [self performSegueWithIdentifier:@"BarValueController" sender:nil];
    }
    else if (indexPath.row==4)
    {
         [self performSegueWithIdentifier:@"BarDivisionController" sender:nil];
    }
    else
    {
         [self performSegueWithIdentifier:@"BarTeamController" sender:nil];
    }
}
@end
