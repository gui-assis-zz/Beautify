//
//  ProfessionalListViewController.h
//  Beautify
//
//  Created by Guilherme Augusto on 11/04/15.
//  Copyright (c) 2015 Cousins Corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "ProfessionalService.h"
#import "Professional.h"
#import "Service.h"

@interface ProfessionalListViewController : BaseViewController<ProfessionalServiceDelegate, UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *table;
@property (nonatomic, strong) ProfessionalService *professionalService;

@end
