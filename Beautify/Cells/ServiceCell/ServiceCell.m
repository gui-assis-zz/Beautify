//
//  ServiceCell.m
//  Beautify
//
//  Created by Guilherme Augusto on 11/04/15.
//  Copyright (c) 2015 Cousins Corp. All rights reserved.
//

#import "ServiceCell.h"

@implementation ServiceCell

- (void)awakeFromNib {
    self.lblServiceDescription.font = [UIFont fontWithName:@"BebasNeueBook" size:18];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
