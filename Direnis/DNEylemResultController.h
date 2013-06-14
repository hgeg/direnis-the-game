//
//  DNEylemResultController.h
//  Direnis
//
//  Created by Ali Can Bülbül on 6/15/13.
//  Copyright (c) 2013 Can Bülbül. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DNEylemResultController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *level;
@property (weak, nonatomic) IBOutlet UILabel *points;

@property (weak, nonatomic) IBOutlet UITextView *mainText;

- (IBAction) goBackToMeydan:(id)sender;
- (IBAction) goBack:(id)sender;

@end
