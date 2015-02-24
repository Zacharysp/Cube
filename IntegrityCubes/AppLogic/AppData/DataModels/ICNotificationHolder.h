//
//  ICNotificationHolder.h
//  IntegrityCubes
//
//  Created by Bhuvan Sharma on 03/05/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ICNotificationHolder : NSObject
@property(nonatomic,strong)NSString *strMessage;
@property(nonatomic,strong)NSString *strSeenFlag;
@property(nonatomic,strong)NSString *strMessageId;
@property(nonatomic,strong)NSString *strMessageType;
@property(nonatomic,strong)NSString *strDisplayFlag;
@property(nonatomic,strong)NSString *strNotificationId;
@end
