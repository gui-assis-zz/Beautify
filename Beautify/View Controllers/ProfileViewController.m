//
//  ProfileViewController.m
//  Beautify
//
//  Created by Guilherme Augusto on 11/04/15.
//  Copyright (c) 2015 Cousins Corp. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()
@property (strong, nonatomic) IBOutlet UILabel *lblCustomerName;
@property (strong, nonatomic) IBOutlet UILabel *lblCustomerPhone;
@property (strong, nonatomic) IBOutlet UILabel *lblAddress;
@property (strong, nonatomic) IBOutlet UILabel *lblAddressValue;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.lblAddress.font = [UIFont fontWithName:@"BebasNeueBook" size:18];
    self.lblAddressValue.font = [UIFont fontWithName:@"BebasNeueBook" size:24];
    self.lblCustomerName.font = [UIFont fontWithName:@"BebasNeueRegular" size:24];
    self.lblCustomerPhone.font = [UIFont fontWithName:@"BebasNeueRegular" size:24];
    
    self.lblCustomerName.text = @"MARIA EDUARDA";
    self.lblCustomerPhone.text = @"(21) 91234-5678";
    self.lblAddress.text = @"ENDEREÇO";
    self.lblAddressValue.text = @"AV. DAS AMÉRICAS, 100, BARRA DA TIJUCA - RJ";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (IBAction)btnSairClick:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}


@end
