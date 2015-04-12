//
//  ProfessionalService.m
//  Beautify
//
//  Created by Guilherme Augusto on 11/04/15.
//  Copyright (c) 2015 Cousins Corp. All rights reserved.
//

#import "ProfessionalService.h"
#import "Professional.h"

@interface ProfessionalService()

@property (nonatomic) BOOL isGetList;

@end

@implementation ProfessionalService

#pragma mark - Methods

-(void)getProfessionalList{
    
    self.isGetList = YES;
    
    NSString *strUrl = [self getUrlForContext:@"service-provider"];
    
    [self requestToUrl:strUrl timeOut:10];
}

-(void)getProfessionalDetailWithId:(NSString *)professionalId{
    
    self.isGetList = NO;
    
    NSString *url = [NSString stringWithFormat:@"%@/%@", [self getUrlForContext:@"service-provider"], professionalId];
    
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
    
    NSMutableArray *dicReturn = [NSMutableArray new];
    
    NSDictionary *dicData = [self.strRequestData objectFromJSONString];
    
    if (self.isGetList) {
        for (NSDictionary *dicProfessional in dicData) {
            Professional *professional = [Professional new];
            professional.name = [dicProfessional objectForKey:@"name"];
            professional.address = [dicProfessional objectForKey:@"address"];
            professional.mobilePhone = [dicProfessional objectForKey:@"mobilePhone"];
            professional.identifier = [NSString stringWithFormat:@"%@", [dicProfessional objectForKey:@"identifier"]];
            professional.email = [dicProfessional objectForKey:@"email"];
            
            for (NSDictionary *dicService in [dicProfessional objectForKey:@"services"]) {
                Service *service = [Service new];
                service.name = [dicService objectForKey:@"name"];
                service.price = [dicService objectForKey:@"price"];
                service.identifier = [NSString stringWithFormat:@"%@", [dicService objectForKey:@"identifier"]];
                
                [professional addServicesObject:service];
            }
            
            [dicReturn addObject:professional];
        }
    } else {
        Professional *professional = [Professional new];
        professional.name = [dicData objectForKey:@"name"];
        professional.address = [dicData objectForKey:@"address"];
        professional.mobilePhone = [dicData objectForKey:@"mobilePhone"];
        professional.identifier = [NSString stringWithFormat:@"%@", [dicData objectForKey:@"identifier"]];
        professional.email = [dicData objectForKey:@"email"];
        
        for (NSDictionary *dicService in [dicData objectForKey:@"services"]) {
            Service *service = [Service new];
            service.name = [dicService objectForKey:@"name"];
            service.price = [dicService objectForKey:@"price"];
            service.identifier = [NSString stringWithFormat:@"%@", [dicService objectForKey:@"identifier"]];
            
            [professional addServicesObject:service];
        }
        
        [dicReturn addObject:professional];
    }
    
    if (self.isGetList) {
        [self.delegate professionalListReceived:dicReturn];
    } else {
        [self.delegate professionalReceived:[dicReturn objectAtIndex:0]];
    }
}

#pragma mark - Super Methods

-(void)errorMessage:(NSString *)errorMessage{
    [self.delegate professionalServiceError:errorMessage];
}

-(void)onTimeout:(NSString *)message{
    [self.delegate professionalServiceTimeOut];
}

@end
