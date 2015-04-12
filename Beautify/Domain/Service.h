//
//  Service.h
//  Beautify
//
//  Created by Guilherme Augusto on 11/04/15.
//  Copyright (c) 2015 Cousins Corp. All rights reserved.
//

#import "Model+JSONKit.h"

@interface Service : Model

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * price;
@property (nonatomic, retain) NSString * identifier;
@property (nonatomic) BOOL isSelected;

@end
