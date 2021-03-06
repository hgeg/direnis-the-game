//
//  DNEylemResultController.h
//  Direnis
//
//  Created by Ali Can Bülbül on 6/15/13.
//  Copyright (c) 2013 Can Bülbül. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DNStatusView;

@interface DNEylemResultController : UIViewController <UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *level;
@property (weak, nonatomic) IBOutlet UILabel *points;

@property (weak, nonatomic) IBOutlet UITextView *mainText;
@property (weak, nonatomic) IBOutlet DNStatusView *status;
@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) UIImage *backgroundImage;

@property (weak, nonatomic) IBOutlet UIImageView *background;

- (IBAction) goBackToMeydan:(id)sender;
- (IBAction) goBack:(id)sender;

@end