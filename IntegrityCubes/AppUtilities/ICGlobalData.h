//
//  ICGlobalData.h
//  IntegrityCubes
//
//  Created by user on 20/03/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ICLoginDataHolder.h"
#import "FMDatabase.h"
#import "Reachability.h"
////for Circulr Bar
struct ICArc {
    CGFloat startAngle;
    CGFloat endAngle;
    CGFloat radius;
    CGFloat center;
    CGFloat direction;
};
typedef struct ICArc ICArc;

static inline ICArc ICMakeArc(CGFloat startAngle, CGFloat endAngle, CGFloat radius,CGFloat center, CGFloat direction)
{
    ICArc arc;
    arc.startAngle = startAngle;
    arc.endAngle = endAngle;
    arc.radius = radius;
    arc.center = center;
    arc.direction = direction;
    return arc;
}

BOOL isSideMenu;
BOOL isCommentBoxOpen;
BOOL isPulledToRefresh;
BOOL isProfileView;

NSInteger previousIndex;

//dataholders
ICLoginDataHolder *loginDHolder;
FMDatabase *dataBaseIntegrity;
Reachability *hostReachable;

BOOL isLoggedIn;
//controllers

@interface ICGlobalData : NSObject

@end
