//
//  ICLine.m
//  TestLineChart
//
//  Created by Bhuvan Sharma on 16/04/14.
//  Copyright (c) 2014 arya. All rights reserved.
//

#import "ICLine.h"

@implementation ICLine

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    [path1 setLineWidth:self.lineWidth];
    [path1 moveToPoint:self.P1];
 // SIMPLE LINE
    [path1 addLineToPoint:self.P2];
  
    path1.lineCapStyle = kCGLineCapSquare;
    [self.color set];
    [path1 strokeWithBlendMode:kCGBlendModeNormal alpha:self.lineAlpha];
}
@end
