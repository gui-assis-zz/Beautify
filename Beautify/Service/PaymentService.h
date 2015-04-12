//
//  PaymentService.h
//  Beautify
//
//  Created by Guilherme Augusto on 12/04/15.
//  Copyright (c) 2015 Cousins Corp. All rights reserved.
//

#import "BaseService.h"
#import "Schedule.h"

@protocol PaymentServiceDelegate <NSObject>

-(void) paymentOk;
-(void) paymentError;

@end

@interface PaymentService : BaseService

@property (nonatomic) id <PaymentServiceDelegate> delegate;
-(void) sendPaymentWithToken:(NSString*) token andSchedule:(Schedule*) schedule;

@end
