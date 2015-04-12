//
//  PaymentService.m
//  Beautify
//
//  Created by Guilherme Augusto on 12/04/15.
//  Copyright (c) 2015 Cousins Corp. All rights reserved.
//

#import "PaymentService.h"
#import "Service.h"

@implementation PaymentService

-(void)sendPaymentWithToken:(NSString *)token andSchedule:(Schedule *)schedule{
    
    NSString *strUrl = [self getUrlForContext:@"checkout"];
    
    NSString *description = [(Service*) schedule.services.anyObject name];
    
    NSMutableDictionary *dicPayment = [NSMutableDictionary new];
    
    [dicPayment setValue:schedule.identifier forKey:@"scheduleId"];
    [dicPayment setValue:[NSNumber numberWithFloat:[self getTotalFromSchedule:schedule]] forKey:@"amount"];
    [dicPayment setValue:description forKey:@"description"];
    [dicPayment setValue:schedule.identifier forKey:@"reference"];
    
    NSString *strJson = [dicPayment JSONString];
    
    [self postWithUrl:strUrl andJson:strJson andTimeOut:20];
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
    
    NSDictionary *dicPayment = [self.strRequestData objectFromJSONString];
    NSString *paymentStatus = [dicPayment objectForKey:@"status"];
    if ([paymentStatus isEqualToString:@"APPROVED"]) {
        [self.delegate paymentOk];
    } else {
        [self.delegate paymentError];
    }
    
}

-(void)onTimeout:(NSString *)message{
    [self.delegate paymentError];
}

-(void)errorMessage:(NSString *)errorMessage{
    [self.delegate paymentError];
}

-(float) getTotalFromSchedule:(Schedule*) schedule{
    float total = 0;
    
    for (Service *service in schedule.services) {
        total = total + [service.price floatValue];
    }
    
    return total;
}

@end
