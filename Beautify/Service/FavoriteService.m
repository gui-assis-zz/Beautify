//
//  FavoriteService.m
//  Beautify
//
//  Created by Guilherme Augusto on 12/04/15.
//  Copyright (c) 2015 Cousins Corp. All rights reserved.
//

#import "FavoriteService.h"

@interface FavoriteService()

@property (nonatomic) BOOL isGetList;

@end

@implementation FavoriteService

-(void)getFavoriteList:(NSNumber *)customerId{
    self.isGetList = YES;
    
    NSString *strUrl = [self getUrlForContext:[NSString stringWithFormat:@"like/%ld", [customerId longValue]]];
    
    [self requestToUrl:strUrl timeOut:10];
}

-(void)treatReceivedData{
    NSMutableArray *dicReturn = [NSMutableArray new];
    
    NSDictionary *dicData = [self.strRequestData objectFromJSONString];
    
    if (self.isGetList) {
        NSLog(@"%@", dicData);
    } else {

    }
    
    if (self.isGetList) {
        [self.delegate favoriteListReceived:dicReturn];
    } else {
        [self.delegate favoriteReceived:[dicReturn objectAtIndex:0]];
    }
}

#pragma mark - Super Methods

-(void)errorMessage:(NSString *)errorMessage{
    [self.delegate favoriteServiceError:errorMessage];
}

-(void)onTimeout:(NSString *)message{
    [self.delegate favoriteServiceTimeOut];
}


@end
