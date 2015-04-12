//
//  ScheduleService.m
//  Beautify
//
//  Created by Guilherme Augusto on 12/04/15.
//  Copyright (c) 2015 Cousins Corp. All rights reserved.
//

#import "ScheduleService.h"
#import "Professional.h"
#import "Customer.h"
#import "Service.h"

@interface ScheduleService()

@property (nonatomic) BOOL isList;

@end

@implementation ScheduleService

-(void)generateSchedule:(Schedule *)schedule{
    
    self.isList = NO;
    
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

-(void)getMySchedules{
    
    self.isList = YES;
    
    NSString *strUrl = [self getUrlForContext:@"schedule-consumer"];
    NSString *url = [NSString stringWithFormat:@"%@/%@", strUrl, @"1"];
    
    [self requestToUrl:url timeOut:10];
}

-(void)treatReceivedData{
    if (self.strRequestData.length <= 0) {
        [self errorMessage:@"Nenhum dado encontrado"];
        return;
    }
    
    NSRange strRangeErro = [self.strRequestData rangeOfString:@"exception"];
    if (strRangeErro.length > 0) {
        [self errorMessage:@"Erro ao processar requisição"];
        return;
    }
    
    if (self.isList) {
        NSMutableArray *arrayRetorno = [NSMutableArray new];
        NSDictionary *dicSchedules = [self.strRequestData objectFromJSONString];
        
        for (NSDictionary *dicSchedule in dicSchedules) {
        
            NSDictionary *dicConsumer  = [dicSchedule objectForKey:@"consumer"];
            NSDictionary *dicProvider  = [dicSchedule objectForKey:@"serviceProvider"];
            NSDictionary *dicServices  = [dicSchedule objectForKey:@"scheduledServices"];
            
            Schedule *schedule = [Schedule new];
            schedule.date = [dicSchedule objectForKey:@"date"];
            schedule.identifier = [NSString stringWithFormat:@"%@", [dicSchedule objectForKey:@"identifier"]];
            
            Customer *customer = [Customer new];
            customer.name = [dicConsumer objectForKey:@"name"];
            customer.phone = [dicConsumer objectForKey:@"phone"];
            customer.address = [dicConsumer objectForKey:@"address"];
            customer.identifier = [NSString stringWithFormat:@"%@", [dicConsumer objectForKey:@"identifier"]];

            Professional *professional = [Professional new];
            professional.name = [dicProvider objectForKey:@"name"];
            professional.mobilePhone = [dicProvider objectForKey:@"mobilePhone"];
            professional.identifier = [NSString stringWithFormat:@"%@", [dicProvider objectForKey:@"identifier"]];
            professional.address = [dicProvider objectForKey:@"address"];
            
            for (NSDictionary *dicService in dicServices) {
                NSDictionary *dicServ = [dicService objectForKey:@"service"];
                Service *service = [Service new];
                service.name = [dicServ objectForKey:@"name"];
                service.price = [dicServ objectForKey:@"price"];
                service.identifier = [NSString stringWithFormat:@"%@", [dicServ objectForKey:@"identifier"]];
                
                [schedule addServicesObject:service];
            }
            
            schedule.professional = professional;
            
            [arrayRetorno addObject:schedule];
        }
        
        [self.delegate scheduleList:arrayRetorno];
        
    } else {
        if ([self.strRequestData isEqualToString:@"{\"result\":\"success\"}"]) {
            [self.delegate scheduleOk];
        } else {
            [self.delegate scheduleError];
        }
    }
}

-(void)onTimeout:(NSString *)message{
    [self.delegate scheduleError];
}

-(void)errorMessage:(NSString *)errorMessage{
    [self.delegate scheduleError];
}

@end
