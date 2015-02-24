//
//  ICPopOverView.m
//  IntegrityCubes
//
//  Created by aditi on 11/04/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//

#import "ICPopOverView.h"

@implementation ICPopOverView

@synthesize txtView,txtCommentView,imgArrowView,imgReceiverView,imgSenderView,imgView;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.layer.cornerRadius=3;
        self.layer.backgroundColor = [UIColor clearColor].CGColor;
        self.layer.masksToBounds = NO;
        self.layer.borderColor = [UIColor lightGrayColor].CGColor;
        self.layer.borderWidth = 0.5;
        
        txtView=[[UITextView alloc]initWithFrame:self.bounds];
        txtView.layer.cornerRadius=3;
        txtView.layer.backgroundColor = [UIColor clearColor].CGColor;
        txtView.font=[UIFont systemFontOfSize:8];
        txtView.layer.masksToBounds = YES;
        
        txtView.scrollEnabled=YES;
        txtView.userInteractionEnabled=NO;
        txtView.editable=NO;
        [txtView setContentInset:UIEdgeInsetsMake(-5, 0, 5,0)];
        
        [self addSubview:txtView];
       
    }
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
