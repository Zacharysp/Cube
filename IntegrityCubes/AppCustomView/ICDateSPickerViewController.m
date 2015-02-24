//
//  ICDateSPickerViewController.m
//  IntegrityCubes
//
//  Created by Bhuvan Sharma on 14/04/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//

#import "ICDateSPickerViewController.h"

@interface ICDateSPickerViewController ()

@end

@implementation ICDateSPickerViewController
@synthesize delegate;

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
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    UIView *viewCnlD=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 300, 34)];
    viewCnlD.backgroundColor=[UIColor colorWithRed:193.0/255 green:0 blue:33.0/255 alpha:1];
    
    UIButton *btnCancel=[[UIButton alloc]initWithFrame:viewCnlD.bounds];
    btnCancel.frame=CGRectMake(5, 2, 54, 30);
    btnCancel.backgroundColor=[UIColor clearColor];
    [btnCancel setTitle:@"Cancel" forState:UIControlStateNormal];
    [btnCancel.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [btnCancel setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnCancel addTarget:self action:@selector(removePopoverView:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btnDone=[[UIButton alloc]initWithFrame:viewCnlD.bounds];
    btnDone.frame=CGRectMake(250, 2, 46, 30);
    btnDone.backgroundColor=[UIColor clearColor];
    [btnDone setTitle:@"Done" forState:UIControlStateNormal];
    [btnDone.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [btnDone setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnDone addTarget:self
             action:@selector(doneSelectDate:)
            forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:viewCnlD];
    
    [viewCnlD addSubview:btnCancel];
    [viewCnlD addSubview:btnDone];
    
    
    UILabel *lblStartDateTitle=[[UILabel alloc]initWithFrame:CGRectMake(80, 58, 142, 30)];
//    lblStartDateTitle.backgroundColor=[UIColor blackColor];
    lblStartDateTitle.textColor=[UIColor blackColor];
    lblStartDateTitle.layer.borderColor=[UIColor grayColor].CGColor;
    lblStartDateTitle.layer.cornerRadius=5.0f;
    lblStartDateTitle.layer.borderWidth=0.5f;
    lblStartDateTitle.layer.masksToBounds=YES;
    [lblStartDateTitle setFont:[UIFont fontWithName:@"TIMES NEW ROMAN" size:14]];
    lblStartDateTitle.text=@"Start Date";
    lblStartDateTitle.textAlignment=NSTextAlignmentCenter;
    
    lblStartDate=[[UILabel alloc]initWithFrame:CGRectMake(80, 90, 142, 21)];
    lblStartDate.textColor=[UIColor darkGrayColor];
    [lblStartDate setFont:[UIFont fontWithName:@"TIMES NEW ROMAN" size:14]];
    lblStartDate.text=@"";
    lblStartDate.textAlignment=NSTextAlignmentCenter;
    
    UILabel *lblEndDateTitle=[[UILabel alloc]initWithFrame:CGRectMake(80, 118, 142, 30)];
    lblEndDateTitle.backgroundColor=[UIColor whiteColor];
    lblEndDateTitle.layer.borderColor=[UIColor grayColor].CGColor;
    lblEndDateTitle.layer.cornerRadius=5.0f;
    lblEndDateTitle.layer.masksToBounds=YES;
    lblEndDateTitle.layer.borderWidth=0.5f;
    [lblEndDateTitle setFont:[UIFont fontWithName:@"TIMES NEW ROMAN" size:14]];
    lblEndDateTitle.textColor=[UIColor blackColor];
    lblEndDateTitle.text=@"End Date";
    lblEndDateTitle.textAlignment=NSTextAlignmentCenter;
    
    lblEndDate=[[UILabel alloc]initWithFrame:CGRectMake(80, 150, 142, 21)];
    lblEndDate.textColor=[UIColor darkGrayColor];
    [lblEndDate setFont:[UIFont fontWithName:@"TIMES NEW ROMAN" size:14]];
    lblEndDate.text=@"";
    lblEndDate.textAlignment=NSTextAlignmentCenter;
    
    [self.view addSubview:lblStartDateTitle];
    [self.view addSubview:lblStartDate];
    [self.view addSubview:lblEndDateTitle];
    [self.view addSubview:lblEndDate];
    
     //////view for Button Start Date
    
    viewBtnStart=[[UIView alloc]initWithFrame:CGRectMake(0, 34, 44, 188)];
    viewBtnStart.backgroundColor=[UIColor blackColor];
    
    UIButton *btnstart=[[UIButton alloc]initWithFrame:viewBtnStart.bounds];
    btnstart.frame=CGRectMake(0, 0, 44, 188);
    btnstart.backgroundColor=[UIColor clearColor];
    [btnstart addTarget:self
              action:@selector(showStartDatePicker:)
             forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *lblStartTitle=[[UILabel alloc]initWithFrame:viewBtnStart.bounds];
    lblStartTitle.frame=CGRectMake(8,0, 15,170);
    lblStartTitle.text=@"STARTDATE";
    lblStartTitle.font =[UIFont systemFontOfSize:15];
    lblStartTitle.textColor=[UIColor whiteColor];
    lblStartTitle.numberOfLines=10;
    
    UIImageView *imgVStartAcc=[[UIImageView alloc]initWithFrame:viewBtnStart.bounds];
    imgVStartAcc.frame=CGRectMake(19, 58, 22, 64);
    imgVStartAcc.image=[UIImage imageNamed:@"showDateArrow.png"];
    
    [self.view addSubview:viewBtnStart];
    
    [viewBtnStart addSubview:lblStartTitle];
    [viewBtnStart addSubview:imgVStartAcc];
    [viewBtnStart addSubview:btnstart];
    
    //////view for Button End Date
    viewBtnEnd=[[UIView alloc]initWithFrame:CGRectMake(256, 34, 44, 188)];
    viewBtnEnd.backgroundColor=[UIColor blackColor];
    
    UIButton *btnEnd=[[UIButton alloc]initWithFrame:viewBtnEnd.bounds];
    btnEnd.frame=CGRectMake(0, 0, 44, 188);
    btnEnd.backgroundColor=[UIColor clearColor];
    [btnEnd addTarget:self
            action:@selector(showEndDatePicker:)
            forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *lblEndTitle=[[UILabel alloc]initWithFrame:viewBtnEnd.bounds];
    lblEndTitle.frame=CGRectMake(25, 0, 17, 170);
    lblEndTitle.text=@"ENDDATE";
    lblEndTitle.textColor=[UIColor whiteColor];
    lblEndTitle.font =[UIFont systemFontOfSize:15];
    lblEndTitle.numberOfLines=9;
    
    UIImageView *imgVEndAcc=[[UIImageView alloc]initWithFrame:viewBtnEnd.bounds];
    imgVEndAcc.frame=CGRectMake(1, 58, 22, 64);
    imgVEndAcc.image=[UIImage imageNamed:@"showDateArrow1.png"];
    
    [self.view addSubview:viewBtnEnd];
    
    [viewBtnEnd addSubview:lblEndTitle];
    [viewBtnEnd addSubview:imgVEndAcc];
    [viewBtnEnd addSubview:btnEnd];
    
    //////view for Selected Start Date
   viewStartDatePickerView=[[UIView alloc]initWithFrame:CGRectMake(-320, 0, 320, 222)];
   viewStartDatePickerView.backgroundColor=[UIColor colorWithRed:245.0/255 green:245.0/255 blue:245.0/255 alpha:1];
    
    UIButton *btnStartDone=[[UIButton alloc]initWithFrame:viewStartDatePickerView.bounds];
    btnStartDone.frame=CGRectMake(0, 0, 300, 35);
    btnStartDone.layer.cornerRadius=2.0f;
    [btnStartDone setTitle:@"Done" forState:UIControlStateNormal];
    btnStartDone.titleLabel.font=[UIFont systemFontOfSize:15];
    [btnStartDone setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btnStartDone.backgroundColor=[UIColor colorWithRed:193.0/255 green:0 blue:33.0/255 alpha:1];
    [btnStartDone addTarget:self
                  action:@selector(hideStartDatePicker:)
                  forControlEvents:UIControlEventTouchUpInside];
    startDatePicker=[[UIDatePicker alloc]initWithFrame:viewStartDatePickerView.bounds];
    startDatePicker.frame=CGRectMake(0 , 40, 313, 162);
    startDatePicker.datePickerMode=UIDatePickerModeDate;
    
    [self.view addSubview:viewStartDatePickerView];
    [viewStartDatePickerView addSubview:btnStartDone];
    [viewStartDatePickerView addSubview:startDatePicker];

    //////view for Selected End Date
    viewEndDatePickerView=[[UIView alloc]initWithFrame:CGRectMake(320, 0, 320, 222)];
    viewEndDatePickerView.backgroundColor=[UIColor colorWithRed:245.0/255 green:245.0/255 blue:245.0/255 alpha:1];
    
    UIButton *btnEndDone=[[UIButton alloc]initWithFrame:viewEndDatePickerView.bounds];
    btnEndDone.frame=CGRectMake(0, 0, 300, 35);
    btnEndDone.layer.cornerRadius=2.0f;
    [btnEndDone setTitle:@"Done" forState:UIControlStateNormal];
    btnEndDone.titleLabel.font=[UIFont systemFontOfSize:15];
    btnEndDone.backgroundColor=[UIColor colorWithRed:193.0/255 green:0 blue:33.0/255 alpha:1];
    [btnEndDone setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnEndDone addTarget:self
                action:@selector(hideEndDatePicker:)
                forControlEvents:UIControlEventTouchUpInside];
    
    endDatePicker=[[UIDatePicker alloc]initWithFrame:viewEndDatePickerView.bounds];
    endDatePicker.frame=CGRectMake(0 , 40, 313, 162);
    endDatePicker.datePickerMode=UIDatePickerModeDate;
    
    [self.view addSubview:viewEndDatePickerView];
    
    [viewEndDatePickerView addSubview:btnEndDone];
    [viewEndDatePickerView addSubview:endDatePicker];
    
   // lblStartDate.text=@"dd/mm/yyyy";
   // lblEndDate.text=@"dd/mm/yyyy";
}

-(void)showStartDatePicker:(UIButton *)sender
{
    CGRect frame=viewStartDatePickerView.frame;
    CGRect frame1=viewBtnStart.frame;
    frame.origin.x=0;
    frame1.origin.x=320;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    viewStartDatePickerView.frame = frame;
    viewBtnStart.frame=frame1;
    [UIView commitAnimations];

}

-(void)showEndDatePicker:(UIButton *)sender
{
    CGRect frame=viewEndDatePickerView.frame;
    CGRect frame1=viewBtnEnd.frame;
    frame.origin.x=0;
    frame1.origin.x=-44;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    viewEndDatePickerView.frame = frame;
    viewBtnEnd.frame=frame1;
    [UIView commitAnimations];

}

-(void)removePopoverView:(UIButton *)sender
{
    [self.delegate removePopoverView];
}

-(void)doneSelectDate:(UIButton *)sender
{
    if([lblEndDate.text isEqualToString:@""]||[lblStartDate.text isEqualToString:@""])
    {
        [delegate removePopoverView];
    }
    else
    {
        [delegate selectDoneStartDate:startDate endDate:endDate];
    }
        
}
-(void)hideStartDatePicker:(UIButton *)sender
{
    CGRect frame=viewStartDatePickerView.frame;
    CGRect frame1=viewBtnStart.frame;
    frame.origin.x=-320;
    frame1.origin.x=0;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    viewStartDatePickerView.frame = frame;
    viewBtnStart.frame=frame1;
    [UIView commitAnimations];
    
    NSDateFormatter *format=[[NSDateFormatter alloc]init];
    [format setDateFormat:@"dd/MM/yyyy"];
    NSString *str=[format stringFromDate:startDatePicker.date];
    lblStartDate.text=str;
    [format setDateFormat:@"yyyy-MM-dd"];
    startDate=[format stringFromDate:startDatePicker.date];
}

-(void)hideEndDatePicker:(UIButton *)sender
{
    CGRect frame=viewEndDatePickerView.frame;
    CGRect frame1=viewBtnEnd.frame;
    frame.origin.x=320;
    frame1.origin.x=256;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    viewEndDatePickerView.frame = frame;
    viewBtnEnd.frame=frame1;
    [UIView commitAnimations];
    
    
    NSDateFormatter *format=[[NSDateFormatter alloc]init];
    [format setDateFormat:@"dd/MM/yyyy"];
    NSString *str=[format stringFromDate:endDatePicker.date];
    lblEndDate.text=str;
    [format setDateFormat:@"yyyy-MM-dd"];
    endDate=[format stringFromDate:endDatePicker.date];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
