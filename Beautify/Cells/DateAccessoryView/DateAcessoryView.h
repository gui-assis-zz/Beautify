//
//  DateAcessoryView.h
//  Beautify
//
//  Created by Guilherme Augusto on 12/04/15.
//  Copyright (c) 2015 Cousins Corp. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DateAcessoryViewDelegate <NSObject>

-(void) dateAcessoryOk;

@end

@interface DateAcessoryView : UIView


@property (nonatomic) id <DateAcessoryViewDelegate> delegate;


@end
