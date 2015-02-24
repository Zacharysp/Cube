//
//  ICCubeTranslatorViewController.h
//  IntegrityCubes
//
//  Created by aditi on 18/03/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MFSideMenu.h"
#import "ICCubeTranslatorView.h"
#import "ICCubeTranslatorDHolder.h"
#import "Reachability.h"

@interface ICCubeTranslatorViewController : UIViewController<CubeTranslatorDelegate>{
    
    NSMutableArray *arrCubeTranslatorData;
    NSMutableArray *arrJobsDetail;
    NSMutableArray *arrJobExample;
    
    UIView *cubeExampleView;
    
    UIScrollView *sclExample;
    
    ICCubeTranslatorView *cubeTranslatorView;
    ICCubeTranslatorDHolder *cubeTranslatorDHolder;
    ICCubeTranslatorDHolder *jobExampleDetailDHolder;

     AryaHUD *HUD;
    
    NSInteger exampleCounter;
    UIView *bgHudView;
   
}
-(IBAction)showRightMenuPressed:(id)sender;

@end
