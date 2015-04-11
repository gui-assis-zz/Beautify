//
//  ServicesService.h
//  Beautify
//
//  Created by Guilherme Augusto on 11/04/15.
//  Copyright (c) 2015 Cousins Corp. All rights reserved.
//

#import "BaseService.h"

@protocol ServicesServiceDelegate <NSObject>

-(void) servicesServiceError:(NSString*) errorMessage;
-(void) servicesServiceTimeOut;

@end

@interface ServicesService : BaseService

@property (nonatomic) id <ServicesServiceDelegate> delegate;

@end
