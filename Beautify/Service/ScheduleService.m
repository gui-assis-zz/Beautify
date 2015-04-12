//
//  ScheduleService.m
//  Beautify
//
//  Created by Guilherme Augusto on 12/04/15.
//  Copyright (c) 2015 Cousins Corp. All rights reserved.
//

#import "ScheduleService.h"

@implementation ScheduleService

-(void)generateSchedule:(Schedule *)schedule{
    NSString *strUrl = [self getUrlForContext:@"schedule"];
    
    NSMutableDictionary *dicSchedule = [NSMutableDictionary new];
//    [dicSchedule setValue:[AppHelper getUserId] forKey:@"userId"];
    [dicSchedule setValue:@"1" forKey:@"userId"];
    [dicSchedule setValue:schedule.professional.identifier forKey:@"serviceProvideId"];
    
    NSMutableArray *arrayIdSchedules = [NSMutableArray new];
    
    for (Service *service in schedule.services) {
        [arrayIdSchedules addObject:service.identifier];
    }
    
    [dicSchedule setValue:arrayIdSchedules forKey:@"services"];
    [dicSchedule setValue:schedule.date forKey:@"date"];
    
    NSString *strJson = [dicSchedule JSONString];
    
    [self postWithUrl:strUrl andJson:strJson andTimeOut:20];
}

-(void)treatReceivedData{
    NSLog(@"%@", self.strRequestData);
    if ([self.strRequestData isEqualToString:@"{\"result\":\"success\"}"]) {
        [self.delegate scheduleOk];
    } else {
        [self.delegate scheduleError];
    }
}

-(void)onTimeout:(NSString *)message{
    [self.delegate scheduleError];
}

-(void)errorMessage:(NSString *)errorMessage{
    [self.delegate scheduleError];
}

@end
