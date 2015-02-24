//
//  ICSearchBar.m
//  IntegrityCubes
//
//  Created by user on 20/03/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//

#import "ICSearchBar.h"
#import <QuartzCore/QuartzCore.h>

@implementation ICSearchBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
    }
    return self;
}

-(void)resetLayout{
    
    [self setNeedsDisplay];
}
- (void)drawRect:(CGRect)rect
{

    if (self.subviews && self.subviews.count > 0) {
        // Get main searchBar view
        UIView *searchBarView = [self.subviews objectAtIndex:0];
        // Iterate through its subviews
        for (id searchBarSubview in [searchBarView subviews]) {
            // Check for a text field
            if ([searchBarSubview isKindOfClass:[UITextField class]])
            {
                [searchBarSubview setFrame:self.bounds];
                [searchBarSubview setFrame:CGRectMake(2, 2, searchBarView.frame.size.width-4, 26)];
                break;
            }
        }
    }
   
}

@end
