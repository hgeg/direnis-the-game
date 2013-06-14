//
//  DNEylemController.m
//  Direnis
//
//  Created by Ali Can Bülbül on 6/15/13.
//  Copyright (c) 2013 Can Bülbül. All rights reserved.
//

#import "DNEylemController.h"
#import "DNAppDelegate.h"
#import "DNPlayer.h"

#define player ((DNAppDelegate *)[UIApplication sharedApplication].delegate).player
#define city ((DNAppDelegate *)[UIApplication sharedApplication].delegate).city
#define database ((DNAppDelegate *)[UIApplication sharedApplication].delegate).database

@interface DNEylemController ()

@end

@implementation DNEylemController

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

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"date: %@",[player getDate]);
    NSArray *sorular = database[city][[player getLocation]][[player getHourInterval]];
    int sIndex = arc4random_uniform([sorular count]);
    NSDictionary *soru = sorular[sIndex];
    self.mainText.text = soru[@"Soru Text"];
    self.c1.titleLabel.text = soru[@"Cevaplar"][0][@"Cevap Text"];
    self.c2.titleLabel.text = soru[@"Cevaplar"][1][@"Cevap Text"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
