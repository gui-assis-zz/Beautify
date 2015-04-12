//
//  BaseService.m
//  Beautify
//
//  Created by Guilherme Augusto on 11/04/15.
//  Copyright (c) 2015 Cousins Corp. All rights reserved.
//

#import "BaseService.h"
#import "ConnectionDataService.h"

@implementation BaseService

-(instancetype)init{
    self = [super init];
    if (self) {
        self.requestData = nil;
        self.strRequestData = nil;
        self.connection = nil;
    }
    return self;
}

#pragma mark - Connection

-(void)postWithUrl:(NSString*) strUrl andJson:(NSString*)strJson andTimeOut:(int)timeOut{
    self.isTimeOut = NO;
    
    NSString *strUrlPost = [NSString stringWithFormat:@"%@", strUrl];
    
    NSMutableData *body = [NSMutableData new];
    [body appendData:[strJson dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSMutableURLRequest *request = [NSMutableURLRequest new];

    [request setURL:[NSURL URLWithString:strUrlPost]];
    [request setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    [request setHTTPShouldHandleCookies:NO];
    [request setTimeoutInterval:timeOut];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField: @"Content-Type"];
    [request setHTTPBody:body];
    
    [self connect:request timeOut:timeOut];
}

-(void)requestToUrl:(NSString *)strUrl timeOut:(int)timeOut{
    self.isTimeOut = NO;
    
    NSURL *url = [NSURL URLWithString:strUrl];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:timeOut];
    
    [self connect:request timeOut:timeOut];
}

-(NSString*) getUrlForContext:(NSString*) context {
    NSString *strURL = [ConnectionDataService getUrlConnectionForServices:context];
    
    return strURL;
}

-(void) connect:(NSMutableURLRequest*)request timeOut:(int) timeOut{
    NSURLConnection *urlConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
    
    self.connection = urlConnection;
    self.requestData = nil;
    self.strRequestData = nil;

    self.requestData = [NSMutableData new];
    
    self.timeOutTimer = [NSTimer scheduledTimerWithTimeInterval:timeOut target:self selector:@selector(timerFireMethod:) userInfo:nil repeats:NO];
}

#pragma mark - TimeOut

- (void)timerFireMethod:(NSTimer*)theTime {
    [self onTimeOutConnection];
    [self.connection cancel];
    self.connection = nil;
}

-(void)onTimeOutConnection {
    self.isTimeOut = YES;
    [self onTimeout:@"Timeout na conexão!"];
}

-(void)onTimeout:(NSString *)message{
    
}

#pragma mark - Connection Delegate

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [self.requestData appendData:data];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
    [self.timeOutTimer invalidate];
    self.timeOutTimer = nil;
    if (!self.isTimeOut) {
        if (self.requestData) {
            NSString *aStr = [[NSString alloc] initWithData:self.requestData encoding:NSUTF8StringEncoding];
            self.strRequestData = aStr;
        }
        [self treatReceivedData];
    }
    
    self.connection = nil;
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    [self.timeOutTimer invalidate];
    self.timeOutTimer = nil;
    if (!self.isTimeOut) {
        NSString *errorMessage = [NSString stringWithFormat: @"%@", error.localizedDescription];
        [self errorMessage:errorMessage];
    }
    self.connection = nil;
}

@end
