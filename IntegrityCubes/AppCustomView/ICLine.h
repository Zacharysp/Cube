//
//  ICLine.h
//  TestLineChart
//
//  Created by Bhuvan Sharma on 16/04/14.
//  Copyright (c) 2014 arya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ICLine : UIView

/// The starting point of the line
@property (assign, nonatomic) CGPoint P1;

/// The ending point of the line
@property (assign, nonatomic) CGPoint P2;

/// The line color
@property (strong, nonatomic) UIColor *color;

//----- ALPHA -----//

/// The line alpha
@property (nonatomic) float lineAlpha;

//----- SIZE -----//

/// The width of the line
@property (nonatomic) float lineWidth;

@end
