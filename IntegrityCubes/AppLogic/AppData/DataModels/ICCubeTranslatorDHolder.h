//
//  ICCubeTranslatorDHolder.h
//  IntegrityCubes
//
//  Created by aditi on 22/04/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ICCubeTranslatorDHolder : NSObject{
    
}
@property(nonatomic,strong)NSString *strCubeDescription;
@property(nonatomic,strong)NSString *strCubeImage;
@property(nonatomic,strong)NSString *strCubeTitle;
@property(nonatomic,strong)NSString *strJobTitle;
@property(nonatomic,strong)NSString *imgJobSender;
@property(nonatomic,strong)NSString *imgJobReceiver;
@property(nonatomic,strong)NSString *strJobComment;
@property(nonatomic,strong)NSMutableArray *arrJobExample;

@end
