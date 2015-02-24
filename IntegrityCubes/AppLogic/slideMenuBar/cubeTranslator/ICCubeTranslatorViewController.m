//
//  ICCubeTranslatorViewController.m
//  IntegrityCubes
//
//  Created by aditi on 18/03/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//

#import "ICCubeTranslatorViewController.h"
#define CORNER_RADIUS_INNER_VIEW 102
#define SCROLLVIEW_WIDTH 190
#define FRAME_INNER_VIEW CGRectMake(44, 44, 212, 212)
@interface ICCubeTranslatorViewController ()

@end

@implementation ICCubeTranslatorViewController

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
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getCubeTranslatorSuccess:) name:NOTIFICATION_CUBE_TRANSLATOR_SUCCESS object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getCubeTranslatorFailed:) name:NOTIFICATION_CUBE_TRANSLATOR_FAILED object:nil];
    
    UIView *viewContainer;
    
    if (IS_IPHONE_5)
    {
        viewContainer=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 504)];
    }
    else
    {
        viewContainer=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 416)];
    }
    
    [self.view addSubview:viewContainer];

    cubeTranslatorView = [[ICCubeTranslatorView alloc]
                          initWithFrame:CGRectMake(0, 0, 300,300)];
    
    cubeTranslatorView.center = viewContainer.center;
    [viewContainer addSubview:cubeTranslatorView];
    
    if(IS_IPHONE_5)
    {
         bgHudView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320,568)];
    }
    else
    {
         bgHudView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320,480)];
    }
    
    bgHudView.backgroundColor=[UIColor groupTableViewBackgroundColor];
   
    cubeTranslatorView.delegate=self;
    [self.view addSubview:cubeTranslatorView];
    [self.view addSubview:bgHudView];
    
    HUD=[[AryaHUD alloc]init];
    [bgHudView addSubview:HUD];
    [HUD show];
    
    //api calling
    if([ICUtils isConnectedToHost])
    {
        [HUD show];
       [self requestCubeTransalator:nil];
        
    }else{
        
        [HUD hide];
        [ICUtils showAlert:MESSAGE_NET_NOT_AVAILABLE];
        
    }
    
    //check for reachability change
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(reachabilityCubeTranslatorStatusChange:)
                                                name:kReachabilityChangedNotification
                                              object:nil];
    
    
  
}
-(void)reachabilityCubeTranslatorStatusChange:(NSNotification*)notification{
    
    if ([ICUtils isConnectedToHost])
    {
        [HUD show];
        [self requestCubeTransalator:nil];
        
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - IB_ACTIONS
- (IBAction)showRightMenuPressed:(id)sender
{   
    [self.menuContainerViewController toggleRightSideMenuCompletion:nil];
}

-(void)cubeExampleView:(id)sender cubeTag:(NSInteger)cubeTag
{
    previousIndex=cubeTag;
    exampleCounter=0;
    cubeTranslatorDHolder=[arrCubeTranslatorData objectAtIndex:cubeTag];
    [cubeExampleView removeFromSuperview];
    cubeExampleView = [[UIView alloc]initWithFrame:FRAME_INNER_VIEW];
    CALayer *exampleViewLayer = cubeExampleView.layer;
    cubeExampleView.backgroundColor = [UIColor whiteColor];
    exampleViewLayer.masksToBounds = YES;
    exampleViewLayer.cornerRadius = CORNER_RADIUS_INNER_VIEW;
    
    [sclExample removeFromSuperview];
    
    sclExample=[[UIScrollView alloc]initWithFrame:CGRectMake(35, 20, 190, 190)];
    
    UILabel *lblCubeName=[[UILabel alloc]initWithFrame:CGRectMake(10,15,120,20)];
    lblCubeName.text=cubeTranslatorDHolder.strCubeTitle;
    lblCubeName.font=[UIFont systemFontOfSize:12];
    lblCubeName.textAlignment=NSTextAlignmentCenter;
    
    UIImageView *imgCubeView=[[UIImageView alloc]initWithFrame:CGRectMake(55,40,30,30)];
    [imgCubeView setImageWithUrl:[NSURL URLWithString:cubeTranslatorDHolder.strCubeImage]
                  andPlaceHoder:[UIImage imageNamed:NO_IMAGE_AVAILABLE]
                     andNoImage:[UIImage imageNamed:NO_IMAGE]];
    
    UITextView *txtView=[[UITextView alloc]initWithFrame:CGRectMake(5,70,140,70)];
    txtView.text=cubeTranslatorDHolder.strCubeDescription;
    txtView.textAlignment=NSTextAlignmentCenter;
    txtView.font=[UIFont systemFontOfSize:10];
    txtView.editable=NO;
    txtView.scrollEnabled=YES;
    txtView.backgroundColor=[UIColor whiteColor];
   
    [sclExample addSubview:lblCubeName];
    [sclExample addSubview:imgCubeView];
    [sclExample addSubview:txtView];
    
    NSInteger sclWitdh=190;
    NSInteger exampleCount=cubeTranslatorDHolder.arrJobExample.count;
    if (exampleCount>20)
    {
        exampleCount=20;
    }
    for (int i=0; i<exampleCount; i++)
    {
        NSString *strRecieverImg=[[cubeTranslatorDHolder.arrJobExample objectAtIndex:i] valueForKey:@"receive_by"];
        NSString *strSenderImg=[[cubeTranslatorDHolder.arrJobExample objectAtIndex:i] valueForKey:@"send_by"];
        NSString *strRecieverName=[[cubeTranslatorDHolder.arrJobExample objectAtIndex:i] valueForKey:@"receiver_name"];
        NSString *strRecieverJobTitle=[[cubeTranslatorDHolder.arrJobExample objectAtIndex:i] valueForKey:@"receiver_jobtitle"];
        NSString *strMessage=[[cubeTranslatorDHolder.arrJobExample objectAtIndex:i] valueForKey:@"jobtitle_description"];
        
        UIImageView *imgPosterView=[[UIImageView alloc]initWithFrame:CGRectMake(sclWitdh+20,30,30,30)];
        [imgPosterView setImageWithUrl:[NSURL URLWithString:strSenderImg]
                         andPlaceHoder:[UIImage imageNamed:NO_IMAGE_AVAILABLE]
                            andNoImage:[UIImage imageNamed:NO_IMAGE]];
        
        UIImageView *imgPlayView=[[UIImageView alloc]initWithFrame:CGRectMake(sclWitdh+70,40,10,10)];
        imgPlayView.image=[UIImage imageNamed:@"arrow.png"];
        
        UIImageView *imgReceiverView=[[UIImageView alloc]initWithFrame:CGRectMake(sclWitdh+100,30,30,30)];
        [imgReceiverView setImageWithUrl:[NSURL URLWithString:strRecieverImg]
                           andPlaceHoder:[UIImage imageNamed:NO_IMAGE_AVAILABLE]
                              andNoImage:[UIImage imageNamed:NO_IMAGE]];
        
        UILabel *lblReciverName=[[UILabel alloc]initWithFrame:CGRectMake(sclWitdh+20,60,110,20)];
        lblReciverName.text=strRecieverName;
        lblReciverName.textColor=[UIColor colorWithRed:70.0/2555 green:130.0/255 blue:180.0/255 alpha:0.8];
        lblReciverName.font=[UIFont systemFontOfSize:13];
        lblReciverName.adjustsFontSizeToFitWidth=YES;
        lblReciverName.textAlignment=NSTextAlignmentCenter;
        
        UILabel *lblReciverPost=[[UILabel alloc]initWithFrame:CGRectMake(sclWitdh+20,72,110,20)];
        lblReciverPost.text=strRecieverJobTitle;
        lblReciverPost.textColor=[UIColor colorWithRed:105.0/255 green:105.0/255 blue:105.0/255 alpha:1];
        lblReciverPost.font=[UIFont systemFontOfSize:10];
        lblReciverPost.textAlignment=NSTextAlignmentCenter;
        lblReciverPost.adjustsFontSizeToFitWidth=YES;
       
        UITextView *txtViewComment=[[UITextView alloc]initWithFrame:CGRectMake(sclWitdh+03,90,140,60)];
        txtViewComment.text=strMessage;
        txtViewComment.textAlignment=NSTextAlignmentCenter;
        txtViewComment.font=[UIFont systemFontOfSize:10];
        txtViewComment.editable=NO;
        txtViewComment.userInteractionEnabled=YES;
        txtViewComment.scrollEnabled=YES;
        txtViewComment.backgroundColor=[UIColor whiteColor];
        
        [sclExample addSubview:imgPlayView];
        [sclExample addSubview:imgPosterView];
        [sclExample addSubview:imgReceiverView];
        [sclExample addSubview:lblReciverName];
        [sclExample addSubview:lblReciverPost];
        [sclExample addSubview:txtViewComment];
        sclWitdh=sclWitdh+190;
    }
    
    UIButton *btnRightArrowView=[[UIButton alloc]initWithFrame:CGRectMake(180,100,25,25)];
    [btnRightArrowView setImage:[UIImage imageNamed:@"arrowCubeTranslatorRight.png"] forState:UIControlStateNormal];
    [btnRightArrowView addTarget:self action:@selector(btnRightArrowDidClicked:)
                forControlEvents:UIControlEventTouchUpInside];
    btnRightArrowView.layer.borderColor=[UIColor blackColor].CGColor;
    btnRightArrowView.layer.borderWidth=0.2;
    [btnRightArrowView setShowsTouchWhenHighlighted:YES];
    
    UIButton *btnLeftArrowView=[[UIButton alloc]initWithFrame:CGRectMake(10,100,25,25)];
    [btnLeftArrowView setImage :[UIImage imageNamed:@"arrowCubeTranslatorLeft.png"] forState:UIControlStateNormal];
    [btnLeftArrowView addTarget:self action:@selector(btnLeftArrowDidClicked:)
               forControlEvents:UIControlEventTouchUpInside];
    btnLeftArrowView.layer.borderColor=[UIColor blackColor].CGColor;
    btnLeftArrowView.layer.borderWidth=0.2;
    [btnLeftArrowView setShowsTouchWhenHighlighted:YES];

    [cubeExampleView addSubview:sclExample];
    [cubeExampleView addSubview:btnRightArrowView];
    [cubeExampleView addSubview:btnLeftArrowView];
    [cubeTranslatorView addSubview:cubeExampleView];
}

-(void)btnRightArrowDidClicked:(id)sender
{
    if (exampleCounter==cubeTranslatorDHolder.arrJobExample.count)
    {
        exampleCounter=cubeTranslatorDHolder.arrJobExample.count;
    }
    CGPoint point = sclExample.contentOffset;
    int xpos = point.x;
    if (xpos%190==0)
    {
        if (exampleCounter<cubeTranslatorDHolder.arrJobExample.count)
        {
            CGPoint point = sclExample.contentOffset;
            [sclExample setContentOffset:CGPointMake(point.x+190, point.y) animated:YES];
            exampleCounter++;
        }
    }
}

-(void)btnLeftArrowDidClicked:(id)sender
{
    CGPoint point = sclExample.contentOffset;
    int xpos = point.x;
    if (xpos%190==0)
    {
        if (exampleCounter>0)
        {
            CGPoint point = sclExample.contentOffset;
            [sclExample setContentOffset:CGPointMake(point.x-190, point.y) animated:YES];
              exampleCounter--;
        }
    }
}
#pragma mark - API CALLING
-(void)requestCubeTransalator:(NSMutableDictionary*)info
{
    if([ICUtils isConnectedToHost])
    {
         [[ICRestIntraction sharedManager] requestForCubeTranslator:info];
    }
    else
    {
        [HUD hide];
        [ICUtils showAlert:MESSAGE_NET_NOT_AVAILABLE delegate:self btnOk:@"Ok" btnCancel:nil];
    }
}
# pragma mark - NSNotification Selector

-(void)getCubeTranslatorSuccess:(NSNotification *)notification
{
    [HUD hide];
    [bgHudView removeFromSuperview];
    arrCubeTranslatorData=(NSMutableArray*)notification.object;
    [self cubeExampleView:self cubeTag:0];
        
}
-(void)getCubeTranslatorFailed:(NSNotification *)notification
{
    [HUD hide];
    [bgHudView removeFromSuperview];
}

@end
