//
//  LoginViewController.m
//  Beautify
//
//  Created by Guilherme Augusto on 11/04/15.
//  Copyright (c) 2015 Cousins Corp. All rights reserved.
//

#import "LoginViewController.h"

#define placeHolderColor [UIColor whiteColor]

@interface LoginViewController ()

@property (strong, nonatomic) IBOutlet UITextField *edtEmail;
@property (strong, nonatomic) IBOutlet UITextField *edtPassword;
@property (strong, nonatomic) IBOutlet UIButton *btnLogin;
@property (strong, nonatomic) IBOutlet UIButton *btnSignUp;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self placeHolder];
    [self.view setBackgroundColor:[UIColor colorWithRed:0.984 green:0.475 blue:0.737 alpha:1]];
    
    self.btnLogin.titleLabel.font = [UIFont fontWithName:@"BebasNeueBook" size:18];
    self.btnSignUp.titleLabel.font = [UIFont fontWithName:@"BebasNeueBook" size:18];
    
    [self.btnLogin setTitleColor:[UIColor colorWithRed:0.984 green:0.475 blue:0.737 alpha:1] forState:UIControlStateNormal];
    [self.btnSignUp setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    self.btnSignUp.layer.borderColor=[UIColor whiteColor].CGColor;
    self.btnSignUp.layer.borderWidth= 1.0f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) placeHolder{
    
    self.edtEmail.attributedPlaceholder  = [[NSAttributedString alloc] initWithString:self.edtEmail.placeholder attributes:@{NSForegroundColorAttributeName: placeHolderColor}];
    
    self.edtPassword.attributedPlaceholder  = [[NSAttributedString alloc] initWithString:self.edtPassword.placeholder attributes:@{NSForegroundColorAttributeName: placeHolderColor}];
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

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
