//
//  ProfessionalDetailViewController.m
//  Beautify
//
//  Created by Guilherme Augusto on 11/04/15.
//  Copyright (c) 2015 Cousins Corp. All rights reserved.
//

#import "ProfessionalDetailViewController.h"

@interface ProfessionalDetailViewController ()

@property (strong, nonatomic) IBOutlet UILabel *lblProfessionalName;
@property (strong, nonatomic) IBOutlet UILabel *lblProfessionalAddress;

@end

@implementation ProfessionalDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.backBarButtonItem.title = @"";
    
    self.lblProfessionalName.text = self.professional.name;
    self.lblProfessionalAddress.text = self.professional.address;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
