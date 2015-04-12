//
//  ScheduleDetailViewController.h
//  Beautify
//
//  Created by Guilherme Augusto on 11/04/15.
//  Copyright (c) 2015 Cousins Corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Schedule.h"
#import <Simplify/SIMChargeCardViewController.h>
#import "PaymentService.h"
#import "CustomActivityView.h"

@interface ScheduleDetailViewController : UIViewController<SIMChargeCardViewControllerDelegate, PaymentServiceDelegate>

@property (nonatomic, strong) Schedule *schedule;

@end
