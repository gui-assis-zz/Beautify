//
//  AppHelper.h
//  Beautify
//
//  Created by Guilherme Augusto on 11/04/15.
//  Copyright (c) 2015 Cousins Corp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"

#define PUBLIC_KEY @"sbpb_ZDI5OGFkOWUtZGNhNi00MDkwLTg2YzctNGM2N2UyMDcxZmE0"
#define PRIVATE_KEY @"w8xiDfswGCgzqD0fi3nlMRTQ3+R3tS/93FfuroUZVoR5YFFQL0ODSXAOkNtXTToq"

@interface AppHelper : NSObject

+ (NSManagedObjectContext *)mainManagedObjectContext;

+(NSString*) getPrivateKey;
+(NSString*) getPublicKey;

+(NSString*) getUserId;
+(void) setUserId:(NSString*) userId;

@end
