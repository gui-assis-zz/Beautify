//
//  ProfessionalCell.h
//  Beautify
//
//  Created by Guilherme Augusto on 11/04/15.
//  Copyright (c) 2015 Cousins Corp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfessionalCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *lblName;
@property (strong, nonatomic) IBOutlet UIImageView *professionalImage;
@property (strong, nonatomic) IBOutlet UILabel *lblPhone;

@end
