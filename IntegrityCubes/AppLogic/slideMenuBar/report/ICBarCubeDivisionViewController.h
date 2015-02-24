//
//  ICBarCubeDivisionViewController.h
//  IntegrityCubes
//
//  Created by Bhuvan Sharma on 09/04/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FPPopoverController.h"
#import "ICDateSPickerViewController.h"
#import "ICPieChartView.h"
#import "ICPieChartDataHolder.h"
#import "ICCommonChartDataHolder.h"

@interface ICBarCubeDivisionViewController : UIViewController<FPPopoverControllerDelegate,datePickerDelegate>
{
    FPPopoverController *popOver;
    AryaHUD *HUD;
    CGFloat startAngle;
        
    UIScrollView *scrollView;
    UIView *pieChartSeparator;

}

-(IBAction)btnShowDateViewController:(id)sender;

@end
