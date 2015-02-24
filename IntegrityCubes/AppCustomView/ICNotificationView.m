//
//  ICNotificationView.m
//  IntegrityCubes
//
//  Created by Bhuvan Sharma on 01/05/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//

#import "ICNotificationView.h"

@implementation ICNotificationView
@synthesize lblNOtification;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor=[UIColor blackColor];
        self.layer.cornerRadius=9.0;
        lblNOtification.textColor=[UIColor blackColor];
        [lblNOtification setFont:[UIFont systemFontOfSize:6]];
        [self addSubview:lblNOtification];
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
