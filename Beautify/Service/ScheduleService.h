//
//  ScheduleService.h
//  Beautify
//
//  Created by Guilherme Augusto on 12/04/15.
//  Copyright (c) 2015 Cousins Corp. All rights reserved.
//

#import "BaseService.h"
#import "Schedule.h"
#import "Professional.h"
#import "Service.h"

@protocol ScheduleServiceDelegate <NSObject>

-(void) scheduleList:(NSMutableArray*) scheduleList;
-(void) scheduleOk;
-(void) scheduleError;

@end

@interface ScheduleService : BaseService

@property (nonatomic) id <ScheduleServiceDelegate> delegate;

-(void) generateSchedule:(Schedule*) schedule;
-(void) getMySchedules;

@end
