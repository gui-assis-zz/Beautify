//
//  ProfessionalDetailViewController.m
//  Beautify
//
//  Created by Guilherme Augusto on 11/04/15.
//  Copyright (c) 2015 Cousins Corp. All rights reserved.
//

#import "ProfessionalDetailViewController.h"
#import "ServiceCell.h"
#import "Service.h"
#import "Schedule.h"
#import "ScheduleConfirmationViewController.h"

@interface ProfessionalDetailViewController ()

@property (strong, nonatomic) IBOutlet UIButton *btnFavorite;
@property (strong, nonatomic) IBOutlet UIImageView *professionalImage;
@property (strong, nonatomic) IBOutlet UILabel *lblAddress;
@property (strong, nonatomic) IBOutlet UILabel *lblServices;
@property (strong, nonatomic) IBOutlet UILabel *lblProfessionalName;
@property (strong, nonatomic) IBOutlet UILabel *lblProfessionalAddress;
@property (strong, nonatomic) IBOutlet UILabel *lblMobilePhone;
@property (strong, nonatomic) IBOutlet UITableView *table;
@property (strong, nonatomic) NSMutableArray *services;
@property (strong, nonatomic) IBOutlet UITextField *edtDate;
@property (strong, nonatomic) UIDatePicker *pickerScheduleDate;
@property (strong, nonatomic) ScheduleService *scheduleService;
@property (strong, nonatomic) Schedule *pendingSchedule;

@end

@implementation ProfessionalDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scheduleService = [ScheduleService new];
    self.scheduleService.delegate = self;
    
    self.navigationItem.backBarButtonItem.title = @"";
    
    self.professionalImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"foto-perfil-%@", self.professional.identifier]];
    
    self.lblAddress.font = [UIFont fontWithName:@"BebasNeueRegular" size:18];
    self.lblServices.font = [UIFont fontWithName:@"BebasNeueRegular" size:18];
    self.lblMobilePhone.font = [UIFont fontWithName:@"BebasNeueBook" size:24];
    self.lblProfessionalName.font = [UIFont fontWithName:@"BebasNeueRegular" size:24];
    self.lblProfessionalAddress.font = [UIFont fontWithName:@"BebasNeueBook" size:24];
    self.edtDate.font = [UIFont fontWithName:@"BebasNeueRegular" size:18];
    
    self.lblProfessionalName.text = self.professional.name;
    self.lblProfessionalAddress.text = self.professional.address;
    self.lblMobilePhone.text = self.professional.mobilePhone;
    
    self.table.delegate = self;
    self.table.dataSource = self;
    
    self.edtDate.delegate = self;
    
    self.services = [NSMutableArray new];
    
    for (Service *service in self.professional.services) {
        [self.services addObject:service];
    }
    
    self.pickerScheduleDate = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 0, 230, 0)];
    self.pickerScheduleDate.datePickerMode = UIDatePickerModeDate;
    [self.pickerScheduleDate addTarget:self action:@selector(getDate:) forControlEvents:UIControlEventValueChanged];
    
    self.edtDate.inputView = self.pickerScheduleDate;
    
    self.edtDate.layer.cornerRadius=8.0f;
    self.edtDate.layer.masksToBounds=YES;
    self.edtDate.layer.borderColor=[UIColor colorWithRed:0.984 green:0.475 blue:0.737 alpha:1].CGColor;
    self.edtDate.layer.borderWidth= 1.0f;
}

-(void) dismissKeyboard{
    [self.edtDate resignFirstResponder];
}

-(void) getDate:(UIDatePicker *) sender{
    NSDate *currentDate = sender.date;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    self.edtDate.text = [formatter stringFromDate:currentDate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnFavoriteClick:(id)sender {
    if (!self.btnFavorite || self.btnFavorite.tag == 0) {
        [self.btnFavorite setImage:[UIImage imageNamed:@"foto-perfil-fav-off"] forState:UIControlStateNormal];
        self.btnFavorite.tag = 1;
    } else {
        [self.btnFavorite setImage:[UIImage imageNamed:@"foto-perfil-fav-on"] forState:UIControlStateNormal];
        self.btnFavorite.tag = 0;
    }
}

#pragma mark - UITableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Service *service = [self.services objectAtIndex:indexPath.row];
    service.isSelected = !service.isSelected;
    [self.table reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.services count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *serviceCell = @"ServiceCell";
    
    ServiceCell *cell = (ServiceCell *)[self.table dequeueReusableCellWithIdentifier:serviceCell];

    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:serviceCell owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    Service *service = [self.services objectAtIndex:indexPath.row];
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    cell.lblServiceDescription.text = [NSString stringWithFormat:@"%@ - R$%.2f", service.name, [service.price floatValue]/10];
    
    if (service.isSelected) {
        [cell.btnCheckService setImage:[UIImage imageNamed:@"radio-on"] forState:UIControlStateNormal];
    } else {
        [cell.btnCheckService setImage:[UIImage imageNamed:@"radio-off"] forState:UIControlStateNormal];
    }
    
    return cell;
    
}


-(void)textFieldDidBeginEditing:(UITextField *)textField{
    UIDatePicker *datePicker = [[UIDatePicker alloc] init];
    [datePicker setMinuteInterval:15];
    datePicker.datePickerMode = UIDatePickerModeDateAndTime;
    textField.inputView = datePicker;
    [datePicker addTarget:self action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
}

-(void) datePickerValueChanged:(UIDatePicker*) sender{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy HH:mm:ss"];
    self.edtDate.text = [dateFormatter stringFromDate:sender.date];
}

#pragma mark - DateSelectionDelegate

-(void)dateAcessoryOk{
    [self.edtDate resignFirstResponder];
}

- (IBAction)btnScheduleClick:(id)sender {
    [self.edtDate resignFirstResponder];
    
    Schedule *schedule = [Schedule new];
    schedule.price = [NSNumber numberWithFloat:[self getScheduleTotal]];
    schedule.professional = self.professional;
    schedule.services = [self getServicesCheckeds];
    schedule.date = self.edtDate.text;
    
    self.pendingSchedule = schedule;
    
    [self.scheduleService generateSchedule:schedule];
}

-(float) getScheduleTotal{
    float total = 0;
    
    for (Service *service in self.services) {
        if (service.isSelected) {
            total = total + [service.price floatValue];
        }
    }
    
    return total;
}

-(NSSet*) getServicesCheckeds{
    NSMutableSet *services = [NSMutableSet new];
    
    for (Service *service in self.services) {
        if (service.isSelected) {
            [services addObject:service];
        }
    }
    
    return services;
}

#pragma mark - ScheduleServiceDelegate

-(void)scheduleOk{
    [self performSegueWithIdentifier:@"sgScheduleOk" sender:nil];
}

-(void)scheduleError{
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"sgScheduleOk"]) {
        ScheduleConfirmationViewController *scheduleConfirmationVC = (ScheduleConfirmationViewController*) segue.destinationViewController;
        scheduleConfirmationVC.schedule = self.pendingSchedule;

    }
}

@end
