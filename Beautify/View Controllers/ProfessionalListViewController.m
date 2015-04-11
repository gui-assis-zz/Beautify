//
//  ProfessionalListViewController.m
//  Beautify
//
//  Created by Guilherme Augusto on 11/04/15.
//  Copyright (c) 2015 Cousins Corp. All rights reserved.
//

#import "ProfessionalListViewController.h"
#import "ProfessionalCell.h"
#import "Professional.h"
#import "ProfessionalDetailViewController.h"

@interface ProfessionalListViewController ()

@property (nonatomic, strong) NSMutableArray *professionalList;


@end

@implementation ProfessionalListViewController

@synthesize table;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.professionalList = [NSMutableArray new];
    self.professionalService = [ProfessionalService new];
    self.professionalService.delegate = self;
    
    table.delegate = self;
    table.dataSource = self;
    
    [self setNeedsStatusBarAppearanceUpdate];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [self.professionalService getProfessionalList];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Professional *professional = [self.professionalList objectAtIndex:indexPath.row];
    [self.professionalService getProfessionalDetailWithId:professional.identifier];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.professionalList count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *professionalCell = @"ProfessionalCell";
    
    ProfessionalCell *cell = (ProfessionalCell *)[table dequeueReusableCellWithIdentifier:professionalCell];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:professionalCell owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    Professional *professional = [self.professionalList objectAtIndex:indexPath.row];
    
    cell.lblName.text = professional.name;
    cell.lblService.text = [self getServicesFromProfessional:professional];
    cell.professionalImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@-thumb", professional.identifier]];
    
    return cell;
}

#pragma mark - ProfessionalServiceDelegate

-(void)professionalServiceTimeOut{
    
}

-(void)professionalServiceError:(NSString *)errorMessage{
    
}

-(void)professionalReceived:(Professional *)professional{
    [self performSegueWithIdentifier:@"sgDetail" sender:professional];
}

-(void)professionalListReceived:(NSArray *)professionalList{
    self.professionalList = [NSMutableArray arrayWithArray:professionalList];
    [table reloadData];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"sgDetail"]) {
        ProfessionalDetailViewController *professionalDetailVC = (ProfessionalDetailViewController*) segue.destinationViewController;
        
        professionalDetailVC.professional = (Professional*) sender;
    }
}

#pragma mark - Methods

-(NSString*) getServicesFromProfessional:(Professional*) professional{
    NSMutableString *strServices = [NSMutableString new];
    
    for (Service *service in professional.services) {
        [strServices appendString:[NSString stringWithFormat:@", %@", service.name]];
    }
    
    return strServices;
}

@end
