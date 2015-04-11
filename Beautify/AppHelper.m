//
//  AppHelper.m
//  Beautify
//
//  Created by Guilherme Augusto on 11/04/15.
//  Copyright (c) 2015 Cousins Corp. All rights reserved.
//

#import "AppHelper.h"

@implementation AppHelper

+ (NSManagedObjectContext *)mainManagedObjectContext {
    return [((AppDelegate *)[[UIApplication sharedApplication] delegate]) managedObjectContext];
}

+(NSString *)getPrivateKey{
    return PRIVATE_KEY;
}

+(NSString *)getPublicKey{
    return PUBLIC_KEY;
}

+(NSString *)getUserSession{
    AppDelegate *delegate = ((AppDelegate *)[[UIApplication sharedApplication] delegate]);
    return [delegate userSession];
}

+(void)setUserSession:(NSString *)userSession{
    AppDelegate *delegate = ((AppDelegate *)[[UIApplication sharedApplication] delegate]);
    [delegate setUserSession:userSession];
}


@end
