//
//  ICCircle.m
//  TestLineChart
//
//  Created by Bhuvan Sharma on 16/04/14.
//  Copyright (c) 2014 arya. All rights reserved.
//

#import "ICCircle.h"

@implementation ICCircle

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
       self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(ctx, rect);
    [[UIColor blueColor] set];
    CGContextFillPath(ctx);
}
@end
