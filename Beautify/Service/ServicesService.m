//
//  ServicesService.m
//  Beautify
//
//  Created by Guilherme Augusto on 11/04/15.
//  Copyright (c) 2015 Cousins Corp. All rights reserved.
//

#import "ServicesService.h"

@implementation ServicesService

-(void)treatReceivedData{
    
}

#pragma mark - Timeout Delegate

-(void)onTimeout:(NSString *)message{
    [self.delegate servicesServiceTimeOut];
}

-(void)errorMessage:(NSString *)errorMessage{
    [self.delegate servicesServiceError:errorMessage];
}

@end
