//
//  ContentViewController.m
//  Beautify
//
//  Created by Guilherme Augusto on 12/04/15.
//  Copyright (c) 2015 Cousins Corp. All rights reserved.
//

#import "ContentViewController.h"

@interface ContentViewController ()

@property (strong, nonatomic) IBOutlet UIButton *btnIniciar;

@end

@implementation ContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageBack.image = [UIImage imageNamed:self.imageName];
    self.lblTitle.text = self.strTitle;
    self.lblDescription.text = self.strDescription;
    
    self.lblDescription.font = [UIFont fontWithName:@"BebasNeueBook" size:24];
    self.lblTitle.font = [UIFont fontWithName:@"BebasNeueRegular" size:24];
    [self.lblTitle setTextColor:[UIColor whiteColor]];
    [self.lblDescription setTextColor:[UIColor whiteColor]];
    
    self.btnIniciar.titleLabel.font = [UIFont fontWithName:@"BebasNeueBook" size:18];
    [self.btnIniciar setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.btnIniciar setBackgroundColor:[UIColor colorWithRed:0.984 green:0.475 blue:0.737 alpha:1]];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (IBAction)btnIniciarClick:(id)sender {
}

@end
