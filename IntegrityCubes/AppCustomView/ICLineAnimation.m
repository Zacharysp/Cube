//
//  ICLineAnimation.m
//  TestLineChart
//
//  Created by Bhuvan Sharma on 16/04/14.
//  Copyright (c) 2014 arya. All rights reserved.
//

#import "ICLineAnimation.h"

@implementation ICLineAnimation

- (void)animationForDot:(NSInteger)dotIndex circleDot:(ICCircle *)circleDot animationSpeed:(NSInteger)speed
{
    if (speed == 0)
    {
        circleDot.alpha = 1;
    }
    else
    {
        [UIView animateWithDuration:0.5 delay:dotIndex/(speed*2.0) options:UIViewAnimationOptionCurveEaseOut animations:^{
            circleDot.alpha = 1.0;
        } completion:^(BOOL finished)
         {
             [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                 circleDot.alpha = 1;
             } completion:nil];
         }];
    }
}

- (void)animationForLine:(NSInteger)lineIndex line:(ICLine *)line animationSpeed:(NSInteger)speed
{
    if (speed == 0)
    {
        line.alpha = 1.0;
    }
    else
    {
        [UIView animateWithDuration:1.0 delay:lineIndex/(speed*2.0) options:UIViewAnimationOptionCurveEaseOut animations:^{
            line.alpha = 1.0;
        } completion:nil];
    }
}

@end
