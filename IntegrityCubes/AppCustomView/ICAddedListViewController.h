//
//  ICAddedListViewController.h
//  Cube
//
//  Created by Dongjie Zhang on 2/24/15.
//  Copyright (c) 2015 Aryavrat Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NotificationDeledate <NSObject>

-(void)commentPage:(ICNotificationHolder *)holder;

@end
@interface ICAddedListViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *arrNotification;
    UITableView *tblNotification;
}

@property(nonatomic,strong)id <NotificationDeledate>delegate;
@end

