//
//  Professional.h
//  Beautify
//
//  Created by Guilherme Augusto on 11/04/15.
//  Copyright (c) 2015 Cousins Corp. All rights reserved.
//

#import "Model+JSONKit.h"

@class Service;

@interface Professional : Model

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * address;
@property (nonatomic, retain) NSString * mobilePhone;
@property (nonatomic, retain) NSString * identifier;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSSet *services;
@end

@interface Professional (CoreDataGeneratedAccessors)

- (void)addServicesObject:(Service *)value;
- (void)removeServicesObject:(Service *)value;
- (void)addServices:(NSSet *)values;
- (void)removeServices:(NSSet *)values;

@end
