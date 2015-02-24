//
//  ICAppDelegate.h
//  IntegrityCubes
//
//  Created by vishnu on 13/03/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reachability.h"
#import "ICHomeViewController.h"
@class ICHomeViewController;
ICHomeViewController *homeViewController;
@interface ICAppDelegate : UIResponder <UIApplicationDelegate>{
    
}

@property (strong, nonatomic) UIWindow *window;
-(void)logout;
@end
