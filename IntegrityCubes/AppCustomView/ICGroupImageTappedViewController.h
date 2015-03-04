//
//  ICGroupImageTappedViewController.h
//  Cube
//
//  Created by Dongjie Zhang on 2/27/15.
//  Copyright (c) 2015 Aryavrat Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICLikeCommentButton.h"
#import "ICSearchProfileViewController.h"

@interface ICGroupImageTappedViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>{
    AryaHUD *HUD;
    NSMutableArray *arrList;
    UITableView *tblList;
}

@property(nonatomic,strong)NSString *user_id;
@property(nonatomic,strong)NSString *cube_postedid;
@property(nonatomic,strong)NSString *group_type;
@property(nonatomic,strong)NSString *from_view;
@end
