//
//  ICCubeTranslatorView.h
//  CubeTranslator
//
//  Created by vishnu on 16/04/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICCubeTranslatorDHolder.h"
@protocol CubeTranslatorDelegate <NSObject>

-(void)cubeExampleView:(id)sender cubeTag:(NSInteger)cubeTag;

@end

@interface ICCubeTranslatorView : UIView{

    NSMutableArray *arrBtnCube;
    NSMutableArray *arrBtnJobTitle;
    
    UIView *jobTitleView ;
    
    ICCubeTranslatorView *cubeTranslatorView ;
    
  
}
@property(nonatomic,strong)NSMutableArray *arrJobs;
@property(nonatomic,strong)NSMutableArray *arrExamples;

@property(nonatomic,assign)id<CubeTranslatorDelegate> delegate;
@end
