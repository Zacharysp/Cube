//
//  ICCubeTranslatorView.m
//  CubeTranslator
//
//  Created by vishnu on 16/04/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//
#define TOTAL_CUBES 10
#define CORNER_RADIUS_OUTER_VIEW 144
#define CORNER_RADIUS_MIDDLE_VIEW 115
#define CORNER_RADIUS_INNER_VIEW 85
#define GAP_OUTER_VIEW 130
#define GAP_MIDDLE_VIEW 95
#define FRAME_CUBE CGRectMake(0, 0, 35, 60)
#define FRAME_JOB_TITLE CGRectMake(0, 0, 50, 32)
#define ANCHOR_POINT CGPointMake(0.5f, 0.5f)
#define CENTER_POINT_X 150.0f
#define CENTER_POINT_Y 150.0f
#define CUBE_SECTOR_ANGLE 360/TOTAL_CUBES
#import "ICCubeTranslatorView.h"

@implementation ICCubeTranslatorView
@synthesize arrJobs,arrExamples,delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
        CALayer *outerLayer = self.layer;
        arrBtnCube = [NSMutableArray array];
        arrBtnJobTitle = [NSMutableArray array];
        
        self.backgroundColor = [UIColor blackColor];
        outerLayer.masksToBounds = YES;
        outerLayer.cornerRadius = CORNER_RADIUS_OUTER_VIEW;
        
        int tempAngle = 0;
        for (int i = 0; i < TOTAL_CUBES; i++) {
            
            UIButton *btnCube = [UIButton buttonWithType:UIButtonTypeCustom];
            CALayer *cubeLayer = btnCube.layer;
            btnCube.tag = i;
            btnCube.frame = FRAME_CUBE;
            [btnCube setImage:[UIImage imageNamed:[NSString stringWithFormat:@"cube%d.png",i+1]] forState:UIControlStateNormal];
            [btnCube addTarget:self action:@selector(btnCubeDidClicked:) forControlEvents:UIControlEventTouchUpInside];
            cubeLayer.anchorPoint = ANCHOR_POINT;
            int x = (int)(self.center.x  + GAP_OUTER_VIEW * (cos(tempAngle*M_PI/180)));
            int y = (int)(self.center.y + GAP_OUTER_VIEW * (sin(tempAngle*M_PI/180)));
            cubeLayer.position = CGPointMake(x, y);
            btnCube.transform  = CGAffineTransformMakeRotation((CUBE_SECTOR_ANGLE*i)*(M_PI/180));
            
            tempAngle = tempAngle + CUBE_SECTOR_ANGLE;
            [self addSubview:btnCube];
            [arrBtnCube addObject:btnCube];
        }
       
        //        jobTitleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 225, 225)];
//        CALayer *jobTitleLayer = jobTitleView.layer;
//        jobTitleView.center = self.center;
//        jobTitleView.backgroundColor = [UIColor colorWithRed:208.0f/255.0f green:32.0f/255.0f blue:46.0f/255.0f alpha:1];
//        jobTitleLayer.masksToBounds = YES;
//        jobTitleLayer.cornerRadius = CORNER_RADIUS_MIDDLE_VIEW;
//        [self addSubview:jobTitleView];
//        
//        tempAngle = 0;
//        for (int i = 0; i < TOTAL_CUBES; i++) {
//            
//           UIButton *btnJobTitle = [UIButton buttonWithType:UIButtonTypeCustom];
//            CALayer *jobTitleLayer = btnJobTitle.layer;
//            btnJobTitle.tag = i;
//            btnJobTitle.frame = FRAME_JOB_TITLE;
//            btnJobTitle.enabled = NO;
//            [btnJobTitle setTitle:@"" forState:UIControlStateNormal];
//            btnJobTitle.titleLabel.font = [UIFont fontWithName:@"Arial" size:10];
//           
//            [btnJobTitle setTitleColor:[UIColor colorWithRed:175.0f/255.0f green:174.0f/255.0f blue:172.0f/255.0f alpha:1] forState:UIControlStateNormal];
//            [btnJobTitle addTarget:self action:@selector(btnJobTitleDidClicked:) forControlEvents:UIControlEventTouchUpInside];
//            jobTitleLayer.anchorPoint = ANCHOR_POINT;
//            int x = (int)(CENTER_POINT_X  + GAP_MIDDLE_VIEW * (cos(tempAngle*M_PI/180)));
//            int y = (int)(CENTER_POINT_Y + GAP_MIDDLE_VIEW * (sin(tempAngle*M_PI/180)));
//            jobTitleLayer.position = CGPointMake(x, y);
//            btnJobTitle.transform  = CGAffineTransformMakeRotation((90+(CUBE_SECTOR_ANGLE*i))*(M_PI/180));
//            tempAngle = tempAngle + CUBE_SECTOR_ANGLE;
//            [self addSubview:btnJobTitle];
//            [arrBtnJobTitle addObject:btnJobTitle];
//        }
    }
    
    return self;
}

//-(void)loadJobTitles:(NSMutableArray*)arrJobTitles{
//    
//    for (UIButton *tempBtnJobTitle in arrBtnJobTitle) {
//        
//        [tempBtnJobTitle setTitle:@"" forState:UIControlStateNormal];
//        [tempBtnJobTitle setBackgroundImage:nil forState:UIControlStateNormal];
//        tempBtnJobTitle.enabled = NO;
//        tempBtnJobTitle.selected = NO;
//    }
//    
//    for (int i = 0; i < arrJobs.count; i++) {
//        
//        NSString *jobTitle = [arrJobTitles objectAtIndex:i];
//        UIButton *btnJobTitle = [arrBtnJobTitle objectAtIndex:i];
//        btnJobTitle.enabled = YES;
//        [btnJobTitle setTitle:jobTitle forState:UIControlStateNormal];
//        
//    }
//    
//    int jobCount = arrJobs.count;
//    if (jobCount>0) {
//        NSInteger tempPosition = 0;
//        NSInteger sectorAngle = (360/jobCount);
//        for (int i = 0; i < jobCount; i++) {
//            
//            UIButton *btnJobTitle = [arrBtnJobTitle objectAtIndex:i];
//            int x = (int)(CENTER_POINT_X  + GAP_MIDDLE_VIEW * (cos(tempPosition*M_PI/180)));
//            int y = (int)(CENTER_POINT_Y + GAP_MIDDLE_VIEW * (sin(tempPosition*M_PI/180)));
//            btnJobTitle.layer.position = CGPointMake(x, y);
//            btnJobTitle.transform  = CGAffineTransformMakeRotation((90+(sectorAngle*i))*(M_PI/180));
//            tempPosition = tempPosition + sectorAngle;
//        }
//    }
//}

-(void)btnCubeDidClicked:(UIButton*)btnCube
{
    UIButton *btnNotSelect=[arrBtnCube objectAtIndex:previousIndex];
    btnNotSelect.selected=NO;
    btnNotSelect.backgroundColor = [UIColor blackColor];
    [btnNotSelect setImage:[UIImage imageNamed:[NSString stringWithFormat:@"cube%ld.png",(long)(previousIndex+1)]]                                                             forState:UIControlStateHighlighted];
    
    
    //    for (UIButton *tempBtnCube in arrBtnCube)
    //    {
    //        NSInteger tag=tempBtnCube.tag+1;
    //        tempBtnCube.selected = NO;
    //        tempBtnCube.backgroundColor = [UIColor blackColor];
    //        [btnCube setImage:[UIImage imageNamed:[NSString stringWithFormat:@"cube%ld.png",(long)tag]]                                                             forState:UIControlStateHighlighted];
    //    }
    NSInteger tagCube=btnCube.tag+1;
    btnCube.selected = YES;
    [btnCube setImage:[UIImage imageNamed:[NSString stringWithFormat:@"cubeS%ld.png",(long)tagCube]]
             forState:UIControlStateSelected];
    [self.delegate cubeExampleView:self cubeTag:btnCube.tag];
//     NSMutableArray *arrJobTitles = [arrJobs objectAtIndex:btnCube.tag];
    
     //[self loadJobTitles:arrJobs];
    
    for (UIButton *btnCube in arrBtnCube) {
        
        [self bringSubviewToFront:btnCube];
    }
//    for (UIButton *btnJobTitle in arrBtnJobTitle) {
//        
//        [self bringSubviewToFront:btnJobTitle];
//    }
}
//-(void)btnJobTitleDidClicked:(UIButton*)btnJobTitle
//{    
//     [self.delegate jobExampleView:self jobTag:btnJobTitle.tag];
//    //    [self jobExampleView];
//    
//    for (UIButton *tempBtnJobTitle in arrBtnJobTitle) {
//        
//        [tempBtnJobTitle setBackgroundImage:nil forState:UIControlStateNormal];
//        tempBtnJobTitle.selected = NO;
//    }
//    btnJobTitle.selected = YES;
//    [btnJobTitle setBackgroundImage:[UIImage imageNamed:@"jobBackground.png"] forState:UIControlStateSelected];
//    
//    for (UIButton *btnCube in arrBtnCube) {
//        
//        [self bringSubviewToFront:btnCube];
//    }
//    for (UIButton *btnJobTitle in arrBtnJobTitle) {
//        
//        [self bringSubviewToFront:btnJobTitle];
//    }
//    
//}

@end
