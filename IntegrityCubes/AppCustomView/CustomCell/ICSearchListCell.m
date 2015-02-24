//
//  ICSearchListCellTableViewCell.m
//  Cube
//
//  Created by Bhuvan Sharma on 03/06/14.
//  Copyright (c) 2014 Aryavrat Infotech. All rights reserved.
//

#import "ICSearchListCell.h"

@implementation ICSearchListCell
@synthesize imgPerson,lblName;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        imgPerson = [[UIImageView alloc]initWithFrame:CGRectMake(10, 5, 25, 25)];
        lblName = [[UILabel alloc]initWithFrame:CGRectMake(40, 10, 30, 20)];
        
        [self.contentView addSubview:imgPerson];
        [self.contentView addSubview:lblName];
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
