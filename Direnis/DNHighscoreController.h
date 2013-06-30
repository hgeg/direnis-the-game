//
//  DNHighscoreController.h
//  Direnis
//
//  Created by Ali Can Bülbül on 6/25/13.
//  Copyright (c) 2013 Can Bülbül. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DNHighscoreController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    NSArray *items;
}

- (IBAction)goBack:(id)sender;

@end
