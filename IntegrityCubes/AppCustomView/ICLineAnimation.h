//
//  ICLineAnimation.h
//  TestLineChart
//
//  Created by Bhuvan Sharma on 16/04/14.
//  Copyright (c) 2014 arya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ICLine.h"
#import "ICCircle.h"



@protocol ICAnimationDelegate <NSObject>

@end


/// Class for the animation when the graph first gets created.
@interface ICLineAnimation : NSObject



/// Animation of the dots
- (void)animationForDot:(NSInteger)dotIndex circleDot:(ICCircle *)circleDot animationSpeed:(NSInteger)speed;


/// Animation of the graph
- (void)animationForLine:(NSInteger)lineIndex line:(ICLine *)line animationSpeed:(NSInteger)speed;



/// Animation Delegate
@property (assign) id <ICAnimationDelegate> delegate;



@end
