//
//  ConnectionDataService.m
//  Beautify
//
//  Created by Guilherme Augusto on 11/04/15.
//  Copyright (c) 2015 Cousins Corp. All rights reserved.
//

#import "ConnectionDataService.h"

@interface ConnectionDataService()

+(NSString*)getBaseURL;
+(NSString*)getUrlConnection:(NSString*)context;

@end

@implementation ConnectionDataService

+(NSString*)getBaseURL {
    return @"http://192.168.0.0/beautify";
    
}

+(NSString *)getUrlConnection:(NSString *)context{
    return [NSString stringWithFormat:@"%@/rest/%@", [ConnectionDataService getBaseURL], context];
}

+(NSString *)getUrlConnectionForServices:(NSString *)context{
    return [ConnectionDataService getUrlConnection:context];
}

@end
