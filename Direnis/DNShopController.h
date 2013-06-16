//
//  DNShopController.h
//  Direnis
//
//  Created by Ali Can Bülbül on 6/15/13.
//  Copyright (c) 2013 Can Bülbül. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DNStatusView;

@interface DNShopController : UIViewController <UITableViewDataSource,UITableViewDelegate, UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet DNStatusView *status;

- (IBAction)goBack:(id)sender;

@end
