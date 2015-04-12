//
//  Schedule.h
//  Beautify
//
//  Created by Guilherme Augusto on 11/04/15.
//  Copyright (c) 2015 Cousins Corp. All rights reserved.
//

#import "Model+JSONKit.h"

@class Professional, Service;

@interface Schedule : Model

@property (nonatomic, retain) NSString * status;
@property (nonatomic, retain) NSString * date;
@property (nonatomic, retain) NSNumber * price;
@property (nonatomic, retain) NSString * identifier;
@property (nonatomic, retain) Professional *professional;
@property (nonatomic, retain) NSSet *services;
@end

@interface Schedule (CoreDataGeneratedAccessors)

- (void)addServicesObject:(Service *)value;
- (void)removeServicesObject:(Service *)value;
- (void)addServices:(NSSet *)values;
- (void)removeServices:(NSSet *)values;

@end
