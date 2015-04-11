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
    return @"http://10.0.0.26:8080/app/rs";
}

+(NSString *)getUrlConnection:(NSString *)context{
    return [NSString stringWithFormat:@"%@/v1/%@", [ConnectionDataService getBaseURL], context];
}

+(NSString *)getUrlConnectionForServices:(NSString *)context{
    return [ConnectionDataService getUrlConnection:context];
}

@end
