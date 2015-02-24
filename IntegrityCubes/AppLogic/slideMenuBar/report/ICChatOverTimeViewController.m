//
//  ICChatOverTimeViewController.m
//  IntegrityCubes
//
//  Created by Bhuvan Sharma on 09/04/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//

#import "ICChatOverTimeViewController.h"

@interface ICChatOverTimeViewController ()

@end

@implementation ICChatOverTimeViewController
@synthesize myGraph,ArrayOfValues,ArrayOfDates,labelDates,labelValues;
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
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(cubeChartOverTimeSuccess:) name:NOTIFICATION_CUBE_CHART_OVERTIME_SUCCESS object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(cubeChartOverTimeFailed:) name:NOTIFICATION_CUBE_CHART_OVERTIME_FAILED object:nil];
    
    myGraph.backgroundColor=[UIColor clearColor];
    myGraph.layer.borderColor=[UIColor blackColor].CGColor;
    myGraph.layer.borderWidth=1.0;
    
    viewLblContainor.layer.cornerRadius=5.0;
    viewLblContainor.layer.borderColor=[UIColor blackColor].CGColor;
    viewLblContainor.layer.borderWidth=0.5;
//    [labelDates sizeToFit];
//    [labelValues sizeToFit];
    
    viewLblContainor.hidden=YES;
    
    HUD = [[AryaHUD alloc]init];
    [self.view addSubview:HUD];
    [HUD show];
    [self requestCubeChartOverTime:nil];

}

-(void)drawLineChartOverTime:(NSMutableDictionary *)info
{
    ArrayOfValues = [info objectForKey:@"cubeCount"];
    ArrayOfDates = [info objectForKey:@"months"] ;
    [myGraph removeFromSuperview];
    myGraph=[[ICLineChartView alloc]initWithFrame:CGRectMake(10, 20, 300, 190)];
    NSInteger yOffSet=-42;
    
    UIView *barline2=[[UIView alloc]initWithFrame:myGraph.bounds];
    barline2.frame=CGRectMake(0, -12, 0.5, 180);
    barline2.backgroundColor=[UIColor grayColor];
    barline2.alpha=0.3;
    [myGraph addSubview:barline2];
    for (int i=0; i<6; i++)
    {
        UIView *barline=[[UIView alloc]initWithFrame:myGraph.bounds];
        barline.frame=CGRectMake(0, yOffSet, 310, 0.5);
        barline.backgroundColor=[UIColor lightGrayColor];
        barline.alpha=0.3;
        yOffSet=yOffSet+35;
        [myGraph addSubview:barline];
    }
    UIView *barline1=[[UIView alloc]initWithFrame:myGraph.bounds];
    barline1.frame=CGRectMake(0, 168, 310, 0.5);
    barline1.backgroundColor=[UIColor grayColor];
    barline1.alpha=0.3;
    [myGraph addSubview:barline1];
    
    myGraph.delegate=self;
   
    [self.view addSubview:myGraph];
    
    myGraph.colorLine = [UIColor blueColor];
    myGraph.colorXaxisLabel = [UIColor blackColor];
    myGraph.widthLine = 1.5;
    myGraph.enableTouchReport = YES;
        
    // The labels to report the values of the graph when the user touches it
    labelValues.text = [NSString stringWithFormat:@"Total Cubes %i", [[myGraph calculatePointValueSum] intValue]];

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
    
//     [ICUtils showAlert:@"Under Development"];
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
    
    [self requestCubeChartOverTime:info];
}

#pragma mark - API CALL METHODS
-(void)requestCubeChartOverTime:(NSMutableDictionary *)info
{
    if ([ICUtils isConnectedToHost])
    {
        [[ICRestIntraction sharedManager] requestForCubeChartOverTime:info];
    }
    else
    {
        [HUD hide];
        [ICUtils showAlert:MESSAGE_NET_NOT_AVAILABLE];
    }
}

#pragma mark - NSNOTIFICATION METHODS

-(void)cubeChartOverTimeSuccess:(NSNotification *)notification
{
    [HUD hide];
    viewLblContainor.hidden=NO;
    NSMutableDictionary *info=(NSMutableDictionary *)notification.object;
    if ([[info objectForKey:@"total_Cubes"] integerValue]==0)
    {
        [ICUtils showAlert:@"Cubes are not available in selected duration. "];
    }
    else
    {
        [self drawLineChartOverTime:info];
    }
}

-(void)cubeChartOverTimeFailed:(NSNotification *)notification
{
    [HUD hide];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - SimpleLineGraph Data Source

- (NSInteger)numberOfPointsInLineGraph:(ICLineChartView *)graph
{
    return (int)[self.ArrayOfValues count];
}

- (CGFloat)lineGraph:(ICLineChartView *)graph valueForPointAtIndex:(NSInteger)index {
    return [[self.ArrayOfValues objectAtIndex:index] floatValue];
}

#pragma mark - SimpleLineGraph Delegate

- (NSInteger)numberOfGapsBetweenLabelsOnLineGraph:(ICLineChartView *)graph
{
    return 0;
}

- (NSString *)lineGraph:(ICLineChartView *)graph labelOnXAxisForIndex:(NSInteger)index
{
    return [self.ArrayOfDates objectAtIndex:index];
}

- (void)lineGraph:(ICLineChartView *)graph didTouchGraphWithClosestIndex:(NSInteger)index
{
    self.labelValues.text = [NSString stringWithFormat:@"%@ cubes", [self.ArrayOfValues objectAtIndex:index]];
    self.labelDates.text = [NSString stringWithFormat:@"in %@", [self.ArrayOfDates objectAtIndex:index]];
}

- (void)lineGraph:(ICLineChartView *)graph didReleaseTouchFromGraphWithClosestIndex:(CGFloat)index
{
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.labelValues.alpha = 0.0;
        self.labelDates.alpha = 0.0;
    } completion:^(BOOL finished)
     {
         self.labelValues.text = [NSString stringWithFormat:@"Total Cubes %i", [[self.myGraph calculatePointValueSum] intValue]];
         self.labelDates.text = [NSString stringWithFormat:@"between %@ and %@ ",[self.ArrayOfDates firstObject], [self.ArrayOfDates lastObject]];
         
         [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
             self.labelValues.alpha = 1.0;
             self.labelDates.alpha = 1.0;
         } completion:nil];
     }];
}

- (void)lineGraphDidFinishLoading:(ICLineChartView *)graph
{
    self.labelValues.text = [NSString stringWithFormat:@"Total Cubes %i", [[self.myGraph calculatePointValueSum] intValue]];
    // self.labelDates.text = [NSString stringWithFormat:@"between 2000 and %@", [self.ArrayOfDates lastObject]];
}

@end
