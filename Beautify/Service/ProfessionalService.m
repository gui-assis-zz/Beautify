//
//  ProfessionalService.m
//  Beautify
//
//  Created by Guilherme Augusto on 11/04/15.
//  Copyright (c) 2015 Cousins Corp. All rights reserved.
//

#import "ProfessionalService.h"

@implementation ProfessionalService

#pragma mark - Methods

-(void)getProfessionalList{
    
    NSString *strUrl = [self getUrlForContext:@"professional/listprofessionals"];
    
    NSString *url = [NSString stringWithFormat:@"%@/%@", strUrl, [AppHelper getUserSession]];
    
    [self requestToUrl:url timeOut:10];
}

-(void)treatReceivedData{
    
}

#pragma mark - Super Methods

-(void)errorMessage:(NSString *)errorMessage{
    [self.delegate professionalServiceError:errorMessage];
}

-(void)onTimeout:(NSString *)message{
    [self.delegate professionalServiceTimeOut];
}

@end
