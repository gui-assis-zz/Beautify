//
//  ContentViewController.h
//  Beautify
//
//  Created by Guilherme Augusto on 12/04/15.
//  Copyright (c) 2015 Cousins Corp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContentViewController : UIViewController

@property NSUInteger pageIndex;

@property (nonatomic, strong) NSString * imageName;
@property (nonatomic, strong) NSString * strTitle;
@property (nonatomic, strong) NSString * strDescription;

@property (strong, nonatomic) IBOutlet UIImageView *imageBack;
@property (strong, nonatomic) IBOutlet UILabel *lblTitle;
@property (strong, nonatomic) IBOutlet UILabel *lblDescription;

@end
