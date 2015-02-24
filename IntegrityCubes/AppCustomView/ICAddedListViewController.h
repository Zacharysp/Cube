//
//  ICAddedListViewController.h
//  Cube
//
//  Created by Dongjie Zhang on 2/24/15.
//  Copyright (c) 2015 Aryavrat Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ICAddedListViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *tblList;
}


@property(nonatomic,strong)NSMutableArray *arrList;

@end

