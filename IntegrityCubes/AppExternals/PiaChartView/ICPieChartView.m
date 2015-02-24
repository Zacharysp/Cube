//
//  PieCharView.m
//  PieChartTesting
//
//  Created by vishnu on 29/03/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//

#import "ICPieChartView.h"
#import "ICPieChartDataHolder.h"
#import "UIColor+Util.h"
@implementation ICPieChartView
@synthesize arrPiChart;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        arrPiChart = [NSMutableArray new];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.*/
- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    for (int i =0; i<arrPiChart.count; i++) {
     
        ICPieChartDataHolder *pieChartDH = [arrPiChart objectAtIndex:i];
        // Drawing code
        
       CGContextSetFillColorWithColor(ctx, [UIColor colorWithHexString:pieChartDH.color].CGColor);
        CGContextMoveToPoint(ctx, pieChartDH.arc.center, pieChartDH.arc.center);
        CGContextAddArc(ctx, pieChartDH.arc.center, pieChartDH.arc.center, 100, (pieChartDH.arc.startAngle)*M_PI/180.0, (pieChartDH.arc.endAngle)*M_PI/180.0, pieChartDH.arc.direction);
        CGContextSetStrokeColorWithColor(ctx, [UIColor whiteColor].CGColor);
        CGContextDrawPath(ctx, kCGPathFillStroke);
        
        CGContextClosePath(ctx);
        CGContextFillPath(ctx);
        
    }
}


@end
