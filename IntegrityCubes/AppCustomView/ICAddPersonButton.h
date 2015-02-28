//
//  ICAddPersonButton.h
//  Cube
//
//  Created by Dongjie Zhang on 2/25/15.
//  Copyright (c) 2015 Aryavrat Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICPostReceiverHolder.h"
#import "ICTeamOrPersonListHolder.h"

@interface ICAddPersonButton : UIButton

@property(nonatomic,strong)ICPostReceiverHolder *userDHolder;
@property(nonatomic,strong)ICTeamOrPersonListHolder *selectedDHolder;

@end
