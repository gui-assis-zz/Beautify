//
//  ScheduleDetailViewController.m
//  Beautify
//
//  Created by Guilherme Augusto on 11/04/15.
//  Copyright (c) 2015 Cousins Corp. All rights reserved.
//

#import "ScheduleDetailViewController.h"
#import "Service.h"
#import "Professional.h"

@interface ScheduleDetailViewController ()

@property (nonatomic, strong) CustomActivityView *activityAlert;
@property (strong, nonatomic) IBOutlet UILabel *lblScheduled;
@property (strong, nonatomic) IBOutlet UILabel *lblService;
@property (strong, nonatomic) IBOutlet UILabel *lblDate;
@property (strong, nonatomic) IBOutlet UILabel *lblDateValue;
@property (strong, nonatomic) IBOutlet UILabel *lblPriceLabel;
@property (strong, nonatomic) IBOutlet UILabel *lblPrice;
@property (strong, nonatomic) IBOutlet UIButton *btnCardPay;
@property (strong, nonatomic) IBOutlet UIButton *btnMasterPassPay;
@property (strong, nonatomic) IBOutlet UIImageView *imgProvider;
@property (strong, nonatomic) IBOutlet UILabel *lblNameProvider;
@property (strong, nonatomic) IBOutlet UILabel *lblPhoneProvider;
@property (strong, nonatomic) PaymentService *paymentService;

@end

@implementation ScheduleDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.activityAlert = [CustomActivityView new];
    
    self.paymentService = [PaymentService new];
    self.paymentService.delegate = self;
    
    self.lblScheduled.font = [UIFont fontWithName:@"BebasNeueBook" size:18];
    self.lblService.font = [UIFont fontWithName:@"BebasNeueBook" size:24];
    self.lblDate.font = [UIFont fontWithName:@"BebasNeueBook" size:18];
    self.lblDateValue.font = [UIFont fontWithName:@"BebasNeueBook" size:24];
    self.lblPriceLabel.font = [UIFont fontWithName:@"BebasNeueBook" size:18];
    self.lblPrice.font = [UIFont fontWithName:@"BebasNeueBook" size:24];
    self.lblNameProvider.font = [UIFont fontWithName:@"BebasNeueBook" size:24];
    self.lblPhoneProvider.font = [UIFont fontWithName:@"BebasNeueBook" size:24];
    
    self.lblDateValue.text = self.schedule.date;
    self.lblPrice.text = [NSString stringWithFormat:@"R$%.2f", [self getScheduleTotal]];
    self.lblService.text = [(Service*) self.schedule.services.anyObject name];
    
    [self.btnCardPay setBackgroundColor:[UIColor colorWithRed:0.984 green:0.475 blue:0.737 alpha:1]];
    [self.btnMasterPassPay setBackgroundColor:[UIColor colorWithRed:0.984 green:0.475 blue:0.737 alpha:1]];
    
    self.imgProvider.image = [UIImage imageNamed:[NSString stringWithFormat:@"foto-perfil-%@", self.schedule.professional.identifier]];
    
    if ([self.schedule.status isEqualToString:@"APPROVED"]) {
        self.btnCardPay.userInteractionEnabled = NO;
        self.btnMasterPassPay.userInteractionEnabled = NO;
    } else {
        self.btnCardPay.userInteractionEnabled = YES;
        self.btnMasterPassPay.userInteractionEnabled = YES;
    }
}

-(float) getScheduleTotal{
    float total = 0;
    
    for (Service *service in self.schedule.services) {
        total = total + [service.price floatValue];
    }
    
    return total/10;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnCardPayClick:(id)sender {
    SIMChargeCardViewController *simChargeViewController = [[SIMChargeCardViewController alloc] initWithPublicKey:[AppHelper getPublicKey] primaryColor:[UIColor colorWithRed:0.984 green:0.475 blue:0.737 alpha:1]];
    
    simChargeViewController.delegate = self;
    [self presentViewController:simChargeViewController animated:YES completion:nil];
}

- (IBAction)btnMasterPassPayClick:(id)sender {
    
}

-(void)creditCardTokenFailedWithError:(NSError *)error{
    
}

-(void)creditCardTokenProcessed:(SIMCreditCardToken *)token{
    [self.activityAlert exibir];
    [self.paymentService sendPaymentWithToken:token.token andSchedule:self.schedule];
}

-(void)chargeCardCancelled{
    
}

-(void)paymentOk{
    [self.activityAlert esconder];
    self.schedule.status = @"APPROVED";
    [[[UIAlertView alloc] initWithTitle:@"Pagamento" message:@"Pagamento realizado com sucesso!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil] show];
}

-(void)paymentError{
    [self.activityAlert esconder];
    self.schedule.status = @"ERROR";
    [[[UIAlertView alloc] initWithTitle:@"Pagamento" message:@"Erro ao processar pagamento" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil] show];
}

@end
