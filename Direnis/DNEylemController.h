//
//  DNEylemController.h
//  Direnis
//
//  Created by Ali Can Bülbül on 6/15/13.
//  Copyright (c) 2013 Can Bülbül. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <stdlib.h>
@class DNStatusView;

@interface DNEylemController : UIViewController
{
    int sIndex;
}

@property (weak, nonatomic) IBOutlet UILabel *level;
@property (weak, nonatomic) IBOutlet UILabel *points;

@property (weak, nonatomic) IBOutlet DNStatusView *status;

@property (weak, nonatomic) IBOutlet UITextView *mainText;
@property (weak, nonatomic) IBOutlet UIButton *c1;
@property (weak, nonatomic) IBOutlet UIButton *c2;

- (IBAction) takeAction:(id)sender;
- (IBAction) goBackToMeydan:(id)sender;

@end
