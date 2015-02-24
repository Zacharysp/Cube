//
//  ICCommentViewController.h
//  IntegrityCubes
//
//  Created by aditi on 04/04/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICCubeCommentHolder.h"
#import "ICPopOverView.h"
#import "ICLikeCommentButton.h"
#import "ICCubeFeedCommentHolder.h"

@interface ICCommentViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>{
    
    IBOutlet UIView       *viewAddComment;
    IBOutlet UIView       *viewBgComment;
    IBOutlet UIView       *viewMessageComment;
    IBOutlet UIImageView  *imgPosterView;
    IBOutlet UITextView   *txtVCommentBox;
    
    IBOutlet UILabel      *lblUserName;
    IBOutlet UILabel      *lblCommentTitle;
    IBOutlet UILabel      *lblCounterMessage;
    IBOutlet UILabel      *lblPosterCube;
    IBOutlet UILabel      *lblRecieverCube;
    IBOutlet UILabel      *lblCubeComment;
    
    IBOutlet UIButton     *btnSubmit;
    IBOutlet UIButton     *btnDelete;
    IBOutlet UIButton     *btnLike;
    
    IBOutlet UIImageView   *imgPoster;
    IBOutlet UIImageView   *imgReciever;
    IBOutlet UIImageView   *imgCube;
    
    IBOutlet UITableView *tblCommentList;
    
    NSMutableArray *arrCubeCommentList;
    NSString *strCommentFeedId;
    NSInteger pageId;
    
    ICPopOverView *popOverView;
    ICCubeFeedCommentHolder *commentHolder;
    UIRefreshControl *refreshControl;
    
    AryaHUD *HUD;
       
}
@property(nonatomic,strong) NSString *strCommentFeedId;
@property(nonatomic,strong) NSString *strTblRowId;
@property(nonatomic,strong) NSString *strNotificationId;

-(IBAction)btnSubmitPostCommentClicked:(id)sender;
-(IBAction)btnDeleteClicked:(id)sender;
-(IBAction)btnLikedClicked:(id)sender;
@end
