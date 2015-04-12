//
//  FavoritesViewController.m
//  Beautify
//
//  Created by Guilherme Augusto on 11/04/15.
//  Copyright (c) 2015 Cousins Corp. All rights reserved.
//

#import "FavoritesViewController.h"

@interface FavoritesViewController ()

@property (nonatomic, strong) NSMutableArray *favoriteList;
@property (nonatomic, strong) NSMutableArray *favoriteListFiltered;
@property (nonatomic) BOOL isFiltered;

@end

@implementation FavoritesViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.favoriteList = [NSMutableArray new];
    self.favoriteService = [FavoriteService new];
    self.favoriteService.delegate = self;
    
    [self setNeedsStatusBarAppearanceUpdate];
}

-(void)viewWillAppear:(BOOL)animated{
    [self.favoriteService getFavoriteList:@1];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

#pragma mark - FavoriteServiceDelegate

-(void)favoriteServiceTimeOut {
    
}

-(void)favoriteServiceError:(NSString *)errorMessage{
    
}

-(void)favoriteReceived:(Favorite *)favorite {
    [self performSegueWithIdentifier:@"sgDetail" sender:favorite];
}

-(void)favoriteListReceived:(NSArray *)favoriteList{
    self.favoriteList = [NSMutableArray arrayWithArray:favoriteList];
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
