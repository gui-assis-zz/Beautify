//
//  ProfessionalCell.m
//  Beautify
//
//  Created by Guilherme Augusto on 11/04/15.
//  Copyright (c) 2015 Cousins Corp. All rights reserved.
//

#import "ProfessionalCell.h"

@implementation ProfessionalCell

- (void)awakeFromNib {
    
    self.lblName.font = [UIFont fontWithName:@"BebasNeueRegular" size:24];
    self.lblPhone.font = [UIFont fontWithName:@"BebasNeueBook" size:18];
    
    self.professionalImage.layer.cornerRadius = self.professionalImage.bounds.size.width/2;
    self.professionalImage.layer.masksToBounds = YES;
    self.professionalImage.layer.borderWidth = 2;
    self.professionalImage.layer.borderColor = [UIColor colorWithRed:0.984 green:0.475 blue:0.737 alpha:1].CGColor;
    self.professionalImage.layer.backgroundColor = [UIColor colorWithWhite:1 alpha:0.2].CGColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
