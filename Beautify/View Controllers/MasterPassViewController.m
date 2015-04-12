//
//  MasterPassViewController.m
//  Beautify
//
//  Created by Guilherme Augusto on 12/04/15.
//  Copyright (c) 2015 Cousins Corp. All rights reserved.
//

#import "MasterPassViewController.h"

@interface MasterPassViewController ()

@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation MasterPassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *url = [NSURL URLWithString:@"https://www.simplify.com/commerce/masterPass/index?key=sbpb_ZDI5OGFkOWUtZGNhNi00MDkwLTg2YzctNGM2N2UyMDcxZmE0&token="];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    self.webView.scrollView.scrollEnabled = TRUE;
    self.webView.scrollView.bounces = TRUE;
    [self.webView loadRequest:request];
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
