//
//  DNEylemController.h
//  Direnis
//
//  Created by Ali Can Bülbül on 6/15/13.
//  Copyright (c) 2013 Can Bülbül. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <stdlib.h>
#import <Accounts/Accounts.h>
#import <Twitter/Twitter.h>
#import <QuartzCore/QuartzCore.h>
@class DNStatusView;

@interface DNEylemController : UIViewController
{
    int sIndex;
    int rand;
    NSDictionary *soru;
}

@property (weak, nonatomic) IBOutlet UILabel *level;
@property (weak, nonatomic) IBOutlet UILabel *points;

@property (weak, nonatomic) IBOutlet DNStatusView *status;

@property (weak, nonatomic) IBOutlet UITextView *mainText;
@property (weak, nonatomic) IBOutlet UIButton *c1;
@property (weak, nonatomic) IBOutlet UIButton *c2;
@property (weak, nonatomic) IBOutlet UIImageView *background;

- (IBAction) takeAction:(id)sender;
- (IBAction) goBackToMeydan:(id)sender;

-(IBAction)facebook:(id)sender;
-(IBAction)twitter:(id)sender;

@end
