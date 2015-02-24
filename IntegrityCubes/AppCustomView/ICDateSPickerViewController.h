//
//  ICDateSPickerViewController.h
//  IntegrityCubes
//
//  Created by Bhuvan Sharma on 14/04/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol datePickerDelegate <NSObject>

-(void)selectDoneStartDate:(NSString *)startDate endDate:(NSString *)endDate;
-(void)removePopoverView;
@end

@interface ICDateSPickerViewController : UIViewController
{
    UILabel *lblStartDate;
    UILabel *lblEndDate;
  
    UIView *viewBtnStart;
    UIView *viewBtnEnd;
    UIView *viewStartDatePickerView;
    UIView *viewEndDatePickerView;
    
    UIDatePicker *startDatePicker;
    UIDatePicker *endDatePicker;
    
    NSString *startDate;
    NSString *endDate;
    
    
}

@property(nonatomic,strong)id <datePickerDelegate>delegate;
@end
