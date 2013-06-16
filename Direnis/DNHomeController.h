//
//  DNHomeController.h
//  Direnis
//
//  Created by Ali Can Bülbül on 6/15/13.
//  Copyright (c) 2013 Can Bülbül. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DNStatusView;

@interface DNHomeController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *level;
@property (weak, nonatomic) IBOutlet UILabel *points;
@property (weak, nonatomic) IBOutlet DNStatusView *status;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;


- (IBAction) passTime:(id)sender;

@end
