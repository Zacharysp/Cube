//
//  ICChatOverTimeViewController.h
//  IntegrityCubes
//
//  Created by Bhuvan Sharma on 09/04/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FPPopoverController.h"
#import "ICDateSPickerViewController.h"
#import "ICLineChartView.h"

@interface ICChatOverTimeViewController : UIViewController<FPPopoverControllerDelegate,datePickerDelegate,LineChartGraphDelegate,UIGestureRecognizerDelegate>
{    
    IBOutlet UIView *viewLblContainor;
    
    FPPopoverController *popOver;
    AryaHUD *HUD;
}

-(IBAction)btnShowDateViewController:(id)sender;
@property (strong, nonatomic) ICLineChartView *myGraph;

@property (strong, nonatomic) NSMutableArray *ArrayOfValues;
@property (strong, nonatomic) NSMutableArray *ArrayOfDates;

@property (strong, nonatomic) IBOutlet UILabel *labelValues;
@property (strong, nonatomic) IBOutlet UILabel *labelDates;

@end
