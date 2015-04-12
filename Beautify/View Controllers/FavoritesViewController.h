//
//  FavoritesViewController.h
//  Beautify
//
//  Created by Guilherme Augusto on 11/04/15.
//  Copyright (c) 2015 Cousins Corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

#import "FavoriteService.h"

@interface FavoritesViewController : BaseViewController<FavoriteServiceDelegate>

@property (nonatomic, strong) FavoriteService *favoriteService;

@end
