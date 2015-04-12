//
//  DateAcessoryView.m
//  Beautify
//
//  Created by Guilherme Augusto on 12/04/15.
//  Copyright (c) 2015 Cousins Corp. All rights reserved.
//

#import "DateAcessoryView.h"

@implementation DateAcessoryView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect {
//}

- (IBAction)btnOkClick:(id)sender {
    [self.delegate dateAcessoryOk];
}

@end
