//
//  DNEylemController.m
//  Direnis
//
//  Created by Ali Can Bülbül on 6/15/13.
//  Copyright (c) 2013 Can Bülbül. All rights reserved.
//

#import "DNEylemController.h"
#import "DNEylemResultController.h"
#import "UITextView+DNConvTest.h"
#import "UIImageView+Shuffle.h"
#import "DNStatusView.h"
#import "DNAppDelegate.h"
#import "DNPlayer.h"

#define cat @{@"Eldiven":@0,@"İlaç":@1,@"Maske":@2}
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
    NSArray *sorular;
    rand = arc4random_uniform(100);
    if(rand){
        sorular = database[city][[player getLocation]][[player getHourInterval]];
    }else if([sorular count]>3){
        sorular = [database[city][[player getLocation]][[player getHourInterval]] arrayByAddingObjectsFromArray:database[city][[player getLocation]][@"Zamansız"]];
    }
    sIndex = arc4random_uniform([sorular count]);
    NSDictionary *soru = sorular[sIndex];
    [self.mainText setTextN:soru[@"Soru Text"]];
    [self.c1 setTitle:soru[@"Cevaplar"][0][@"Cevap Text"] forState:UIControlStateNormal];
    [self.c1 sizeToFit];
    [self.c2 setTitle:soru[@"Cevaplar"][1][@"Cevap Text"] forState:UIControlStateNormal];
    [self.c1 sizeToFit];
    
    [self.background shuffle];
    
    [self.status redraw];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"shop"]) {
        [[NSUserDefaults standardUserDefaults] setValue:[player getLocation] forKey:@"lastplace"];
        return;
    }
    NSLog(@"%@",[player getItems]);
    NSArray *sorular;
    if(rand<80){
        sorular = database[city][[player getLocation]][[player getHourInterval]];
    }else if([sorular count]>3){
        sorular = [database[city][[player getLocation]][[player getHourInterval]] arrayByAddingObjectsFromArray:database[city][[player getLocation]][@"Zamansız"]];
    }
    DNEylemResultController *d = (DNEylemResultController *)segue.destinationViewController;
    d.backgroundImage = self.background.image;
    NSDictionary *soru = sorular[sIndex];
    if ([segue.identifier isEqualToString:@"c1"]) {
        NSDictionary *cevab = soru[@"Cevaplar"][0];
        float itemPower = 0.6;
        if (((NSString *)cevab[@"Item"]).length>0) {
            if([[player getItems][[cat[cevab[@"Item"]] intValue]][@"Name"] isEqualToString:@"None"])
                itemPower = -200;
            else
                itemPower = [[player getItems][[cat[cevab[@"Item"]] intValue]][@"Power"] floatValue];
        }
        int random = arc4random_uniform(100)+1;
        if ([cevab[@"Zorluk"] integerValue]<random+[player getAttrribute:@"level"]*itemPower/2.0){
            NSDictionary *result = cevab[@"Success"];
            [player addToAttrribute:@"xp" value:[result[@"Result"][@"XP"] integerValue]];
            [player addToAttrribute:@"points" value:[result[@"Result"][@"Point"] integerValue]];
            if([cat[cevab[@"Item"]] isEqual:@1] && ![[player getItems][[cat[cevab[@"Item"]] intValue]][@"Name"] isEqualToString:@"None"])
                [player addItem:@{@"Name":@"None"} toCategory:1];
            d.text = [NSString stringWithFormat:@"%@\n\n%@\n%@",result[@"Text"],
                      [result[@"Result"][@"XP"]integerValue]>0?[NSString stringWithFormat:@"+%d XP",[result[@"Result"][@"XP"] integerValue]]:@"",
                      [result[@"Result"][@"Point"]integerValue]>0?[NSString stringWithFormat:@"+%d Puan",[result[@"Result"][@"Point"] integerValue]]:@""];
        }else{
            NSDictionary *result = cevab[@"Fail"];
            [player addToAttrribute:@"points" value:-1*[result[@"Result"][@"Point"] integerValue]];
            d.text = [NSString stringWithFormat:@"%@\n\n%@",result[@"Text"],
                      [result[@"Result"][@"Point"]integerValue]>0?[NSString stringWithFormat:@"-%d Puan",[result[@"Result"][@"Point"] integerValue]]:@""];
        }
                
    }else if([segue.identifier isEqualToString:@"c2"]) {
        NSDictionary *cevab = soru[@"Cevaplar"][1];
        float itemPower = 0.6;
        if (((NSString *)cevab[@"Item"]).length>0) {
            if([[player getItems][[cat[cevab[@"Item"]] intValue]][@"Name"] isEqualToString:@"None"])
                itemPower = -200;
            else
                itemPower = [[player getItems][[cat[cevab[@"Item"]] intValue]][@"Power"] floatValue];
        }
        int random = arc4random_uniform(100)+1;
        if ([cevab[@"Zorluk"] integerValue]<random+[player getAttrribute:@"level"]*itemPower/2.0){
            NSDictionary *result = cevab[@"Success"];
            [player addToAttrribute:@"xp" value:[result[@"Result"][@"XP"] integerValue]];
            [player addToAttrribute:@"points" value:[result[@"Result"][@"Point"] integerValue]];
            if([cat[cevab[@"Item"]] isEqual:@1] && ![[player getItems][[cat[cevab[@"Item"]] intValue]][@"Name"] isEqualToString:@"None"]){
                [player addItem:@{@"Name":@"None"} toCategory:1];
            }
            d.text = [NSString stringWithFormat:@"%@\n\n%@\n%@",result[@"Text"],
                      [result[@"Result"][@"XP"]integerValue]>0?[NSString stringWithFormat:@"+%d XP",[result[@"Result"][@"XP"] integerValue]]:@"",
                      [result[@"Result"][@"Point"]integerValue]>0?[NSString stringWithFormat:@"+%d Puan",[result[@"Result"][@"Point"] integerValue]]:@""];
        }else{
            NSDictionary *result = cevab[@"Fail"];
            [player addToAttrribute:@"points" value:-1*[result[@"Result"][@"Point"] integerValue]];
            d.text = [NSString stringWithFormat:@"%@\n\n%@",result[@"Text"],
                      [result[@"Result"][@"Point"]integerValue]>0?[NSString stringWithFormat:@"-%d Puan",[result[@"Result"][@"Point"] integerValue]]:@""];
        }
    }
}

@end
