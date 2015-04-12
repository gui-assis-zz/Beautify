//
//  ScheduleViewController.h
//  Beautify
//
//  Created by Guilherme Augusto on 11/04/15.
//  Copyright (c) 2015 Cousins Corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "ScheduleService.h"

@interface ScheduleViewController : BaseViewController<UITableViewDataSource, UITableViewDelegate, ScheduleServiceDelegate>

@property (nonatomic, strong) ScheduleService *scheduleService;

@end
