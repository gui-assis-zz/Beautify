//
//  ScheduleViewController.m
//  Beautify
//
//  Created by Guilherme Augusto on 11/04/15.
//  Copyright (c) 2015 Cousins Corp. All rights reserved.
//

#import "ScheduleViewController.h"
#import "ProfessionalCell.h"
#import "Schedule.h"
#import "Professional.h"
#import "Service.h"
#import "ScheduleDetailViewController.h"

@interface ScheduleViewController ()

@property (strong, nonatomic) IBOutlet UITableView *table;
@property (nonatomic, strong) NSMutableArray *services;

@end

@implementation ScheduleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.services = [NSMutableArray new];
    
    self.table.delegate = self;
    self.table.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

#pragma mark - UITableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Schedule *schedule = [self.services objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"sgDetailSchedule" sender:schedule];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.services count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *scheduleCell = @"ProfessionalCell";
    
    ProfessionalCell *cell = (ProfessionalCell *)[self.table dequeueReusableCellWithIdentifier:scheduleCell];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:scheduleCell owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    Schedule *schedule = [self.services objectAtIndex:indexPath.row];
    
    UIView *selectionColor = [[UIView alloc] init];
    selectionColor.backgroundColor = [UIColor colorWithRed:0.984 green:0.475 blue:0.737 alpha:0.3f];
    cell.selectedBackgroundView = selectionColor;
    
    cell.lblName.text = [NSString stringWithFormat:@"%@ - %@", schedule.professional.name, schedule.professional.mobilePhone];
    cell.lblPhone.text = [self getServicesNameWithSchedule:schedule];
    cell.professionalImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"foto-%@", schedule.professional.identifier]];
    
    return cell;
    
}

-(NSString*) getServicesNameWithSchedule:(Schedule*) schedule{
    NSMutableString *strReturn = [NSMutableString new];
    for (Service *service in schedule.services) {
        [strReturn appendString:[NSString stringWithFormat:@", %@", service.name]];
    }
    
    return strReturn;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"sgDetailSchedule"]) {
        ScheduleDetailViewController *scheduleDetailVC = (ScheduleDetailViewController*) segue.destinationViewController;
        scheduleDetailVC.schedule = (Schedule*) sender; 
    }
}


@end
