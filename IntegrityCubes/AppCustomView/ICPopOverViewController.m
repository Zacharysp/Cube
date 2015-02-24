//
//  ICPopOverViewController.m
//  IntegrityCubes
//
//  Created by aditi on 28/04/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//

#import "ICPopOverViewController.h"

@interface ICPopOverViewController ()

@end

@implementation ICPopOverViewController
@synthesize cubeRecentDetailDHolder;

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
    
        self.view.backgroundColor = [UIColor grayColor];

        UITextView *txtView=[[UITextView alloc]initWithFrame:CGRectMake(0,2,150,20)];
        txtView.layer.cornerRadius=3;
        txtView.layer.backgroundColor = [UIColor clearColor].CGColor;
        txtView.textColor=[UIColor whiteColor];
        txtView.font=[UIFont boldSystemFontOfSize:13];
        txtView.layer.masksToBounds = YES;
        
        txtView.scrollEnabled=YES;
        txtView.userInteractionEnabled=NO;
        txtView.editable=NO;
        [txtView setContentInset:UIEdgeInsetsMake(-5, 0, 5,0)];
    
        UITextView *txtCommentView=[[UITextView alloc]init];
    
        if(cubeRecentDetailDHolder.strCubeComment.length<101){

            txtCommentView.frame= CGRectMake(2,60,145,55);

        }else{

            txtCommentView.frame= CGRectMake(2,60,145,80);
        }
        txtCommentView.layer.cornerRadius = 3;
        txtCommentView.layer.backgroundColor = [UIColor clearColor].CGColor;
        txtCommentView.font=[UIFont systemFontOfSize:8];
        txtCommentView.layer.masksToBounds = YES;
        txtCommentView.textColor=[UIColor whiteColor];
    
        txtCommentView.scrollEnabled=YES;
        txtCommentView.userInteractionEnabled=NO;
        txtCommentView.editable=NO;
        [txtCommentView setContentInset:UIEdgeInsetsMake(-5, 0, 5,0)];
    
        UIImageView *imgSenderView =[[UIImageView alloc]initWithFrame:CGRectMake(20, 25, 35, 35)];
        imgSenderView.layer.cornerRadius=3;
        imgSenderView.layer.masksToBounds = YES;
    
        UIImageView *imgReceiverView =[[UIImageView alloc]initWithFrame:CGRectMake(95, 25, 35, 35)];
        imgReceiverView.layer.cornerRadius=3;
        imgReceiverView.layer.masksToBounds = YES;

        UIImageView *imgArrowView=[[UIImageView alloc]initWithFrame:CGRectMake(70, 38, 10, 10)];
        
//       txtView.text=@"Ttile";
        txtView.text=cubeRecentDetailDHolder.strCubeTitle;
       [imgSenderView setImageWithUrl:[NSURL URLWithString:cubeRecentDetailDHolder.imgCubeSender]
                     andPlaceHoder:[UIImage imageNamed:NO_IMAGE_AVAILABLE]
                        andNoImage:[UIImage imageNamed:NO_IMAGE]];
    
       [imgReceiverView setImageWithUrl:[NSURL URLWithString:cubeRecentDetailDHolder.imgCubeReceiver]
                     andPlaceHoder:[UIImage imageNamed:NO_IMAGE_AVAILABLE]
                        andNoImage:[UIImage imageNamed:NO_IMAGE]];
        imgArrowView.image=[UIImage imageNamed:@"arrow.png"];
        txtCommentView.text=cubeRecentDetailDHolder.strCubeComment;
//        txtCommentView.text=@"Aditi";
    
        
        [self.view addSubview:txtView];
        [self.view addSubview:txtCommentView];
        [self.view addSubview:imgSenderView];
        [self.view addSubview:imgArrowView];
        [self.view addSubview:imgReceiverView];         

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
