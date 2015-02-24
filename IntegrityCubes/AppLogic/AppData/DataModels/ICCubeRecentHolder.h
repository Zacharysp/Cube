//
//  ICCubeRecentHolder.h
//  IntegrityCubes
//
//  Created by aditi on 26/03/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ICCubeRecentHolder : NSObject{
    
}
@property(nonatomic,strong)NSString *strCubeFeedId;
@property(nonatomic,strong)NSString *strCubeReceived;
@property(nonatomic,strong)NSString *strCubeSent;
@property(nonatomic,strong)NSString *strCubeReceivedImageUrl;
@property(nonatomic,strong)NSString *strCubeSentImageUrl;
@property(nonatomic,strong)NSString *strCubeReceivedImageId;
@property(nonatomic,strong)NSString *strCubeSentImageId;

@property(nonatomic,strong)NSString *strCubeTitle;
@property(nonatomic,strong)NSString *strCubeValue;

@property(nonatomic,strong)NSString *strCubeSenderName;
@property(nonatomic,strong)NSString *strCubeReceiverName;
@property(nonatomic,strong)NSString *strCubeComment;
@property(nonatomic,strong)NSString  *imgCubeReceiver;
@property(nonatomic,strong)NSString  *imgCubeSender;


@property(nonatomic,strong)UIImage  *imgCubeReceived;
@property(nonatomic,strong)UIImage  *imgCubeSent;


@end
