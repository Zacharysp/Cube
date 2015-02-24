//
//  ICTeamViewController.m
//  IntegrityCubes
//
//  Created by aditi on 18/03/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//

#import "ICTeamViewController.h"
//#import "ICTeamPosterDataHolder.h"
//#import "ICTeamListDataHolder.h"

@interface ICTeamViewController ()

@end

@implementation ICTeamViewController

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
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getTeamListSuccess:) name:NOTIFICATION_TEAM_LIST_SUCCESS object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getTeamListFailed:) name:NOTIFICATION_TEAM_LIST_FAILED object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getTeamDetailSuccess:) name:NOTIFICATION_TEAM_DETAIL_SUCCESS object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getTeamDetailFailed:) name:NOTIFICATION_TEAM_DETAIL_FAILED object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getTeamPosterDetailSuccess:) name:NOTIFICATION_TEAM_POSTER_DETAIL_SUCCESS object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getTeamPosterDetailFailed:) name:NOTIFICATION_TEAM_POSTER_DETAIL_FAILED object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(refreshThroughHomeView:) name:NOTIFICATION_CUBE_PROFILE_VIEW_REFRESH_SUCCESS object:nil];
    
    arrTeamPoster=[[NSMutableArray alloc]init];
     tblTeamList.frame=CGRectMake(tblTeamList.frame.origin.x,tblTeamList.frame.origin.y, tblTeamList.frame.size.width, 0);
    
    //Scrollview methods
    scrollVRecentCube.delegate = self;
    scrollVRecentCube.scrollEnabled = YES;
    scrollVRecentCube.showsHorizontalScrollIndicator=NO;
    scrollVRecentCube.layer.borderColor = [UIColor grayColor].CGColor;
    scrollVRecentCube.layer.borderWidth = 0.3;
    
    lblTeamCubeReceived.layer.cornerRadius=3;
    lblTeamProfileContainer.layer.borderColor=[UIColor grayColor].CGColor;
    lblTeamProfileContainer.layer.borderWidth = 0.3;
    
    //Arya HUD
    HUD=[[AryaHUD alloc]init];
    [self.view addSubview:HUD];
    
    //Popover View
    popOverView = [[ICPopOverView alloc]init];
    popOverView.hidden = YES;
    [self.view addSubview:popOverView];
    
    //api calling
    if ([ICUtils isConnectedToHost])
    {
        [HUD show];
        [self teamDetails];
    }
    else
    {
        [HUD hide];
        [ICUtils showAlert:MESSAGE_NET_NOT_AVAILABLE delegate:self btnOk:@"Ok" btnCancel:nil];
    }
    
    //check for reachability change
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(reachabilityTeamStatusChange:)
                                                name:kReachabilityChangedNotification
                                                   object:nil];
    
    tblTeamPosterView.tableFooterView = [UIView new];

    
}
-(void)reachabilityTeamStatusChange:(NSNotification*)notification{
    
    if ([ICUtils isConnectedToHost]) {
        
        [HUD show];
        [self teamDetails];
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    tblTeamList.frame=CGRectMake(tblTeamList.frame.origin.x,tblTeamList.frame.origin.y, tblTeamList.frame.size.width, 0);
    
    [searchTeamBar resignFirstResponder];
    popOverView.hidden = YES;
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    popOverView.hidden = YES;
}

#pragma mark - SHOW CUBE ON SCROLLVIEW

-(void)teamCubeReceived:(id)sender{
    
    int scrollWidth =44;
    int xOffset = 0;
    
    arrTeamCubeScroll = [[NSMutableArray alloc]init];
    
    NSString *strCubeImage;
    
    for(UIView *subview in [scrollVRecentCube subviews])
    {
        [subview removeFromSuperview];
    }
    
    if(arrTeamCubeRcv.count==0)
    {
        UILabel *lbl=[[UILabel alloc]initWithFrame:scrollVRecentCube.bounds];
        lbl.frame=CGRectMake(10, 8, 150, 30);
        [lbl setFont:[UIFont fontWithName:@"Times New Roman" size:10]];
        lbl.text=@"Cubes are not available.";
        lbl.textColor=[UIColor grayColor];
        [scrollVRecentCube addSubview:lbl];
        
    }else
    {
        for(int index=0; index < [arrTeamCubeRcv count]; index++)
            {
                ICCubeImageView *imgView = [[ICCubeImageView alloc] init];
                imgView.bounds = CGRectMake(4,4,35,35);
                imgView.frame = CGRectMake(4+xOffset,4,35,35);
                
                strCubeImage=[[arrTeamCubeRcv objectAtIndex:index]valueForKey:@"cube_image"];
                
                [imgView setImageWithUrl:[NSURL URLWithString:strCubeImage]
                           andPlaceHoder:[UIImage imageNamed:NO_IMAGE_AVAILABLE]
                              andNoImage:[UIImage imageNamed:NO_IMAGE]];
                
                imgView.userInteractionEnabled=YES;
                
                imgView.imageIndex=index;
                UITapGestureRecognizer *tapped = [[UITapGestureRecognizer alloc]
                                                  initWithTarget:self
                                                  action:@selector(scrollViewCubeImageDidClicked:)];
                tapped.numberOfTapsRequired = 1;
                [imgView addGestureRecognizer:tapped];
                
                [arrTeamCubeScroll insertObject:imgView atIndex:index];
                scrollVRecentCube.contentSize = CGSizeMake(scrollWidth+xOffset,43);
                [scrollVRecentCube addSubview:[arrTeamCubeScroll objectAtIndex:index]];
                
                xOffset+=39;
            }
      }
}

#pragma mark - IB_ACTIONS
- (IBAction)showRightMenuPressed:(id)sender
{
    [self.menuContainerViewController toggleRightSideMenuCompletion:nil];
}

#pragma mark - UITABLEVIEW DELEGATE AND DATASOURCE METHODS

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView==tblTeamPosterView)
    {
        return arrTeamPoster.count;
        
    }
    else
    {
        return [arrSearchTeamList count];
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==tblTeamPosterView) {
        
        return 152;
       
    }else{
         return 35;
    }
}
-(void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView==tblTeamList)
    {
        cell.imageView.layer.cornerRadius=2.0;
        cell.imageView.layer.masksToBounds=YES;
        CGSize itemSize = CGSizeMake(30,30);
        UIGraphicsBeginImageContextWithOptions(itemSize, NO, UIScreen.mainScreen.scale);
        CGRect imageRect = CGRectMake(5, 5, itemSize.width, itemSize.height);
        [cell.imageView.image drawInRect:imageRect];
        cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        [cell.imageView setFrame:CGRectMake(2, 2, cell.imageView.frame.size.width-5, cell.imageView.frame.size.height-5)];
     }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==tblTeamPosterView)
    {
        NSString *cellIdentifier =@"cellTeamPoster";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        
        if (!cell)
        {
            cell = [[UITableViewCell alloc]
                    initWithStyle:UITableViewCellStyleDefault
                    reuseIdentifier:cellIdentifier];
        }
        
   ICTeamPosterDataHolder *teamPosterDHolder=(ICTeamPosterDataHolder*)[arrTeamPoster objectAtIndex:indexPath.row];
        
        ICLikeCommentButton *btnPosterCubeReceived=(ICLikeCommentButton *)[cell.contentView viewWithTag:3];
        ICLikeCommentButton *btnPosterCubeSent=(ICLikeCommentButton *)[cell.contentView viewWithTag:4];
        UIScrollView        *scrollView=(UIScrollView*)[cell.contentView viewWithTag:5];
        
        UILabel             *lblUserName=(UILabel *)[cell.contentView viewWithTag:1];
        UILabel             *lblPosterCubeRecieveNumber = (UILabel *)[cell.contentView viewWithTag:6];
        UILabel             *lblPosterCubeSentNumber = (UILabel *)[cell.contentView viewWithTag:7];
        UILabel             *lblPosterCubeLine1 = (UILabel *)[cell.contentView viewWithTag:8];
        UILabel             *lblPosterCubeLine2 = (UILabel *)[cell.contentView viewWithTag:9];
        
        //poster image
        UIImageView         *imgUserPoster=(UIImageView *)[cell.contentView viewWithTag:2];
        [imgUserPoster removeFromSuperview];
        imgUserPoster=nil;
        imgUserPoster = [[UIImageView alloc]initWithFrame:CGRectMake(40, 5, 75, 90)];
        imgUserPoster.tag=2;
        [cell.contentView addSubview:imgUserPoster];
        [imgUserPoster setImageWithUrl:[NSURL URLWithString:teamPosterDHolder.strUserImage]
                         andPlaceHoder:[UIImage imageNamed:NO_IMAGE_AVAILABLE]
                            andNoImage:[UIImage imageNamed:NO_IMAGE]];
        imgUserPoster.contentMode=UIViewContentModeScaleAspectFit;
        
        lblUserName.text=teamPosterDHolder.strUserName;
        
        if (teamPosterDHolder.countReceivedCube==0)
        {
            lblPosterCubeLine1.text=@"Cube";
        }
        else
        {
            lblPosterCubeLine1.text=@"Cubes";
        }
        
        if (teamPosterDHolder.countPostedCube==0)
        {
            lblPosterCubeLine2.text=@"Cube";
        }
        else
        {
            lblPosterCubeLine2.text=@"Cubes";
        }
        
        lblPosterCubeRecieveNumber.text=[NSString stringWithFormat:@"%ld",(long)teamPosterDHolder.countReceivedCube];
        lblPosterCubeSentNumber.text = [NSString stringWithFormat:@"%ld",(long)teamPosterDHolder.countPostedCube];
        
        btnPosterCubeReceived.layer.cornerRadius=3;
        btnPosterCubeSent.layer.cornerRadius=3;
        
        [btnPosterCubeReceived addTarget:self
                                  action:@selector(btnPosterCubeReceivedDidClicked:)
                        forControlEvents:UIControlEventTouchUpInside];
        btnPosterCubeReceived.index=indexPath.row;
        
        [btnPosterCubeSent addTarget:self
                              action:@selector(btnPosterCubeSentDidClicked:)
                    forControlEvents:UIControlEventTouchUpInside];
        btnPosterCubeSent.index=indexPath.row;
        
        //cube images show on scrollview
        scrollView.delegate = self;
        scrollView.scrollEnabled = YES;
        scrollView.showsHorizontalScrollIndicator=NO;
        int scrollWidth =50;
        int xOffset = 0;
        
        for(UIView *subview in [scrollView subviews])
        {
            [subview removeFromSuperview];
        }
        
        if(teamPosterDHolder.isCubeRcvSelected)
        {
            btnPosterCubeReceived.backgroundColor=[UIColor blackColor];
            btnPosterCubeReceived.frame=CGRectMake(124, 24, 70, 77);
            btnPosterCubeSent.backgroundColor=[UIColor lightGrayColor];
            btnPosterCubeSent.frame=CGRectMake(199, 24, 70, 65);
            
            arrPosterCubeRcvSend=[teamPosterDHolder.arrReceivedCube mutableCopy];
            
        }else
        {
            btnPosterCubeReceived.backgroundColor=[UIColor lightGrayColor];
            btnPosterCubeReceived.frame=CGRectMake(124, 24,70,65);
            btnPosterCubeSent.backgroundColor=[UIColor blackColor];
            btnPosterCubeSent.frame=CGRectMake(199, 24, 70,77);
            
            arrPosterCubeRcvSend=[teamPosterDHolder.arrPostedCube mutableCopy];
            
        }
        
        NSString *imgCubeRcvSend;
        arrRcvSendCubeScroll = [[NSMutableArray alloc]init];
        
        if (arrPosterCubeRcvSend.count==0)
        {
            UILabel *lbl=[[UILabel alloc]initWithFrame:scrollView.bounds];
            lbl.frame=CGRectMake(50, 10, 150, 30);
            [lbl setFont:[UIFont fontWithName:@"Times New Roman" size:14]];
            lbl.text=@"Cubes are not available.";
            lbl.textColor=[UIColor whiteColor];
            [scrollView addSubview:lbl];
            scrollView.contentSize = CGSizeMake(scrollWidth,45);
        
        }
        else
        {
            scrollView.scrollEnabled = YES;
            for(int index=0; index < [arrPosterCubeRcvSend count]; index++)
            {
                ICCubeImageView *imgView = [[ICCubeImageView alloc] init];
                imgView.bounds = CGRectMake(5,5,40,40);
                imgView.frame = CGRectMake(5+xOffset,5,40,40);
                imgCubeRcvSend=[[arrPosterCubeRcvSend objectAtIndex:index] valueForKey:@"cube_image"];
                
                [imgView setImageWithUrl:[NSURL URLWithString:imgCubeRcvSend]
                           andPlaceHoder:[UIImage imageNamed:NO_IMAGE_AVAILABLE]
                              andNoImage:[UIImage imageNamed:NO_IMAGE]];
                
                imgView.userInteractionEnabled=YES;
                imgView.imageIndex=index;
                UITapGestureRecognizer *tapped = [[UITapGestureRecognizer alloc]
                                                  initWithTarget:self
                                                  action:@selector(tblVScrollCubeImageDidClicked:)];
                tapped.numberOfTapsRequired = 1;
                [imgView addGestureRecognizer:tapped];
                                
                [arrRcvSendCubeScroll insertObject:imgView atIndex:index];
                scrollView.contentSize = CGSizeMake(scrollWidth+xOffset,45);
                [scrollView addSubview:[arrRcvSendCubeScroll objectAtIndex:index]];
                
                xOffset+=45;
            }
        }
       
        return cell;
    }
    else
    {
        NSString *cellIdentifier =@"cellTeamList";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        
        if (!cell) {
            
            cell = [[UITableViewCell alloc]
                    initWithStyle:UITableViewCellStyleDefault
                    reuseIdentifier:cellIdentifier];
        }
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        
        ICTeamListDataHolder *teamListDHolder;
        teamListDHolder = (ICTeamListDataHolder*)[arrSearchTeamList objectAtIndex:indexPath.row];
      
        cell.backgroundColor=[UIColor colorWithRed:187.0/255 green:187.0/255 blue:193.0/255 alpha:0.6];
        [cell.textLabel setFont:[UIFont systemFontOfSize:14]];
        
        cell.textLabel.text=teamListDHolder.strTeamName;
        
        [cell.imageView setImageWithUrl:[NSURL URLWithString:teamListDHolder.strTeamImageUrl]
                     andPlaceHoder:[UIImage imageNamed:NO_IMAGE_AVAILABLE]
                          andNoImage:[UIImage imageNamed:NO_IMAGE]];
        
        return cell;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
   popOverView.hidden = YES; 
    
   if(tableView==tblTeamList)
   {
        [searchTeamBar resignFirstResponder];
      
       if (arrSearchTeamList.count>0)
       {
           ICTeamListDataHolder *teamDHolder=[arrSearchTeamList objectAtIndex:indexPath.row];
           searchTeamBar.text=teamDHolder.strTeamName;
           tblTeamList.frame=CGRectMake(tblTeamList.frame.origin.x,tblTeamList.frame.origin.y, tblTeamList.frame.size.width, 0);
           
           //api calling
           [HUD show];
           NSMutableDictionary *info=[[NSMutableDictionary alloc]init];
           [info setValue:[NSString stringWithFormat:@"%ld",(long)teamDHolder.intTeamId]forKey:@"team_id"];
           [self requestTeamDetail:info];

       }
   }
}
#pragma mark - UISEARCHBAR DELEGATE MATHODS

-(void)searchViewShouldBeginEditing:(UISearchBar *)searchBar
{
    
    
}

-(void)searchViewShouldSearchButtonClick:(UISearchBar *)searchBar searchText:(NSString *)searchText
{
    if (![searchBar.text isEqualToString:currentSearchText])
    {
        if(searchText.length == 0)
        {
            dispatch_async(dispatch_get_main_queue(), ^
                           {
                               tblTeamList.frame=CGRectMake(tblTeamList.frame.origin.x,tblTeamList.frame.origin.y, tblTeamList.frame.size.width, 0);
                               
                           });
            
            [searchTeamBar resignFirstResponder];
        }
        else
        {
            arrSearchTeamList=[[NSMutableArray alloc]init];
            [arrSearchTeamList removeAllObjects];
            
            for (ICTeamListDataHolder *teamDHolder in arrTeamList)
            {
                NSString *strTeamName;
                strTeamName =[NSString stringWithFormat:@"%@",teamDHolder.strTeamName];
                NSRange teamRange=[strTeamName rangeOfString:searchText options:NSCaseInsensitiveSearch];
                
                if(teamRange.location !=NSNotFound)
                {
                    [arrSearchTeamList addObject:teamDHolder];
                    
                 }
              }
          }
        
        dispatch_async(dispatch_get_main_queue(), ^
            {
                [tblTeamList reloadData];
              
                if(arrSearchTeamList.count>10){
                    
                    if(IS_IPHONE_5)
                    {
                        tblTeamList.frame=CGRectMake(6,48,308,455);
                    }
                    else
                    {
                        tblTeamList.frame=CGRectMake(6,48,308,350);
                    }
                }
                else{
                    
                    tblTeamList.frame=CGRectMake(6,48,308,arrSearchTeamList.count*35);
                }
            });
      }
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    [self searchViewShouldBeginEditing:searchBar];
    
    for(id subview in [searchBar subviews])
    {
        if ([subview isKindOfClass:[UIButton class]]) {
            
            [subview setEnabled:YES];
        }
    }
    return YES;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{    
    if(searchTeamBar.text.length == 0)
    {
        [searchTeamBar resignFirstResponder];
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [arrSearchTeamList removeAllObjects];
                            tblTeamList.frame=CGRectMake(tblTeamList.frame.origin.x,tblTeamList.frame.origin.y, tblTeamList.frame.size.width, 0);
                           [tblTeamList reloadData];
                          
                        });
    }
    
    [self searchViewShouldSearchButtonClick:searchBar searchText:searchBar.text];
  
}

- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar
{
    [self.searchDisplayController.searchBar setText:@""];
      dispatch_async(dispatch_get_main_queue(), ^
                   {
                       [tblTeamList reloadData];
                       
                   });
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchTeamBar resignFirstResponder];
    
}

# pragma mark - API CAllING

-(void)requestTeamList:(NSMutableDictionary *)info
{
    if([ICUtils isConnectedToHost])
    {
        [[ICRestIntraction sharedManager] requestForTeamList:info];
    }
    else
    {
        [HUD hide];
        [ICUtils showAlert:MESSAGE_NET_NOT_AVAILABLE delegate:self btnOk:@"Ok" btnCancel:nil];
    }
}
-(void)requestTeamDetail:(NSMutableDictionary *)info{
    
    if([ICUtils isConnectedToHost])
    {
        [[ICRestIntraction sharedManager] requestForTeamDetail:info];
    }
    else
    {
        [HUD hide];
        [ICUtils showAlert:MESSAGE_NET_NOT_AVAILABLE delegate:self btnOk:@"Ok" btnCancel:nil];
    }
}

-(void)requestTeamPosterDetail:(NSMutableDictionary *)info{
    
    if([ICUtils isConnectedToHost])
    {
        [[ICRestIntraction sharedManager] requestForTeamPosterDetail:info];
    }
    else
    {
        [HUD hide];
        [ICUtils showAlert:MESSAGE_NET_NOT_AVAILABLE delegate:self btnOk:@"Ok" btnCancel:nil];
    }
}

# pragma mark - NSNotification Selector

-(void)getTeamListSuccess:(NSNotification *)notification
{
    arrTeamList = (NSMutableArray*)notification.object;
    [tblTeamList reloadData];
}

-(void)getTeamListFailed:(NSNotification *)notification
{
    [HUD hide];
}
-(void)getTeamDetailSuccess:(NSNotification *)notification
{
    arrTeamDetail = (NSMutableArray*)notification.object;
   
    ICTeamListDataHolder *teamDetailDHolder=[arrTeamDetail objectAtIndex:0];
    
    lblTeamName.text=teamDetailDHolder.strTeamName;
    lblTeamDescription.text=teamDetailDHolder.strTeamDescription;
    lblTeamDescription.adjustsFontSizeToFitWidth=YES;
    
//    if (teamDetailDHolder.intTeamReceivedCube==0)
//    {
//        lblTeamCubeLine.text=@"cube";
//    }
//    else
//    {
//        lblTeamCubeLine.text=@"cubes";
//    }
    
    lblTeamReceivedCube.text=[NSString stringWithFormat:@"%ld",(long)teamDetailDHolder.intTeamReceivedCube];
    [imgTeamView setImageWithUrl:[NSURL URLWithString:teamDetailDHolder.strTeamImageUrl]
                andPlaceHoder:[UIImage imageNamed:NO_IMAGE_AVAILABLE]
                   andNoImage:[UIImage imageNamed:NO_IMAGE]];
    imgTeamView.layer.cornerRadius=5;
    imgTeamView.layer.masksToBounds=NO;
    
    arrTeamCubeRcv=[[NSMutableArray alloc]init];
    arrTeamCubeRcv=teamDetailDHolder.arrTeamReceivedCube;
    
    if(arrTeamCubeRcv.count<2){
        
        lblRecentCube.text=@" Recent Cube";
        
    }else{
       
        lblRecentCube.text=@" Recent Cubes";
    }
    
    [self teamCubeReceived:nil];
    lblTeamNameHeadline.text=[NSString stringWithFormat:@" %@",teamDetailDHolder.strTeamName];
    
    //api calling
    NSMutableDictionary *info=[[NSMutableDictionary alloc]init];
    [info setValue:[NSString stringWithFormat:@"%ld",(long)teamDetailDHolder.intTeamId]forKey:@"team_id"];
    [self requestTeamPosterDetail:info];
   
}

-(void)getTeamDetailFailed:(NSNotification *)notification
{
    [HUD hide];
}

-(void)getTeamPosterDetailSuccess:(NSNotification *)notification
{
    [HUD hide];
    arrTeamPoster=(NSMutableArray *)notification.object;
    [tblTeamPosterView reloadData];
    
}

-(void)getTeamPosterDetailFailed:(NSNotification *)notification
{
    [HUD hide];
}

#pragma mark - CUBE SCROLL_VIEW ACTION

-(void)scrollViewCubeImageDidClicked:(UITapGestureRecognizer*)sender{
    
   popOverView.hidden = YES;
    
   ICCubeImageView    *imgCube = (ICCubeImageView*)sender.view;
   ICTeamListDataHolder *teamDetailDHolder=[arrTeamDetail objectAtIndex:0];
   ICCubeRecentHolder *cubeRecentDHolder=[[ICCubeRecentHolder alloc]init];
     
   cubeRecentDHolder.strCubeComment=[[arrTeamCubeRcv objectAtIndex:imgCube.imageIndex]valueForKey:@"cube_comments"];
   cubeRecentDHolder.imgCubeSender=[[arrTeamCubeRcv objectAtIndex:imgCube.imageIndex]valueForKey:@"sender_image"];
   cubeRecentDHolder.strCubeTitle=[[arrTeamCubeRcv objectAtIndex:imgCube.imageIndex]valueForKey:@"cube_title"];
   cubeRecentDHolder.imgCubeReceiver=teamDetailDHolder.strTeamImageUrl;
   
    CGPoint location= [sender locationInView:self.view];
    
    ICPopOverViewController *popOverController= [[ICPopOverViewController alloc] init];
    popOverController.cubeRecentDetailDHolder=cubeRecentDHolder;
    FPPopoverController *popover = [[FPPopoverController alloc] initWithViewController:popOverController];
    
    if(cubeRecentDHolder.strCubeComment.length<101){
    
        popover.contentSize = CGSizeMake(170,158);
        
    }else{
        
        popover.contentSize = CGSizeMake(170,185);
    }
    
    popover.arrowDirection=FPPopoverArrowDirectionUp;
    popover.border = NO;
    popover.tint = FPPopoverLightGrayTint;
    popover.alpha = 1;
    popOver=popover;
    
   [popOver presentPopoverFromPoint:CGPointMake(location.x, 210)];
 
}
-(void)tblVScrollCubeImageDidClicked:(id)sender{
    
    UITapGestureRecognizer *tap = (UITapGestureRecognizer *)sender;
    
    CGPoint location = [tap locationInView:self.view];
    CGPoint locationTbl = [tap locationInView:tblTeamPosterView];
    
    NSIndexPath *indexPath = [tblTeamPosterView indexPathForRowAtPoint:locationTbl];
    
    ICCubeImageView *imgCube = (ICCubeImageView*)tap.view;
    ICTeamPosterDataHolder *teamPosterDHolder=[arrTeamPoster objectAtIndex:indexPath.row];
    
    if(teamPosterDHolder.isCubeRcvSelected){
        
        arrPosterCubeRcvSend=[teamPosterDHolder.arrReceivedCube mutableCopy];
        
    }else{
        
        arrPosterCubeRcvSend=[teamPosterDHolder.arrPostedCube mutableCopy];
        
    }
    
    NSString *strCubeClickedId;
    strCubeClickedId=[[arrPosterCubeRcvSend objectAtIndex:imgCube.imageIndex]valueForKey:@"cube_id"];
    
    NSMutableArray *arrCubeList=[[NSMutableArray alloc]init];
    arrCubeList= [[ICDataBaseInteraction databaseInteractionManager] getCubeFromDatabase];
    
    for(int i=0;i<arrCubeList.count;i++)
    {
        ICCubeAwardHolder *cubeAwardDHolder=[arrCubeList objectAtIndex:i];
        
        if([cubeAwardDHolder.strCubeId isEqualToString:strCubeClickedId])
        {
            popOverView.txtView.frame=CGRectMake(location.x,location.y,100,38);
            popOverView.txtView.font=[UIFont systemFontOfSize:8];
            popOverView.txtView.backgroundColor=[UIColor grayColor];
            popOverView.txtView.textColor=[UIColor whiteColor];
            
            popOverView.txtView.text=[NSString stringWithFormat:@"%@:%@",cubeAwardDHolder.strCubeTitle,                                 cubeAwardDHolder.strCubeValue];
            
            popOverView.hidden = NO;
        }
    }
}

#pragma mark - OTHER_METHODS

-(void)teamDetails
{
    [self requestTeamList:nil];
    
    NSMutableDictionary *info=[[NSMutableDictionary alloc]init];
    NSString *strTeamId=[[NSUserDefaults standardUserDefaults] valueForKey:KEY_USER_TEAM_ID];
    [info setValue:strTeamId forKey:@"team_id"];
    [self requestTeamDetail:info];
    
}
-(void)refreshThroughHomeView:(NSNotification *)notification
{
    [self teamDetails];
}

-(void)btnPosterCubeReceivedDidClicked:(id)sender{
    
    popOverView.hidden = YES;
    
    ICLikeCommentButton*btnCubeReceived=(ICLikeCommentButton*)sender;
    ICTeamPosterDataHolder *teamPosterDHolder=[arrTeamPoster objectAtIndex:btnCubeReceived.index];
    
    if(teamPosterDHolder.isCubeRcvSelected==NO){
        
        teamPosterDHolder.isCubeRcvSelected=YES;
        teamPosterDHolder.isCubeSendSelected=NO;
        
    }
    [tblTeamPosterView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:btnCubeReceived.index inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
}
-(void)btnPosterCubeSentDidClicked:(id)sender{
    
    popOverView.hidden = YES;
    
   ICLikeCommentButton*btnCubeSent=(ICLikeCommentButton*)sender;
   ICTeamPosterDataHolder *teamPosterDHolder=(ICTeamPosterDataHolder*)[arrTeamPoster objectAtIndex:btnCubeSent.index];
    
    if(teamPosterDHolder.isCubeSendSelected==NO){
        
        teamPosterDHolder.isCubeSendSelected=YES;
        teamPosterDHolder.isCubeRcvSelected=NO;
        
    }
    [tblTeamPosterView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:btnCubeSent.index inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
}

@end
