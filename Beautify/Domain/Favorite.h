//
//  Favorite.h
//  Beautify
//
//  Created by Nadilson Ferreira on 4/12/15.
//  Copyright (c) 2015 Cousins Corp. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Model+JSONKit.h"

#import "Customer.h"
#import "Professional.h"

@interface Favorite : Model

@property (nonatomic, retain) Professional *professional;
@property (nonatomic, retain) Customer  *customer;

@end
