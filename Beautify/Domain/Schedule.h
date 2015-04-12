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

@property (nonatomic, retain) NSString * date;
@property (nonatomic, retain) Professional *professional;
@property (nonatomic, retain) Service *service;

@end
