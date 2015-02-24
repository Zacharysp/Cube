//
//  ICCubeListCell.m
//  IntegrityCubes
//
//  Created by Bhuvan Sharma on 21/03/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//

#import "ICCubeListCell.h"

@implementation ICCubeListCell
@synthesize imgCube,lblCubeTitle,lblCubeValue;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.backgroundColor= [UIColor colorWithRed:45.0/255 green:41.0/255 blue:37.0/255 alpha:1];
        
        imgCube=[[UIImageView alloc]initWithFrame:CGRectMake(28, 6, 45, 40)];
        imgCube.layer.cornerRadius=5.0;
        //imgCube.contentMode=UIViewContentModeScaleAspectFit;
        
        
        /////for cube title name
        lblCubeTitle=[[UILabel alloc]initWithFrame:CGRectMake(1, 44, 103, 18)];
        [lblCubeTitle setFont:[UIFont systemFontOfSize:10]];
        [lblCubeTitle setMinimumScaleFactor:8];
        lblCubeTitle.textAlignment=NSTextAlignmentCenter;
        lblCubeTitle.textColor = [UIColor whiteColor];
        
        
        /////for cube value name
        lblCubeValue=[[UILabel alloc]initWithFrame:CGRectMake(119, 7, 175, 35)];
        [lblCubeValue setFont:[UIFont systemFontOfSize:13]];
        lblCubeValue.numberOfLines=3;
        [lblCubeValue setMinimumScaleFactor:10];
        lblCubeValue.adjustsFontSizeToFitWidth=YES;
        lblCubeValue.textColor = [UIColor whiteColor];

        [self.contentView addSubview:imgCube];
        [self.contentView addSubview:lblCubeTitle];
        [self.contentView addSubview:lblCubeValue];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
