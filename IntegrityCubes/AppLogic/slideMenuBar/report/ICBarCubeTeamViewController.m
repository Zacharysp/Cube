//
//  ICBarCubeTeamViewController.m
//  IntegrityCubes
//
//  Created by Bhuvan Sharma on 09/04/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//

#import "ICBarCubeTeamViewController.h"
#import "UIColor+Util.h"

@interface ICBarCubeTeamViewController ()

@end

@implementation ICBarCubeTeamViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(cubePiaChartTeamSuccess:) name:NOTIFICATION_CUBE_PIACHAT_TEAM_SUCCESS object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(cubePiaChartTeamFailed:) name:NOTIFICATION_CUBE_PIACHAT_TEAM_FAILED object:nil];
}
-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:NOTIFICATION_CUBE_PIACHAT_TEAM_SUCCESS object:nil];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:NOTIFICATION_CUBE_PIACHAT_TEAM_FAILED object:nil];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    startAngle = 0.0;
    
    pieChartSeparator=[[UIView alloc]init];
    if (IS_IPHONE_5)
    {
        pieChartSeparator.frame=CGRectMake(0, 230, 320, 2);
    }
    else
    {
        pieChartSeparator.frame=CGRectMake(0, 222, 320, 2);
    }
    pieChartSeparator.backgroundColor=[UIColor grayColor];
    [self.view addSubview:pieChartSeparator];
 
    HUD = [[AryaHUD alloc]init];
    [self.view addSubview:HUD];
    [HUD show];
    
    pieChartSeparator.hidden=YES;
    
    //api calling
    [self requestForCubePiachartTeam:nil];

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
    
    [self requestForCubePiachartTeam:info];

}

-(void)drawPiaChartOfTeam:(NSMutableDictionary *)chartValue
{
    ICPieChartView *pieChart;
    if (IS_IPHONE_5)
    {
        pieChart = [[ICPieChartView alloc]initWithFrame:CGRectMake(60, 20, 200, 200)];
    }
    else
    {
        pieChart = [[ICPieChartView alloc]initWithFrame:CGRectMake(60, 12, 200, 200)];
    }
    
    CGFloat TotalValue=[[chartValue objectForKey:@"total_Cubes"] integerValue];
    CGFloat divideTempValue=360/TotalValue;
    NSMutableArray *arrPiaChartItems=(NSMutableArray *)[chartValue objectForKey:@"chartValues"];
    
    for (int i=0; i<arrPiaChartItems.count; i++)
    {
        ICCommonChartDataHolder *chartHolder=[ICCommonChartDataHolder new];
        chartHolder=(ICCommonChartDataHolder *)[arrPiaChartItems objectAtIndex:i];
        CGFloat endAngle = divideTempValue*chartHolder.piaChartValue;
        
        //CGFloat endAngle=(TempValue/100)*360;
        
        ICPieChartDataHolder *pDH1 = [ICPieChartDataHolder new];
        pDH1.arc = ICMakeArc(startAngle, startAngle+endAngle, pieChart.frame.size.height/2, pieChart.frame.size.height/2, 0);
        pDH1.color = chartHolder.icHexColor;
        [pieChart.arrPiChart addObject:pDH1];
        startAngle = startAngle+endAngle;
    }
    
    [self.view addSubview:pieChart];
    
    [self createListOfItems:chartValue];
    [HUD hide];
    
}

-(void)createListOfItems:(NSMutableDictionary *)info
{
    [scrollView removeFromSuperview];
    scrollView=[[UIScrollView alloc]init];
    
    scrollView.scrollEnabled=YES;
    
    UIView *viewList=[[UIView alloc]init];
    
    if (IS_IPHONE_5)
    {
        viewList.frame = CGRectMake(0, 0, 0, 0);
        scrollView.frame = CGRectMake(0,233, 320, 268);
        
    }
    else
    {
        viewList.frame = CGRectMake(0, 0, 0, 0);
        scrollView.frame = CGRectMake(0, 225, 320, 200);
        
    }
    
    NSMutableArray *arrPiaChartItems=(NSMutableArray *)[info objectForKey:@"chartValues"];
    CGFloat TotalValue=[[info objectForKey:@"total_Cubes"] integerValue];
    NSInteger yOffSet = 10;
    NSInteger xOffSet = 20;
    
    for (int i = 0; i< arrPiaChartItems.count; i++)
    {
        ICCommonChartDataHolder *chartHolder=[ICCommonChartDataHolder new];
        chartHolder=(ICCommonChartDataHolder *)[arrPiaChartItems objectAtIndex:i];
        CGFloat perValue=(chartHolder.piaChartValue/TotalValue)*100;
        
        UIView *viewBox=[[UIView alloc]initWithFrame:viewList.bounds];
        viewBox.frame=CGRectMake(xOffSet, yOffSet, 20, 20);
        viewBox.layer.cornerRadius=3;
        UILabel *lblValueTitle=[[UILabel alloc]initWithFrame:viewList.bounds];
        lblValueTitle.frame = CGRectMake(xOffSet + 38, yOffSet,110, 20);
        lblValueTitle.text=[NSString stringWithFormat:@"%@ (%0.2f%%)",chartHolder.strPiaChartTitle,perValue];
        lblValueTitle.textColor=[UIColor blackColor];
        lblValueTitle.font=[UIFont systemFontOfSize:10.0f];
        lblValueTitle.adjustsFontSizeToFitWidth=YES;
        lblValueTitle.minimumScaleFactor = 0.4f;
        
        if (IS_IPHONE_5)
           {
            
                   yOffSet = yOffSet+30;
           }
        else
         {
           yOffSet = yOffSet+30;
         }
        
        viewBox.backgroundColor = [UIColor colorWithHexString:chartHolder.icHexColor];
        [viewList addSubview:viewBox];
        [viewList addSubview:lblValueTitle];
        
    }
    
    if (IS_IPHONE_5){
        
        scrollView.contentSize = CGSizeMake(320, arrPiaChartItems.count * 32);
        
    }else{
        
        scrollView.contentSize = CGSizeMake(320,arrPiaChartItems.count * 32);
    }
    
    viewList.backgroundColor = [UIColor redColor];
    [scrollView addSubview:viewList];
    [self.view addSubview:scrollView];
    
}

#pragma mark - API CALL METHODS
-(void)requestForCubePiachartTeam:(NSMutableDictionary *)info
{
    if ([ICUtils isConnectedToHost])
    {
         [[ICRestIntraction sharedManager] requestForCubePiaChartTeam:info];
    }
    else
    {
        [HUD hide];
        [ICUtils showAlert:MESSAGE_NET_NOT_AVAILABLE];
    }
}

#pragma mark - NSNOTIFICATION METHODS

-(void)cubePiaChartTeamSuccess:(NSNotification *)notification
{
    [HUD hide];
    pieChartSeparator.hidden=NO;
    NSMutableDictionary *info=(NSMutableDictionary *)notification.object;
    if ([[info objectForKey:@"total_Cubes"] integerValue]==0)
    {
        [ICUtils showAlert:@"Cubes are not available in selected duration. "];
    }
    else
    {
        [self drawPiaChartOfTeam:info];
    }
}

-(void)cubePiaChartTeamFailed:(NSNotification *)notification
{
    [HUD hide];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
