//
//  ICReportViewController.h
//  IntegrityCubes
//
//  Created by aditi on 18/03/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MFSideMenu.h"

@interface ICReportViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    IBOutlet UITableView *tblReportHeadLines;
    
    NSMutableArray *arrReportsHeadline;
}
-(IBAction)showRightMenuPressed:(id)sender;


@end
