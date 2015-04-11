//
//  LoginViewController.m
//  Beautify
//
//  Created by Guilherme Augusto on 11/04/15.
//  Copyright (c) 2015 Cousins Corp. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}

#pragma mark - Controls

- (IBAction)btnLoginClick:(id)sender {
    if ([self isValidLogin]) {
        [self performSegueWithIdentifier:@"sgLogin" sender:nil];
    }
}

#pragma mark - Methods

-(BOOL) isValidLogin{
    return YES;
}

@end
