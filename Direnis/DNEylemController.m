//
//  DNEylemController.m
//  Direnis
//
//  Created by Ali Can Bülbül on 6/15/13.
//  Copyright (c) 2013 Can Bülbül. All rights reserved.
//

#import "DNEylemController.h"
#import "DNEylemResultController.h"
#import "DNStatusView.h"
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

- (IBAction) takeAction:(id)sender{
    
}
- (IBAction) goBackToMeydan:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSArray *sorular = database[city][[player getLocation]][[player getHourInterval]];
    sIndex = arc4random_uniform([sorular count]);
    NSDictionary *soru = sorular[sIndex];
    self.mainText.text = soru[@"Soru Text"];
    [self.c1 setTitle:soru[@"Cevaplar"][0][@"Cevap Text"] forState:UIControlStateNormal];
    [self.c1 sizeToFit];
    [self.c2 setTitle:soru[@"Cevaplar"][1][@"Cevap Text"] forState:UIControlStateNormal];
    [self.c1 sizeToFit];
    
    [self.status redraw];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSArray *sorular = database[city][[player getLocation]][[player getHourInterval]];
    DNEylemResultController *d = (DNEylemResultController *)segue.destinationViewController;
    NSDictionary *soru = sorular[sIndex];
    if ([segue.identifier isEqualToString:@"c1"]) {
        NSDictionary *cevab = soru[@"Cevaplar"][0];
        int rand = arc4random_uniform(100)+1;
        if ([cevab[@"Zorluk"] integerValue]<rand){
            NSDictionary *result = cevab[@"Success"];
            d.text = result[@"Text"];
            [player addToAttrribute:@"xp" value:[result[@"Result"][@"XP"] integerValue]];
            [player addToAttrribute:@"points" value:[result[@"Result"][@"Point"] integerValue]];
        }else{
            NSDictionary *result = cevab[@"Fail"];
            d.text = result[@"Text"];
            [player addToAttrribute:@"xp" value:-1*[result[@"Result"][@"XP"] integerValue]];
            [player addToAttrribute:@"points" value:-1*[result[@"Result"][@"Point"] integerValue]];
        }
                
    }else if([segue.identifier isEqualToString:@"c2"]) {
        NSDictionary *cevab = soru[@"Cevaplar"][1];
        int rand = arc4random_uniform(100)+1;
        if ([cevab[@"Zorluk"] integerValue]<rand){
            NSDictionary *result = cevab[@"Success"];
            d.text = result[@"Text"];
            [player addToAttrribute:@"xp" value:[result[@"Result"][@"XP"] integerValue]];
            [player addToAttrribute:@"points" value:[result[@"Result"][@"Point"] integerValue]];
        }else{
            NSDictionary *result = cevab[@"Fail"];
            d.text = result[@"Text"];
            [player addToAttrribute:@"xp" value:-1*[result[@"Result"][@"XP"] integerValue]];
            [player addToAttrribute:@"points" value:-1*[result[@"Result"][@"Point"] integerValue]];
        }
    }
}

@end
