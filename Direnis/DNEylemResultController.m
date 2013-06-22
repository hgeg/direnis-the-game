//
//  DNEylemResultController.m
//  Direnis
//
//  Created by Ali Can Bülbül on 6/15/13.
//  Copyright (c) 2013 Can Bülbül. All rights reserved.
//

#import "DNEylemResultController.h"
#import "UITextView+DNConvTest.h"
#import "DNStatusView.h"
#import "DNAppDelegate.h"
#import "DNPlayer.h"

#define player ((DNAppDelegate *)[UIApplication sharedApplication].delegate).player
#define city ((DNAppDelegate *)[UIApplication sharedApplication].delegate).city
#define database ((DNAppDelegate *)[UIApplication sharedApplication].delegate).database


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
    [self.navigationController popViewControllerAnimated:YES];
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.mainText setTextN:self.text];
    self.background.image = self.backgroundImage;
    if ([player getAttrribute:@"points"]<=0) {
        [player addToAttrribute:@"points" value:[player getAttrribute:@"points"]*-1];
        self.mainText.text = [NSString stringWithFormat:@"%@\n Puanın bittiği için oyun bitti.",self.mainText.text];
    }
    [self.status redraw];
}

- (IBAction) goBack:(id)sender{
    if ([player getAttrribute:@"points"]<=0) {
        player = nil;
        [DNPlayer save:player];
        [self.navigationController popToRootViewControllerAnimated:YES];
    }else{
        [player passTime:1];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

@end
