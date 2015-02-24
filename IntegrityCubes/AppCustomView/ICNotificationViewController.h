//
//  ICNotificationViewController.h
//  IntegrityCubes
//
//  Created by Bhuvan Sharma on 30/04/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICNotificationHolder.h"

@protocol NotificationDeledate <NSObject>

-(void)commentPage:(ICNotificationHolder *)holder;

@end

@interface ICNotificationViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *arrNotification;
    UITableView *tblNotification;
}

@property(nonatomic,strong)id <NotificationDeledate>delegate;
@end
