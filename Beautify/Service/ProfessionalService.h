//
//  ProfessionalService.h
//  Beautify
//
//  Created by Guilherme Augusto on 11/04/15.
//  Copyright (c) 2015 Cousins Corp. All rights reserved.
//

#import "BaseService.h"
#import "Professional.h"

@protocol ProfessionalServiceDelegate <NSObject>

-(void) professionalReceived:(Professional*) professional;
-(void) professionalListReceived:(NSArray*) professionalList;
-(void) professionalServiceError:(NSString*) errorMessage;
-(void) professionalServiceTimeOut;

@end

@interface ProfessionalService : BaseService

@property (nonatomic) id <ProfessionalServiceDelegate> delegate;

-(void) getProfessionalList;
-(void) getProfessionalDetailWithId:(NSString*) professionalId;

@end
