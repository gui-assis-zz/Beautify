//
//  ScheduleCell.m
//  Beautify
//
//  Created by Guilherme Augusto on 11/04/15.
//  Copyright (c) 2015 Cousins Corp. All rights reserved.
//

#import "ScheduleCell.h"

@implementation ScheduleCell

- (void)awakeFromNib {
    self.lblServiceName.font = [UIFont fontWithName:@"BebasNeueBook" size:18];
    self.lblProfessionalName.font = [UIFont fontWithName:@"BebasNeueRegular" size:24];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
