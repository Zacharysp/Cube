//
//  ICDataBaseInteraction.m
//  IntegrityCubes
//
//  Created by Bhuvan Sharma on 30/04/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//

#import "ICDataBaseInteraction.h"

ICDataBaseInteraction *databaseManager = nil;
@implementation ICDataBaseInteraction
@synthesize databaseName;

+ (id)databaseInteractionManager
{
    @synchronized(self)
    {
        if (databaseManager == nil)
        {
            databaseManager = [[self alloc] init];
        }
    }
    return databaseManager;
}

- (id)init
{
    if (self = [super init])
    {
        dataBaseIntegrity  = [[FMDatabase alloc] initWithPath:[self getDatabasePathFromName:@"IntegrityCube"]];
    }
    return self;
}
- (NSString *) getDatabasePathFromName:(NSString *)dbName
{
	return [self getDatabaseFolderPath:dbName];
}

-(NSString *) getDatabaseFolderPath : (NSString *)dbName
{
	databaseName = [dbName stringByAppendingString:@".sqlite"];
	NSString *databasePath = [[self getDocumentsDirectoryPath] stringByAppendingPathComponent:databaseName];
	NSFileManager *fileManager = [NSFileManager defaultManager];
	if([fileManager fileExistsAtPath:databasePath]) return databasePath;
	else
    {
		NSString *databasePathFromApp = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:databaseName];
        [fileManager copyItemAtPath:databasePathFromApp toPath:databasePath error:nil];
	}
	return databasePath;
}

- (NSString *) getDocumentsDirectoryPath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	return [paths objectAtIndex:0];
}

-(void)insertCubesTable:(NSMutableArray *)arrholder
{
    for (int i=0; i<arrholder.count;i++)
    {
        ICCubeAwardHolder *cubeHoler=[arrholder objectAtIndex:i];
        NSString *query=[NSString stringWithFormat:@"insert into Cube_table(Cube_id,Cube_Title,Cube_Description) values(\"%@\",\"%@\",\"%@\")",cubeHoler.strCubeId,cubeHoler.strCubeTitle,cubeHoler.strCubeValue];
        @try
        {
            [dataBaseIntegrity open];
            if ([dataBaseIntegrity executeUpdate:query])
            {
                  ICLog(@"successfully inserted");
            }
        }
        @catch (NSException *e)
        {
            ICLog(@"%@",e);
        }
        @finally
        {
            [dataBaseIntegrity close];
        }
    }
}

-(void)insertNotificationsTable:(NSMutableDictionary *)info
{
    NSString *strMessage = [info valueForKey:@"message"];
    NSString *strMessageId = [info valueForKey:@"cubeFeedid"];
    NSString *strKeyType = [info valueForKey:@"keyType"];
    NSString *strNotificationId = [info valueForKey:@"notificationid"];
    NSString *strSeenFlag=@"0";
    NSString *strDisplayFlag = @"0";
    NSDate *currentDate=[NSDate date];
    NSDateFormatter *frmt=[[NSDateFormatter alloc]init];
    [frmt setDateFormat:@"yyyy-MM-dd"];
    NSString *strNotificationDate=[frmt stringFromDate:currentDate];
    
    NSString *query=[NSString stringWithFormat:@"insert into CubeNotification_table(Message_id,Cube_message,Type_Mess,Display_Flag,Notification_time,Notification_id,Is_seen) values(\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\")",strMessageId,strMessage,strKeyType,strDisplayFlag,strNotificationDate,strNotificationId,strSeenFlag];
    @try
    {
        [dataBaseIntegrity open];
        if ([dataBaseIntegrity executeUpdate:query])
        {
            ICLog(@"successfully inserted");
        }
    }
    @catch (NSException *e)
    {
        ICLog(@"%@",e);
    }
    @finally
    {
        [dataBaseIntegrity close];
    }
}

-(NSMutableArray *)getCubeFromDatabase
{
    NSMutableArray *arrCubes=[[NSMutableArray alloc]init];
    NSString *qury=@"Select * from Cube_table";
    @try
    {
        [dataBaseIntegrity open];
        FMResultSet *resultSet=[dataBaseIntegrity executeQuery:qury];
        while ([resultSet next])
        {
            ICCubeAwardHolder *cubeHolder=[ICCubeAwardHolder new];
            cubeHolder.strCubeId=[resultSet stringForColumn:@"Cube_id"];
            cubeHolder.strCubeTitle=[resultSet stringForColumn:@"Cube_Title"];
            cubeHolder.strCubeValue=[resultSet stringForColumn:@"Cube_Description"];
            [arrCubes addObject:cubeHolder];
        }
        [resultSet close];
    }
    @catch (NSException *exception)
    {
        ICLog(@"%@",exception);
    }
    @finally
    {
        [dataBaseIntegrity close];
    }
    return arrCubes;
}

-(NSMutableArray *)getNotificationMessage
{
    NSMutableArray *arrNotification=[[NSMutableArray alloc]init];
    NSString *qury=@"Select * from CubeNotification_table  order by  rowid desc";
    @try
    {
        [dataBaseIntegrity open];
        FMResultSet *resultSet=[dataBaseIntegrity executeQuery:qury];
        while ([resultSet next])
        {
            ICNotificationHolder *holder=[ICNotificationHolder new];
            holder.strMessageId=[resultSet stringForColumn:@"Message_id"];
            holder.strMessage=[resultSet stringForColumn:@"Cube_message"];
            holder.strMessageType=[resultSet stringForColumn:@"Type_Mess"];
            holder.strDisplayFlag=[resultSet stringForColumn:@"Display_Flag"];
            holder.strNotificationId=[resultSet stringForColumn:@"Notification_id"];
            holder.strSeenFlag=[resultSet stringForColumn:@"Is_seen"];
            [arrNotification addObject:holder];
        }
        [resultSet close];
    }
    @catch (NSException *exception)
    {
        ICLog(@"%@",exception);
    }
    @finally
    {
        [dataBaseIntegrity close];
    }
    return arrNotification;
}

-(void)updateNotificationTable
{
    NSString *query=@"update CubeNotification_table set Display_Flag='1'";
    @try
    {
        [dataBaseIntegrity open];
        if ([dataBaseIntegrity executeUpdate:query])
        {
            ICLog(@"successfully updated");
        }
    }
    @catch (NSException *e)
    {
        ICLog(@"%@",e);
    }
    @finally
    {
        [dataBaseIntegrity close];
    }
}

-(NSInteger )getNotificationMessageCount
{
    NSInteger count;
    NSString *qury=@"Select Count() from CubeNotification_table where Display_flag='0'";
    @try
    {
        [dataBaseIntegrity open];
        FMResultSet *resultSet=[dataBaseIntegrity executeQuery:qury];
        while ([resultSet next])
        {
            count=[resultSet intForColumn:@"Count()"];
            
        }
        [resultSet close];
    }
    @catch (NSException *exception)
    {
        ICLog(@"%@",exception);
    }
    @finally
    {
        [dataBaseIntegrity close];
    }
    return count;
}

-(void)deletePreviousComments
{
    NSInteger count;
    NSString *strPrivousDate = [self getPreviousDateFromWeek:3];
    NSString *query=[NSString stringWithFormat: @"Select Count() from CubeNotification_table where Notification_time <\"%@\"",strPrivousDate];
    NSString *query1=[NSString stringWithFormat: @"delete from CubeNotification_table where Notification_time < \"%@\"",strPrivousDate];
    
//     NSString *query=[NSString stringWithFormat:@"Select Count() from CubeNotification_table"];
//    
//     NSString *query1=[NSString stringWithFormat:@"delete from CubeNotification_table"];
//    
     @try
    {
        [dataBaseIntegrity open];
        FMResultSet *resultSet=[dataBaseIntegrity executeQuery:query];
        while ([resultSet next])
        {
            count=[resultSet intForColumn:@"Count()"];
            if (count>0)
            {
                if ([dataBaseIntegrity executeUpdate:query1])
                {
                    ICLog(@"Delete Success");
                }
            }
        }
        [resultSet close];
    }
    @catch (NSException *exception)
    {
        ICLog(@"%@",exception);
    }
    @finally
    {
        [dataBaseIntegrity close];
    }
}
-(void)deleteNotification:(NSInteger)info{
    
    NSInteger notificationId=info;
    
     NSString *query=[NSString stringWithFormat:@"delete from CubeNotification_table where Notification_id=\'%ld\'",(long)notificationId];
    
    @try
    {
        [dataBaseIntegrity open];
        if ([dataBaseIntegrity executeUpdate:query])
        {
            ICLog(@"succesfully deleted");
        }else
        {
            ICLog(@"error in deletion");
        }
        [dataBaseIntegrity close];
    }
    @catch (NSException *e)
    {
        ICLog(@"%@",e);
    }
    
}
-(void)clearUserNotificationData{
    
    NSString *query=[NSString stringWithFormat:@"delete from CubeNotification_table"];
    
    @try
    {
        [dataBaseIntegrity open];
        if ([dataBaseIntegrity executeUpdate:query])
        {
            ICLog(@"succesfully deleted");
            
        }else
        {
            ICLog(@"error in deletion");
        }
        [dataBaseIntegrity close];
    }
    @catch (NSException *e)
    {
        ICLog(@"%@",e);
    }
    
}
-(void)clearUserCubeData{
    
    NSString *query=[NSString stringWithFormat:@"delete from Cube_table"];
    
    @try
    {
        [dataBaseIntegrity open];
        if ([dataBaseIntegrity executeUpdate:query])
        {
            ICLog(@"succesfully deleted");
            
        }else
        {
            ICLog(@"error in deletion");
        }
        [dataBaseIntegrity close];
    }
    @catch (NSException *e)
    {
        ICLog(@"%@",e);
    }
}
-(void)updateParticulerNotification:(ICNotificationHolder *)holder
{
    NSString *strNotificationId=holder.strNotificationId;
    
    NSString *query=[NSString stringWithFormat:@"update CubeNotification_table set Is_seen='1' where Notification_id=\"%@\"",strNotificationId];
    @try
    {
        [dataBaseIntegrity open];
        if ([dataBaseIntegrity executeUpdate:query])
        {
            ICLog(@"successfully updated");
        }
    }
    @catch (NSException *e)
    {
        ICLog(@"%@",e);
    }
    @finally
    {
        [dataBaseIntegrity close];
    }
}


-(NSString *)getPreviousDateFromWeek:(NSInteger)weekDay
{
    NSDate *currentDate=[NSDate date];
    NSCalendar *gregCalendar=[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components=[gregCalendar components:NSMonthCalendarUnit|NSYearCalendarUnit|NSDayCalendarUnit fromDate:currentDate];
    
    NSInteger diffDay=weekDay;
    NSInteger day=[components day];
    NSInteger month=[components month];
    NSInteger year=[components year];
    
    [components setDay:day-diffDay];
    [components setMonth:month];
    [components setYear:year];
    
    NSDateFormatter *frmt=[[NSDateFormatter alloc]init];
    [frmt setDateFormat:@"yyyy-MM-dd"];
    NSString *lastDateOfMonth = [frmt stringFromDate:(NSDate *)[gregCalendar dateFromComponents:components]];
    return lastDateOfMonth;
}

@end
