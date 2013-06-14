//
//  DNMenuController.h
//  Direnis
//
//  Created by Ali Can Bülbül on 6/15/13.
//  Copyright (c) 2013 Can Bülbül. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DNMenuController : UIViewController <UITextFieldDelegate>

- (BOOL) textFieldShouldReturn:(UITextField *)textField;
- (IBAction) GoToMainMenu:(id)sender;

@end
