//
//  ICTeamListDataHolder.h
//  IntegrityCubes
//
//  Created by aditi on 09/04/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ICTeamListDataHolder : NSObject{
    
}
@property(nonatomic,assign)NSInteger      intTeamId;
@property(nonatomic,strong)NSString       *strTeamName;
@property(nonatomic,strong)NSString       *strTeamDescription;
@property(nonatomic,strong)NSString       *strTeamImageUrl;
@property(nonatomic,assign)NSInteger      intTeamReceivedCube;
@property(nonatomic,strong)NSString       *strTeamReceivedCubeImage;
@property(nonatomic,strong)NSMutableArray *arrTeamReceivedCube;

@end
