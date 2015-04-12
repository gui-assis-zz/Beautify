//
//  ScheduleConfirmationViewController.m
//  Beautify
//
//  Created by Guilherme Augusto on 12/04/15.
//  Copyright (c) 2015 Cousins Corp. All rights reserved.
//

#import "ScheduleConfirmationViewController.h"

@interface ScheduleConfirmationViewController ()
@property (strong, nonatomic) IBOutlet UILabel *lblScheduleTitle;
@property (strong, nonatomic) IBOutlet UILabel *lblScheduleDescription;

@end

@implementation ScheduleConfirmationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.lblScheduleDescription.font = [UIFont fontWithName:@"BebasNeueBook" size:24];
    self.lblScheduleTitle.font = [UIFont fontWithName:@"BebasNeueRegular" size:24];
    
    self.lblScheduleTitle.text = @"SERVIÇO SOLICITADO COM SUCESSO!";
    self.lblScheduleDescription.text = [NSString stringWithFormat:@"O SERVIÇO FOI SOLICITADO COM SUCESSO PARA A DATA %@", self.schedule.date];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
