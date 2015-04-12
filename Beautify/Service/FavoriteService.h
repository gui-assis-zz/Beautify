//
//  FavoriteService.h
//  Beautify
//
//  Created by Guilherme Augusto on 12/04/15.
//  Copyright (c) 2015 Cousins Corp. All rights reserved.
//

#import "BaseService.h"

#import "Favorite.h"

@protocol FavoriteServiceDelegate <NSObject>

-(void) favoriteReceived:(Favorite*) favorite;
-(void) favoriteListReceived:(NSArray*) favoriteList;
-(void) favoriteServiceError:(NSString*) errorMessage;
-(void) favoriteServiceTimeOut;

@end

@interface FavoriteService : BaseService

@property (nonatomic) id <FavoriteServiceDelegate> delegate;

-(void)getFavoriteList:(NSNumber *)customerId;

@end
