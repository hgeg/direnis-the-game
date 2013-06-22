//
//  DNMeydanController.h
//  Direnis
//
//  Created by Ali Can Bülbül on 6/15/13.
//  Copyright (c) 2013 Can Bülbül. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DNStatusView;

@interface DNMeydanController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *m1;
@property (weak, nonatomic) IBOutlet UIButton *m2;
@property (weak, nonatomic) IBOutlet UIButton *m3;
@property (weak, nonatomic) IBOutlet DNStatusView *status;

- (IBAction) goToHome:(id)sender;

@end
