//
//  CustomerService.h
//  Beautify
//
//  Created by Guilherme Augusto on 11/04/15.
//  Copyright (c) 2015 Cousins Corp. All rights reserved.
//

#import "BaseService.h"

@protocol CustomerServiceDelegate <NSObject>

-(void) customerServiceError:(NSString*) errorMessage;
-(void) customerServiceTimeOut;

@end

@interface CustomerService : BaseService

@property (nonatomic) id <CustomerServiceDelegate> delegate;

@end
