//
//  DNEylemResultController.m
//  Direnis
//
//  Created by Ali Can Bülbül on 6/15/13.
//  Copyright (c) 2013 Can Bülbül. All rights reserved.
//

#import "DNEylemResultController.h"

@interface DNEylemResultController ()

@end

@implementation DNEylemResultController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) goBackToMeydan:(id)sender{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction) goBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
