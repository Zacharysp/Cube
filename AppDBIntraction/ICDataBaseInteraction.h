//
//  ICDataBaseInteraction.h
//  IntegrityCubes
//
//  Created by Bhuvan Sharma on 30/04/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ICCubeAwardHolder.h"
#import "ICNotificationHolder.h"

@interface ICDataBaseInteraction : NSObject
@property (nonatomic, retain) NSString *databaseName;
+ (id)databaseInteractionManager;

-(NSInteger )getNotificationMessageCount;

-(NSMutableArray *)getCubeFromDatabase;
-(NSMutableArray *)getNotificationMessage;

-(void)deletePreviousComments;
-(void)updateNotificationTable;
-(void)insertCubesTable:(NSMutableArray *)arrholder;
-(void)insertNotificationsTable:(NSMutableDictionary *)info;
-(void)updateParticulerNotification:(ICNotificationHolder *)holder;
-(void)deleteNotification:(NSInteger)info;
-(void)clearUserNotificationData;
-(void)clearUserCubeData;

@end
