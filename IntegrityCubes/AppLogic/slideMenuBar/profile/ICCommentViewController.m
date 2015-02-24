//
//  ICCommentViewController.m
//  IntegrityCubes
//
//  Created by aditi on 04/04/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//

#import "ICCommentViewController.h"

@interface ICCommentViewController ()

@end

@implementation ICCommentViewController
@synthesize strCommentFeedId,strTblRowId,strNotificationId;

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
    // Do any additional setup after loading the view.
    
    arrCubeCommentList = [NSMutableArray new];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getCubeCommentListSuccess:) name:NOTIFICATION_CUBE_COMMENT_LIST_SUCCESS object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getCubeCommentListFailed:) name:NOTIFICATION_CUBE_COMMENT_LIST_FAILED object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(cubeFeedPostCommentSuccess:) name:NOTIFICATION_CUBE_FEED_POST_COMMENT_SUCCESS object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(cubeFeedPostCommentFailed:) name:NOTIFICATION_CUBE_FEED_POST_COMMENT_FAILED object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(cubeFeedPostLikeSuccess:) name:NOTIFICATION_CUBE_FEED_POST_LIKE_SUCCESS object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(cubeFeedPostLikeFailed:) name:NOTIFICATION_CUBE_FEED_POST_LIKE_FAILED object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(cubeFeedDeleteSuccess:) name:NOTIFICATION_DELETE_CUBE_FEED_SUCCESS object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(cubeFeedDeleteFailed:) name:NOTIFICATION_DELETE_CUBE_FEED_FAILED object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(cubeFeedCommentDeleteSuccess:) name:NOTIFICATION_DELETE_COMMENT_SUCCESS object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(cubeFeedCommentDeleteFailed:) name:NOTIFICATION_DELETE_COMMENT_FAILED object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(cubeCommentDeleted:) name:NOTIFICATION_CUBE_COMMENT_DELETED object:nil];
    
     viewAddComment.layer.masksToBounds = NO;
     viewAddComment.layer.cornerRadius=2.0f;
     viewAddComment.layer.backgroundColor=[UIColor colorWithRed:223.0/255 green:223.0/255 blue:223.0/255 alpha:1].CGColor;
     viewAddComment.layer.shadowOffset = CGSizeMake(1.0f,1.0f);
     viewAddComment.layer.shadowColor = [UIColor blackColor].CGColor;
     viewAddComment.layer.shadowOpacity = 0.4f;
     viewAddComment.layer.borderColor = [UIColor grayColor].CGColor;
     viewAddComment.layer.borderWidth=1;
    
    viewMessageComment.layer.masksToBounds = NO;
    viewMessageComment.layer.cornerRadius=2.0f;
    viewMessageComment.layer.shadowColor = [UIColor blackColor].CGColor;
    viewMessageComment.layer.borderColor = [UIColor blackColor].CGColor;
    viewMessageComment.layer.borderWidth=0.1;
    
    [imgPosterView setImageWithUrl:[NSURL URLWithString:loginDHolder.strUserImageUrl]
                   andPlaceHoder:[UIImage imageNamed:NO_IMAGE_AVAILABLE]
                   andNoImage:[UIImage imageNamed:NO_IMAGE]];

    imgPosterView.layer.cornerRadius=3.0f;
    imgPosterView.layer.masksToBounds=YES;

    txtVCommentBox.backgroundColor=[UIColor whiteColor];
    txtVCommentBox.layer.cornerRadius=3.0f;
    txtVCommentBox.layer.masksToBounds=YES;
    txtVCommentBox.layer.borderColor=[UIColor grayColor].CGColor;
    txtVCommentBox.layer.borderWidth=0.1;
    
    btnSubmit.layer.cornerRadius=3.0f;
    btnSubmit.layer.masksToBounds=YES;
    
    btnDelete.layer.cornerRadius=2.0f;
    btnDelete.layer.masksToBounds=YES;
    
    btnDelete.hidden=YES;
    btnLike.hidden=YES;
    
    btnLike.layer.cornerRadius=2.0f;
    btnLike.layer.masksToBounds=YES;
    
    lblUserName.text=[NSString stringWithFormat:@"%@ %@",loginDHolder.strFirstName,loginDHolder.strLastName];
    
    //Arya HUD
    HUD=[AryaHUD new];
    [self.view addSubview:HUD];
    [HUD show];
    
    //api calling
    pageId=0;
    [self cubeCommentList];
    
    [imgCube setImageWithUrl:[NSURL URLWithString:commentHolder.strCubeImageUrl]
               andPlaceHoder:[UIImage imageNamed:NO_IMAGE_AVAILABLE]
                  andNoImage:[UIImage imageNamed:NO_IMAGE]];
    [imgPoster setImageWithUrl:[NSURL URLWithString:commentHolder.strCubePosterImageUrl]
                 andPlaceHoder:[UIImage imageNamed:NO_IMAGE_AVAILABLE]
                    andNoImage:[UIImage imageNamed:NO_IMAGE]];
    [imgReciever setImageWithUrl:[NSURL URLWithString:commentHolder.strCubeRecievedImageUrl]
                   andPlaceHoder:[UIImage imageNamed:NO_IMAGE_AVAILABLE]
                      andNoImage:[UIImage imageNamed:NO_IMAGE]];
    
    imgPoster.layer.cornerRadius=3.0f;
    imgPoster.layer.masksToBounds=YES;
    imgReciever.layer.cornerRadius=3.0f; 
    imgReciever.layer.masksToBounds=YES;
    
    lblPosterCube.text=commentHolder.strCubePosterName;
    lblRecieverCube.text=commentHolder.strCubeRecievedName;
    lblCubeComment.text=commentHolder.strComment;
    
    if (commentHolder.likestatus==1)
    {
         [btnLike setTitle:[NSString stringWithFormat:@"Unlike (%ld)",(long)commentHolder.strTotalLike] forState:UIControlStateNormal];
    }
    else
    {
         [btnLike setTitle:[NSString stringWithFormat:@"Like (%ld)",(long)commentHolder.strTotalLike] forState:UIControlStateNormal];
    }
    
    //popOver View
    popOverView = [[ICPopOverView alloc]init];
    popOverView.hidden = YES;
    [self.view addSubview:popOverView];
    
    //tableView Pull To Refresh
    refreshControl = [UIRefreshControl new];
    refreshControl.tintColor = [UIColor blackColor];
    refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"Previous Comments"];
    [refreshControl addTarget:self action:@selector(refresh:)
             forControlEvents:UIControlEventValueChanged];
    [tblCommentList addSubview:refreshControl];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    popOverView.hidden = YES;
}
#pragma mark - UITEXTVIEW METHODS
-(BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    [self keyboardAppeared];
    popOverView.hidden=YES;
    return  YES;
}
//-(void) textViewDidChange:(UITextView *)textView
//{
//    if (textView.text.length>100)
//    {
//        [txtVCommentBox resignFirstResponder];
//        //[ICUtils showAlert:MESSAGE_COMMENT_ERROR delegate:self btnOk:@"Ok" btnCancel:nil];
//        return;
//    }
//    lblCounterMessage.text=[NSString stringWithFormat:@"Remaining Character: %lu",(100-textView.text.length)];
//    
//}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {

        [txtVCommentBox resignFirstResponder];
        [self keyboardDisappeared];

    }
    return YES;
//    NSUInteger newLength = [textView.text length] + [text length] - range.length;
//    return (newLength > 100) ? NO : YES;
}

-(void) keyboardAppeared
{
    [UIView beginAnimations:@"animate" context:nil];
    [UIView setAnimationDuration:0.2f];
    [UIView setAnimationBeginsFromCurrentState: NO];

    if(IS_IPHONE_5){
        
         viewAddComment.frame=CGRectMake(viewAddComment.frame.origin.x,190,viewAddComment.frame.size.width,viewAddComment.frame.size.height);
    }else{
        
         viewAddComment.frame=CGRectMake(viewAddComment.frame.origin.x,101,viewAddComment.frame.size.width,viewAddComment.frame.size.height);
    }
   
    [UIView commitAnimations];
}
-(void) keyboardDisappeared
{
    [UIView beginAnimations:@"animate" context:nil];
    [UIView setAnimationDuration:0.2f];
    [UIView setAnimationBeginsFromCurrentState: NO];
    
    if (IS_IPHONE_5)
    {
          viewAddComment.frame=CGRectMake(viewAddComment.frame.origin.x,406,viewAddComment.frame.size.width,viewAddComment.frame.size.height);
        
    }else
    {
           viewAddComment.frame=CGRectMake(viewAddComment.frame.origin.x,318,viewAddComment.frame.size.width,viewAddComment.frame.size.height);
    }
    [UIView commitAnimations];
}

-(void)cubeCommentList
{
    NSMutableDictionary *info=[[NSMutableDictionary alloc]init];
    NSString *strPageId=[NSString stringWithFormat: @"%lu",(long)pageId];
    [info setValue:strPageId forKey:@"page_id"];
    [info setObject:strCommentFeedId forKey:@"cubeFeedId"];
    
    if(strNotificationId){
        
        [info setObject:strNotificationId forKey:@"notificationId"];
        
    }
    [HUD show];
    [self requestListCubeComments:info];
    
}
-(void)updateCommentView
{
    [imgCube setImageWithUrl:[NSURL URLWithString:commentHolder.strCubeImageUrl]
               andPlaceHoder:[UIImage imageNamed:NO_IMAGE_AVAILABLE]
                  andNoImage:[UIImage imageNamed:NO_IMAGE]];
    [imgPoster setImageWithUrl:[NSURL URLWithString:commentHolder.strCubePosterImageUrl]
                 andPlaceHoder:[UIImage imageNamed:NO_IMAGE_AVAILABLE]
                    andNoImage:[UIImage imageNamed:NO_IMAGE]];
    [imgReciever setImageWithUrl:[NSURL URLWithString:commentHolder.strCubeRecievedImageUrl]
                   andPlaceHoder:[UIImage imageNamed:NO_IMAGE_AVAILABLE]
                      andNoImage:[UIImage imageNamed:NO_IMAGE]];
    lblPosterCube.text=commentHolder.strCubePosterName;
    lblRecieverCube.text=commentHolder.strCubeRecievedName;
    lblCubeComment.text=commentHolder.strComment;
    
    if (commentHolder.likestatus==1)
    {
        [btnLike setTitle:[NSString stringWithFormat:@"Unlike (%ld)",(long)commentHolder.strTotalLike] forState:UIControlStateNormal];
    }
    else
    {
        [btnLike setTitle:[NSString stringWithFormat:@"Like (%ld)",(long)commentHolder.strTotalLike] forState:UIControlStateNormal];
    }
}
-(void)refresh:(id)sender
{
    pageId=pageId+1;
    [self cubeCommentList];
}

#pragma mark - IB_ACTIONS

-(IBAction)btnSubmitPostCommentClicked:(id)sender{
    
    [txtVCommentBox resignFirstResponder];
    [self keyboardDisappeared];
    
    txtVCommentBox.text = [txtVCommentBox.text stringByTrimmingCharactersInSet:
                           [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if(![txtVCommentBox.text isEqualToString:@""])
    {
       if([ICUtils isConnectedToHost])
        {
            NSMutableDictionary *info=[[NSMutableDictionary alloc]init];
           
            [info setObject:strCommentFeedId forKey:@"cubeFeed_id"];
            [info setObject:[NSString stringWithFormat:@"%ld",(long)loginDHolder.icUserId] forKey:@"user_id"];
            [info setObject:txtVCommentBox.text forKey:@"cube_comments"];
            [HUD show];
            [self requestPostCommentOnCubeFeed:info];
        }
        else
        {
            [ICUtils showAlert:MESSAGE_NET_NOT_AVAILABLE];
        }
    }
    else
    {
        [ICUtils showAlert:MESSAGE_COMMENTBOX_BLANK_ERROR];
        return;
    }
    
}
-(IBAction)btnDeleteClicked:(id)sender
{
    NSMutableDictionary *info=[NSMutableDictionary new];
    [info setObject:strCommentFeedId forKey:@"cubeFeed_id"];
    [self requestDeleteCubeFeed:info];
}
-(IBAction)btnLikedClicked:(id)sender
{
    NSString *strFeedId=strCommentFeedId;
    
    NSMutableDictionary *info=[[NSMutableDictionary alloc]init];
    [info setObject:strFeedId forKey:@"cubeFeed_id"];
    [info setObject:[NSString stringWithFormat:@"%ld",(long)loginDHolder.icUserId] forKey:@"user_id"];
    [HUD show];
    [self requestForLikeCubeComments:info];

}
-(void)requestForLikeCubeComments:(NSMutableDictionary*)info
{    
    if([ICUtils isConnectedToHost])
    {
        [[ICRestIntraction sharedManager] requestForCubeFeedPostLike:info];
    }
    else
    {
        [ICUtils showAlert:MESSAGE_NET_NOT_AVAILABLE delegate:self btnOk:@"Ok" btnCancel:nil];
    }
}

-(void)removeCommentDidClicked:(id)sender{
    
    ICLikeCommentButton *btn=(ICLikeCommentButton *)sender;
    
    ICAlertView *alertView = [ICUtils showAlert:@"Do you want to delete the comment."
              delegate:self
              btnOk:@"Delete"
              btnCancel:@"Cancel"];
    alertView.section = SECTION_COMMENT_DELETE;
    alertView.index = btn.index;
    
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    ICAlertView *icAlert = (ICAlertView*)alertView;
    if (icAlert.section == SECTION_COMMENT_DELETE) {
        
        if (buttonIndex == 1)
        {
            NSMutableDictionary *dict=[NSMutableDictionary new];
            [dict setObject:[[arrCubeCommentList objectAtIndex:icAlert.index] valueForKey:@"comment_id" ] forKey:@"commentid"];
            [dict setObject:commentHolder.strCubeFeedId forKey:@"cubeFeed_id"];
            [self requestForRemoveComment:dict];
            
        }
    }
}

#pragma mark - UITableView Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrCubeCommentList.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"commentListCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:cellIdentifier];
    }
    
    NSString *strComments=[[arrCubeCommentList objectAtIndex:indexPath.row] valueForKey:@"cube_comment"];
    NSString *strUserName=[[arrCubeCommentList objectAtIndex:indexPath.row] valueForKey:@"name"];
    NSString *strUserImgUrl=[[arrCubeCommentList objectAtIndex:indexPath.row] valueForKey:@"user_image"];
    
      //image for cubePoster
    UIImageView *imgVCubePoster = (UIImageView*)[cell.contentView viewWithTag:1];
    [imgVCubePoster removeFromSuperview];
    imgVCubePoster = nil;
    imgVCubePoster = [[UIImageView alloc]initWithFrame:CGRectMake(12,4,30,30)];
    imgVCubePoster.tag = 1;
    [cell.contentView addSubview:imgVCubePoster];
    [imgVCubePoster setImageWithUrl:[NSURL URLWithString:strUserImgUrl]
                    andPlaceHoder:[UIImage imageNamed:NO_IMAGE_AVAILABLE]
                    andNoImage:[UIImage imageNamed:NO_IMAGE]];

    UILabel *lblPosterName=(UILabel*)[cell.contentView viewWithTag:2];
    UILabel *lblPosterComment=(UILabel*)[cell.contentView viewWithTag:3];
    UILabel *lblBgCommentView=(UILabel*)[cell.contentView viewWithTag:4];
    
    ICLikeCommentButton*btnRemoveComment=(ICLikeCommentButton*)[cell.contentView viewWithTag:5];
    
    [btnRemoveComment addTarget:self
                              action:@selector(removeCommentDidClicked:)
                                forControlEvents:UIControlEventTouchUpInside];
     btnRemoveComment.index=indexPath.row;
    
    ICLog(@"%@",loginDHolder.strUserType);
    if ([loginDHolder.strUserType isEqualToString:@"General"]||[loginDHolder.strUserType isEqualToString:@"Manager"])
    {
        if(loginDHolder.icUserId ==[[[arrCubeCommentList objectAtIndex:indexPath.row]valueForKey:@"user_id"] integerValue])
        {
            btnRemoveComment.hidden=NO;
            
        }else{
            btnRemoveComment.hidden=YES;
        }
    }else{
        
        btnRemoveComment.hidden=NO;
    }
    
    lblPosterName.text=strUserName;

    lblPosterComment.text=strComments;

    imgVCubePoster.layer.cornerRadius=5;
    imgVCubePoster.layer.masksToBounds=YES;

    lblBgCommentView.layer.masksToBounds = NO;
    lblBgCommentView.layer.cornerRadius=5.0f;
    lblBgCommentView.layer.backgroundColor=[UIColor whiteColor].CGColor;
    lblBgCommentView.layer.shadowOffset = CGSizeMake(1.0f,1.0f);
    lblBgCommentView.layer.shadowColor = [UIColor blackColor].CGColor;
    lblBgCommentView.layer.shadowOpacity = 0.4f;
    lblBgCommentView.layer.borderColor = [UIColor grayColor].CGColor;
    lblBgCommentView.layer.borderWidth=1;

    cell.contentView.userInteractionEnabled=YES;
    UITapGestureRecognizer *tapped = [[UITapGestureRecognizer alloc]
                                      initWithTarget:self
                                      action:@selector(lblCommentDidClicked:)];
    tapped.numberOfTapsRequired = 1;
    [cell.contentView addGestureRecognizer:tapped];

    return cell;
    
}
#pragma mark - API CALLING
-(void)requestDeleteCubeFeed:(NSMutableDictionary*)info{
    
    if([ICUtils isConnectedToHost])
    {
        [[ICRestIntraction sharedManager] requestForDeleteCubeFeed:info];
        
    }
    else
    {
        [ICUtils showAlert:MESSAGE_NET_NOT_AVAILABLE delegate:self btnOk:@"Ok" btnCancel:nil];
        
    }
}

-(void)requestForRemoveComment:(NSMutableDictionary *)info
{
    if([ICUtils isConnectedToHost])
    {
        [HUD show];
        [[ICRestIntraction sharedManager] requestForDeleteComment:info];
    }
    else
    {
        [HUD hide];
        [ICUtils showAlert:MESSAGE_NET_NOT_AVAILABLE delegate:self btnOk:@"Ok" btnCancel:nil];
    }
}

-(void)requestListCubeComments:(NSMutableDictionary*)info{
    
    if([ICUtils isConnectedToHost])
    {
        [[ICRestIntraction sharedManager] requestForListCubeComment:info];
        
    }
    else
    {
        [HUD hide];
        [refreshControl endRefreshing];
        pageId=0;
        [ICUtils showAlert:MESSAGE_NET_NOT_AVAILABLE delegate:self btnOk:@"Ok" btnCancel:nil];
        
    }
}
-(void)requestPostCommentOnCubeFeed:(NSMutableDictionary *)info
{
    if([ICUtils isConnectedToHost])
    {
        [[ICRestIntraction sharedManager] requestForCubeFeedPostComment:info];
        
    }else
    {
        [ICUtils showAlert:MESSAGE_NET_NOT_AVAILABLE delegate:self btnOk:@"Ok" btnCancel:nil];
        
    }
}

# pragma mark - NSNotification Selector

-(void)cubeCommentDeleted:(NSNotification*)notification{
    
    [HUD show];
    NSMutableDictionary *info = (NSMutableDictionary*)notification.object;
    NSString *cubeCommentId = [info valueForKey:KEY_CUBE_COMMENT_ID];
    
    NSMutableDictionary *cubeComment = nil;
    for (NSMutableDictionary *tempCubeComment in arrCubeCommentList) {
        
        NSString *tempCubeCommentID = [tempCubeComment valueForKey:@"comment_id"];
        if ([tempCubeCommentID isEqualToString:cubeCommentId]) {
            
            cubeComment = tempCubeComment;
            break;
        }
    }
    if (cubeComment) {
        [arrCubeCommentList removeObject:cubeComment];
        [tblCommentList reloadData];
    }
    [HUD hide];
}

-(void)getCubeCommentListSuccess:(NSNotification *)notification{

    [HUD hide];
    [refreshControl endRefreshing];
    commentHolder = (ICCubeFeedCommentHolder*)notification.object;
     [self updateCommentView];
    NSMutableArray *arrTempFeeds = commentHolder.arrCommentData;
    
    NSArray *arrtepm=[[arrTempFeeds reverseObjectEnumerator] allObjects];
    NSMutableArray *arrTemp=[[NSMutableArray alloc]init];
    arrTemp=[arrCubeCommentList mutableCopy];
    [arrCubeCommentList removeAllObjects];
    arrCubeCommentList=(NSMutableArray *)arrtepm;
    [arrCubeCommentList addObjectsFromArray:arrTemp];
 
    if (arrCubeCommentList.count==0)
    {
        lblCommentTitle.hidden=YES;
        
    }
    else
    {
        lblCommentTitle.hidden=NO;
        lblCommentTitle.text=[NSString stringWithFormat:@"Comments (%ld)",(long)commentHolder.strTotalComments];
    }

    [tblCommentList reloadData];
   
}
-(void)getCubeCommentListFailed:(NSNotification *)notification{

    if ([notification.object isEqual:@"Post Deleted."]) {
        
        UIView *alertView=[[UIView alloc]init];
        alertView.frame=CGRectMake(0, 0, 320, 480);
        alertView.backgroundColor=[UIColor whiteColor];
       
        UILabel *lbl=[[UILabel alloc]initWithFrame:CGRectMake(85,150,200,50)];
        lbl.text=@"Cube Post Deleted.";
        
        [self.view addSubview:alertView];
        [alertView addSubview:lbl];
        
        [HUD hide];
//        [self.navigationController popViewControllerAnimated:YES];
        
    }else{
        
        [HUD hide];
        [refreshControl endRefreshing];
        arrCubeCommentList=[[NSMutableArray alloc]init];
        [tblCommentList reloadData];

    }
}
-(void)cubeFeedPostCommentSuccess:(NSNotification *)notification
{
    pageId=0;
    [HUD hide];
    NSMutableDictionary *info = (NSMutableDictionary*)notification.object;
    NSInteger totalComments = [[info valueForKey:@"totalComments"] integerValue];
    lblCommentTitle.text=[NSString stringWithFormat:@"Comments (%ld)",(long)totalComments];
    [arrCubeCommentList removeAllObjects];
    [self cubeCommentList];
    txtVCommentBox.text=@"";
    lblCounterMessage.text=@"";
    
}
-(void)cubeFeedPostCommentFailed:(NSNotification *)notification
{
//    pageId=0;
    [HUD hide];
//    [ICUtils showAlert:MESSAGE_UNSUCCESSFUL_POST delegate:self btnOk:@"Ok" btnCancel:nil];
}

-(void)cubeFeedPostLikeSuccess:(NSNotification *)notification
{
    NSMutableDictionary *info = (NSMutableDictionary*)notification.object;
    NSInteger likeTotal = [[info valueForKey:@"likeTotal"] integerValue];
    NSInteger likeStatus = [[info valueForKey:@"likeStatus"] integerValue];
    if (likeStatus==1)
    {
        [btnLike setTitle:[NSString stringWithFormat:@"Unlike (%ld)",(long)likeTotal] forState:UIControlStateNormal];
    }
    else
    {
        [btnLike setTitle:[NSString stringWithFormat:@"Like (%ld)",(long)likeTotal] forState:UIControlStateNormal];

    }
    [HUD hide];
}

-(void)cubeFeedPostLikeFailed:(NSNotification *)notification
{
    [HUD hide];
}

-(void)cubeFeedDeleteSuccess:(NSNotification *)notification
{
    NSInteger notification_id=[[NSString stringWithFormat:@"%@",strNotificationId]integerValue];
    [[ICDataBaseInteraction databaseInteractionManager] deleteNotification:notification_id];
    [self.navigationController popViewControllerAnimated:YES];
    [HUD hide];
}

-(void)cubeFeedDeleteFailed:(NSNotification *)notification
{
    [HUD hide];
}

-(void)cubeFeedCommentDeleteSuccess:(NSNotification *)notification
{
    NSMutableDictionary *info = (NSMutableDictionary*)notification.object;
    NSInteger commentId = [[info valueForKey:@"commentId"]integerValue];
    NSInteger totalComment = [[info valueForKey:@"totalComment"]integerValue];
    lblCommentTitle.text=[NSString stringWithFormat:@"Comments (%ld)",(long)totalComment];
    
    NSInteger tblRowIdTemp=NSNotFound;
    for (int i=0; i<arrCubeCommentList.count; i++)
    {
        NSString *strCommentId=[[arrCubeCommentList objectAtIndex:i] valueForKey:@"comment_id"];
        if ([strCommentId integerValue]==commentId)
        {
            tblRowIdTemp=i;
            break;
        }
    }
    if (tblRowIdTemp!=NSNotFound)
    {
//        [tblCommentList beginUpdates];
//        [tblCommentList deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:tblRowIdTemp inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
        [arrCubeCommentList removeObjectAtIndex:tblRowIdTemp];
        [tblCommentList reloadData];
//        [tblCommentList endUpdates];
    }
    [HUD hide];
}

-(void)cubeFeedCommentDeleteFailed:(NSNotification *)notification
{
    [HUD hide];
}

#pragma mark - OTHER_METHODS

-(void)lblCommentDidClicked:(id)sender{
    
    UITapGestureRecognizer *tap = (UITapGestureRecognizer *)sender;
    CGPoint location = [tap locationInView:self.view];
    CGPoint locationTbl = [tap locationInView:tblCommentList];
    
    NSIndexPath *indexPath = [tblCommentList indexPathForRowAtPoint:locationTbl];
    
    NSString *strComments=[[arrCubeCommentList objectAtIndex:indexPath.row] valueForKey:@"cube_comment"];
    popOverView.txtView.text=strComments;
    
    strComments = [strComments stringByTrimmingCharactersInSet:
                                     [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    NSUInteger txtLength;
    txtLength=strComments.length;
    
    if(txtLength>100)
    {
        popOverView.txtView.frame=CGRectMake(50,location.y,263,txtLength/80*25);
    }
    else
    {
        popOverView.txtView.frame=CGRectMake(50,location.y,263,30);
    }
    popOverView.txtView.backgroundColor=[UIColor colorWithRed:240.0/255 green:240.0/255 blue:240.0/255 alpha:1];
    popOverView.txtView.layer.borderColor=[UIColor lightGrayColor].CGColor;
    popOverView.txtView.layer.borderWidth=0.5;
    
    popOverView.hidden=NO;
    
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    popOverView.hidden = YES;
}


@end
