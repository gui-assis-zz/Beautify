//
//  ProfessionalDetailViewController.h
//  Beautify
//
//  Created by Guilherme Augusto on 11/04/15.
//  Copyright (c) 2015 Cousins Corp. All rights reserved.
//

#import "BaseViewController.h"
#import "Professional.h"
#import "ScheduleService.h"

@interface ProfessionalDetailViewController : BaseViewController<UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate, ScheduleServiceDelegate>

@property (nonatomic, strong) Professional *professional;

@end
