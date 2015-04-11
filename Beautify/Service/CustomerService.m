//
//  CustomerService.m
//  Beautify
//
//  Created by Guilherme Augusto on 11/04/15.
//  Copyright (c) 2015 Cousins Corp. All rights reserved.
//

#import "CustomerService.h"

@implementation CustomerService

-(void)treatReceivedData{
    
}

#pragma mark - Timeout Delegate

-(void)onTimeout:(NSString *)message{
    [self.delegate customerServiceTimeOut];
}

-(void)errorMessage:(NSString *)errorMessage{
    [self.delegate customerServiceError:errorMessage];
}

@end
