//
//  ICUserActivityViewController.h
//  IntegrityCubes
//
//  Created by Bhuvan Sharma on 07/04/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICMostCubesRcvSentDHolder.h"
#import "FPPopoverController.h"
#import "ICDateSPickerViewController.h"
@interface ICUserActivityViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,FPPopoverControllerDelegate,datePickerDelegate>
{
    IBOutlet UITableView *tblNoCubeSent;
    IBOutlet UITableView *tblNoCubeReceive;
    
    IBOutlet UIView      *viewNoSent;
    IBOutlet UIView      *viewNoReceive;
    
    NSMutableDictionary *dictNoUserActivityList;
    
    NSMutableArray      *arrNoCubeReceived;
    NSMutableArray      *arrNoCubeSent;
    
    AryaHUD *HUD;
    FPPopoverController *popOver;
}

@end
