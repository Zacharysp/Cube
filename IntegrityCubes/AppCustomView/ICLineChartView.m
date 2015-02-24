//
//  ICLineChartView.m
//  TestLineChart
//
//  Created by Bhuvan Sharma on 16/04/14.
//  Copyright (c) 2014 arya. All rights reserved.
//

#import "ICLineChartView.h"

#define padding 60
#define circleSize 10
#define labelXaxisOffset 10

@interface ICLineChartView ()
{
    NSInteger numberOfPoints;
    ICCircle *closestDot;
    NSInteger currentlyCloser;
    NSMutableArray *xAxisValues;
    NSMutableArray *dataPoints;
}
@property (strong, nonatomic) UIView *verticalLine;

/// The animation delegate for lines and dots
@property (strong, nonatomic) ICLineAnimation *animationDelegate;

/// Find which dot is currently the closest to the vertical line
- (ICCircle *)closestDotFromVerticalLine:(UIView *)verticalLine;

// Determines the biggest Y-axis value from all the points
- (CGFloat)maxValue;

// Determines the smallest Y-axis value from all the points
- (CGFloat)minValue;

@end

@implementation ICLineChartView
@synthesize delegate,labelFont,animationGraphEntranceSpeed,colorLine,colorXaxisLabel,widthLine,enableTouchReport,alphaLine;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self initView];
           }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    
    if (self)
    {
        [self initView];
        
    }
    
    return self;
}

-(void)initView
{
    self.animationDelegate = [[ICLineAnimation alloc] init];
    self.animationDelegate.delegate = self;
    
    // Set the X Axis label font
    labelFont = [UIFont fontWithName:@"HelveticaNeue-Light" size:9];
    
    // DEFAULT VALUES
    animationGraphEntranceSpeed = 5;
    colorXaxisLabel = [UIColor blackColor];
    
    colorLine = [UIColor colorWithRed:0.0/255.0 green:191.0/255.0 blue:243.0/255.0 alpha:1];
    alphaLine = 1.0;
    widthLine = 1.0;
    enableTouchReport = NO;
    
    // Initialize the arrays
    xAxisValues = [NSMutableArray array];
    dataPoints = [NSMutableArray array];

}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // Let the delegate know that the graph began layout updates
    if ([self.delegate respondsToSelector:@selector(lineGraphDidBeginLoading:)])
        [self.delegate lineGraphDidBeginLoading:self];
    
    // Get the total number of data points from the delegate
    if ([self.delegate respondsToSelector:@selector(numberOfPointsInLineGraph:)])
    {
        numberOfPoints = [self.delegate numberOfPointsInLineGraph:self];
        
    }
    else
    {
      numberOfPoints = 0;
    }
    
    // Draw the graph
    [self drawGraph];
    
    // Draw the X-Axis
    [self drawXAxis];
    
    // If the touch report is enabled, set it up
    if (self.enableTouchReport == YES)
    {
        // Initialize the vertical gray line that appears where the user touches the graph.
        self.verticalLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, self.viewForBaselineLayout.frame.size.height)];
        self.verticalLine.backgroundColor = [UIColor grayColor];
        self.verticalLine.alpha = 0;
        [self addSubview:self.verticalLine];
        
        UIView *panView = [[UIView alloc] initWithFrame:CGRectMake(10, 10, self.viewForBaselineLayout.frame.size.width, self.viewForBaselineLayout.frame.size.height)];
        panView.backgroundColor = [UIColor clearColor];
        [self.viewForBaselineLayout addSubview:panView];
        
        UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
        panGesture.delegate = self;
        [panGesture setMaximumNumberOfTouches:1];
        [panView addGestureRecognizer:panGesture];
    }
    
    // Let the delegate know that the graph finished layout updates
    if ([self.delegate respondsToSelector:@selector(lineGraphDidFinishLoading:)])
        [self.delegate lineGraphDidFinishLoading:self];
}

- (void)drawGraph
{
    if (numberOfPoints <= 1)
    { // Exception if there is only one point.
        ICCircle *circleDot = [[ICCircle alloc] initWithFrame:CGRectMake(0, 0, circleSize, circleSize)];
        circleDot.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
        circleDot.alpha = 1.0;
        [self addSubview:circleDot];
        
        return;
    }
    
    // CREATION OF THE DOTS
    [self drawDots];
    
    // CREATION OF THE LINE AND BOTTOM AND TOP FILL
    [self drawLines];
}

- (void)drawDots
{
    CGFloat maxValue = [self maxValue]; // Biggest Y-axis value from all the points.
    CGFloat minValue = [self minValue]; // Smallest Y-axis value from all the points.
    
    CGFloat positionOnXAxis; // The position on the X-axis of the point currently being created.
    CGFloat positionOnYAxis; // The position on the Y-axis of the point currently being created.
    
    // Remove all dots that were previously on the graph
    for (UIView *subview in [self subviews])
    {
        if ([subview isKindOfClass:[ICCircle class]])
            [subview removeFromSuperview];
    }
    
    // Remove all data points before adding them to the array
    [dataPoints removeAllObjects];
    
    // Loop through each point and add it to the graph

    for (int i = 0; i < numberOfPoints; i++)
    {
        CGFloat dotValue = 0;
        
        if ([self.delegate respondsToSelector:@selector(lineGraph:valueForPointAtIndex:)])
        {
            dotValue = [self.delegate lineGraph:self valueForPointAtIndex:i];
            
        }
        
        
        [dataPoints addObject:[NSNumber numberWithFloat:dotValue]];
        
        positionOnXAxis = (self.frame.size.width/(numberOfPoints - 1))*i;
        if (minValue == maxValue) positionOnYAxis = self.frame.size.height/2;
        else positionOnYAxis = (self.frame.size.height - padding) - ((dotValue - minValue) / ((maxValue - minValue) / (self.frame.size.height - padding))) + 30;
        
        ICCircle *circleDot = [[ICCircle alloc] initWithFrame:CGRectMake(0, 0, circleSize, circleSize)];
        circleDot.center = CGPointMake(positionOnXAxis, positionOnYAxis);
        circleDot.tag = i+100;
        circleDot.alpha = 1.0;
        
        [self addSubview:circleDot];
        
        [self.animationDelegate animationForDot:i circleDot:circleDot animationSpeed:self.animationGraphEntranceSpeed];
    }

}

- (void)drawLines
{
    CGFloat xDot1; // Postion on the X-axis of the first dot.
    CGFloat yDot1; // Postion on the Y-axis of the first dot.
    CGFloat xDot2; // Postion on the X-axis of the second dot.
    CGFloat yDot2; // Postion on the Y-axis of the second dot.
    
    for (UIView *subview in [self subviews])
    {
        if ([subview isKindOfClass:[ICLine class]])
            [subview removeFromSuperview];
    }
    
    for (int i = 0; i < numberOfPoints; i++)
    {
        for (UIView *dot in [self.viewForBaselineLayout subviews])
        {
            if (dot.tag == i + 100)  {
                xDot1 = dot.center.x;
                yDot1 = dot.center.y;
            } else if (dot.tag == i + 101) {
                xDot2 = dot.center.x;
                yDot2 = dot.center.y;
            }
        }
        
        ICLine *line = [[ICLine alloc] initWithFrame:CGRectMake(0, 0, self.viewForBaselineLayout.frame.size.width, self.viewForBaselineLayout.frame.size.height)];
        line.opaque = NO;
        line.tag = i + 1000;
        line.alpha = 0;
        line.backgroundColor = [UIColor clearColor];
        line.P1 = CGPointMake(xDot1, yDot1);
        line.P2 = CGPointMake(xDot2, yDot2);

        if ([self.delegate respondsToSelector:@selector(lineGraph:lineColorForIndex:)]) line.color = [self.delegate lineGraph:self lineColorForIndex:i];
        else line.color = self.colorLine;
        
        if ([self.delegate respondsToSelector:@selector(lineGraph:lineAlphaForIndex:)]) line.alpha = [self.delegate lineGraph:self lineAlphaForIndex:i];
        else line.lineAlpha = self.alphaLine;
        line.lineWidth = self.widthLine;
       
        [self addSubview:line];
        [self sendSubviewToBack:line];
        
        [self.animationDelegate animationForLine:i line:line animationSpeed:self.animationGraphEntranceSpeed];
    }
    
}

- (void)drawXAxis
{
    if ((![self.delegate respondsToSelector:@selector(numberOfGapsBetweenLabelsOnLineGraph:)])) return;
    
    for (UIView *subview in [self subviews])
    {
        if ([subview isKindOfClass:[UILabel class]])
            [subview removeFromSuperview];
    }
    
    NSInteger numberOfGaps = 0;
    
    if ([self.delegate respondsToSelector:@selector(numberOfGapsBetweenLabelsOnLineGraph:)])
    {
        numberOfGaps = [self.delegate numberOfGapsBetweenLabelsOnLineGraph:self] + 1;
        
    }
    else numberOfGaps = 0;
    
    // Remove all X-Axis Labels before adding them to the array
    [xAxisValues removeAllObjects];
    
    if (numberOfGaps >= (numberOfPoints - 1))
    {
        NSString *firstXLabel = @"";
        NSString *lastXLabel = @"";
        
        if ([self.delegate respondsToSelector:@selector(lineGraph:labelOnXAxisForIndex:)])
        {
            firstXLabel = [self.delegate lineGraph:self labelOnXAxisForIndex:0];
            lastXLabel = [self.delegate lineGraph:self labelOnXAxisForIndex:(numberOfPoints - 1)];
            
        }
        else firstXLabel = @"";
        
        UILabel *firstLabel = [[UILabel alloc] initWithFrame:CGRectMake(3, self.frame.size.height - (labelXaxisOffset + 10), self.frame.size.width/2, 20)];
        firstLabel.text = firstXLabel;
        firstLabel.font = self.labelFont;
        firstLabel.textAlignment = 0;
        firstLabel.textColor = self.colorXaxisLabel;
        firstLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:firstLabel];
        [xAxisValues addObject:firstXLabel];
        
        UILabel *lastLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width/2 - 3, self.frame.size.height - (labelXaxisOffset + 10), self.frame.size.width/2, 20)];
        lastLabel.text = lastXLabel;
        lastLabel.font = self.labelFont;
        lastLabel.textAlignment = 2;
        lastLabel.textColor = self.colorXaxisLabel;
        lastLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:lastLabel];
        [xAxisValues addObject:lastXLabel];
        
    }
    else
    {
        NSInteger offset = [self offsetForXAxisWithNumberOfGaps:numberOfGaps]; // The offset (if possible and necessary) used to shift the Labels on the X-Axis for them to be centered.

        for (int i = 1; i <= (numberOfPoints/numberOfGaps); i++)
        {
            NSString *xAxisLabel = @"";
            
            if ([self.delegate respondsToSelector:@selector(lineGraph:labelOnXAxisForIndex:)])
            {
                NSInteger index = i * numberOfGaps - 1 - offset;
                xAxisLabel = [self.delegate lineGraph:self labelOnXAxisForIndex:index];
                
            }
            else xAxisLabel = @"";
            
            UILabel *labelXAxis = [[UILabel alloc] init];
            labelXAxis.font = self.labelFont;
            labelXAxis.numberOfLines=2;
            CGSize labelSize = [xAxisLabel
                                sizeWithFont:labelXAxis.font
                                constrainedToSize:CGSizeMake(25, 50)
                                lineBreakMode:labelXAxis.lineBreakMode];
            
            labelXAxis.frame = CGRectMake(labelXAxis.frame.origin.x, labelXAxis.frame.origin.y, 25, labelSize.height);
            labelXAxis.text = xAxisLabel;
            [labelXAxis setCenter:CGPointMake((self.viewForBaselineLayout.frame.size.width/(numberOfPoints-1))*(i*numberOfGaps - 1 - offset), self.frame.size.height - labelXaxisOffset)];
            labelXAxis.textAlignment = 1;
            labelXAxis.textColor = self.colorXaxisLabel;
            labelXAxis.backgroundColor = [UIColor clearColor];
            [self addSubview:labelXAxis];
            [xAxisValues addObject:xAxisLabel];
        }
    }
    
}

- (NSInteger)offsetForXAxisWithNumberOfGaps:(NSInteger)numberOfGaps
{
    // Calculates the optimum offset needed for the Labels to be centered on the X-Axis.
    NSInteger leftGap = numberOfGaps - 1;
    NSInteger rightGap = numberOfPoints - (numberOfGaps*(numberOfPoints/numberOfGaps));
    NSInteger offset = 0;
    
    if (leftGap != rightGap)
    {
        for (int i = 0; i <= numberOfGaps; i++)
        {
            if (leftGap - i == rightGap + i)
            {
                offset = i;
            }
        }
    }
    
    return offset;
}


#pragma mark - Data Source

- (void)reloadGraph
{
    [self setNeedsLayout];
}

#pragma mark - Calculations

- (NSNumber *)calculatePointValueSum
{
    NSExpression *expression = [NSExpression expressionForFunction:@"sum:" arguments:@[[NSExpression expressionForConstantValue:dataPoints]]];
    NSNumber *value = [expression expressionValueWithObject:nil context:nil];
    
    return value;
}

#pragma mark - Values

- (NSArray *)graphValuesForXAxis
{
    return xAxisValues;
}

- (NSArray *)graphValuesForDataPoints
{
    return dataPoints;
}


#pragma mark - Touch Gestures

- (void)handlePan:(UIPanGestureRecognizer *)recognizer
{
    CGPoint translation = [recognizer locationInView:self.viewForBaselineLayout];
    
    self.verticalLine.frame = CGRectMake(translation.x, 0, 1, self.viewForBaselineLayout.frame.size.height);
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.verticalLine.alpha = 0.2;
    } completion:nil];
    
    closestDot = [self closestDotFromVerticalLine:self.verticalLine];
    closestDot.alpha = 1.0;
    
    if (closestDot.tag > 99 && closestDot.tag < 1000)
    {
        if ([self.delegate respondsToSelector:@selector(lineGraph:didTouchGraphWithClosestIndex:)])
        {
            [self.delegate lineGraph:self didTouchGraphWithClosestIndex:((NSInteger)closestDot.tag - 100)];
            
        }
    }
    
    // ON RELEASE
    if (recognizer.state == UIGestureRecognizerStateEnded)
    {
        if ([self.delegate respondsToSelector:@selector(lineGraph:didReleaseTouchFromGraphWithClosestIndex:)]) {
            [self.delegate lineGraph:self didReleaseTouchFromGraphWithClosestIndex:(closestDot.tag - 100)];
            
        }
        [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            closestDot.alpha = 1.0;
            self.verticalLine.alpha = 0;
        } completion:nil];
    }
}

#pragma mark - Graph Calculations

- (ICCircle *)closestDotFromVerticalLine:(UIView *)verticalLine
{
    currentlyCloser = 1000;
    
    for (ICCircle *dot in self.subviews)
    {
        
        if (dot.tag > 99 && dot.tag < 1000) {
            
            [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                dot.alpha = 1;
            } completion:nil];
            
            if (pow(((dot.center.x) - verticalLine.frame.origin.x), 2) < currentlyCloser) {
                currentlyCloser = pow(((dot.center.x) - verticalLine.frame.origin.x), 2);
                closestDot = dot;
            }
        }
    }
    
    return closestDot;
}


- (CGFloat)maxValue
{
    CGFloat dotValue;
    CGFloat maxValue = 0;
    for (int i = 0; i < numberOfPoints; i++)
    {
        if ([self.delegate respondsToSelector:@selector(lineGraph:valueForPointAtIndex:)])
        {
            dotValue = [self.delegate lineGraph:self valueForPointAtIndex:i];
            
        }
        else dotValue = 0;
        
        if (dotValue > maxValue)
        {
            maxValue = dotValue;
        }
    }
    return maxValue;
}


- (CGFloat)minValue
{
    CGFloat dotValue;
    CGFloat minValue = INFINITY;

    for (int i = 0; i < numberOfPoints; i++)
    {
        if ([self.delegate respondsToSelector:@selector(lineGraph:valueForPointAtIndex:)])
        {
            dotValue = [self.delegate lineGraph:self valueForPointAtIndex:i];
            
        }
        else dotValue = 0;
        
        if (dotValue < minValue)
        {
            minValue = dotValue;
        }
    }
    return minValue;
}


@end
