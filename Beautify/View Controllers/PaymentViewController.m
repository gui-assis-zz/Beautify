//
//  PaymentViewController.m
//  Beautify
//
//  Created by Guilherme Augusto on 11/04/15.
//  Copyright (c) 2015 Cousins Corp. All rights reserved.
//

#import "PaymentViewController.h"
#import "AppHelper.h"

@interface PaymentViewController ()

@end

@implementation PaymentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnPaymentClick:(id)sender {
    SIMChargeCardViewController *cardTokenViewController = [[SIMChargeCardViewController alloc] initWithPublicKey:[AppHelper getPublicKey]];
    
    cardTokenViewController.delegate = self;
    
    [self presentViewController:cardTokenViewController animated:YES completion:nil];
}

-(void)creditCardTokenFailedWithError:(NSError *)error{
    
}

-(void)creditCardTokenProcessed:(SIMCreditCardToken *)token{
    [[[UIAlertView alloc] initWithTitle:@"Token" message:token.token delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil] show];
}

-(void)chargeCardCancelled{
    
}

@end
