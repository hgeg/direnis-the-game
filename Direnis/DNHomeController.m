//
//  DNHomeController.m
//  Direnis
//
//  Created by Ali Can Bülbül on 6/15/13.
//  Copyright (c) 2013 Can Bülbül. All rights reserved.
//

#import "DNHomeController.h"
#import "DNAppDelegate.h"
#import "DNPlayer.h"

#define player ((DNAppDelegate *)[UIApplication sharedApplication].delegate).player
#define city ((DNAppDelegate *)[UIApplication sharedApplication].delegate).city


@interface DNHomeController ()

@end

@implementation DNHomeController

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

@end
