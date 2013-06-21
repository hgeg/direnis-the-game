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
    NSLog(@"%@",[player getItems]);
    NSArray *sorular = [database[city][[player getLocation]][[player getHourInterval]] arrayByAddingObjectsFromArray:database[city][[player getLocation]][@"Zamansız"]] ;
    DNEylemResultController *d = (DNEylemResultController *)segue.destinationViewController;
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
        int rand = arc4random_uniform(100)+1;
        NSLog(@"%d < %.2f, rand: %d - level: %d - itemPower: %.2f",[cevab[@"Zorluk"] integerValue],rand+[player getAttrribute:@"level"]*itemPower/2.0,rand,[player getAttrribute:@"level"],itemPower);
        if ([cevab[@"Zorluk"] integerValue]<rand+[player getAttrribute:@"level"]*itemPower/2.0){
            NSDictionary *result = cevab[@"Success"];
            d.text = result[@"Text"];
            [player addToAttrribute:@"xp" value:[result[@"Result"][@"XP"] integerValue]];
            [player addToAttrribute:@"points" value:[result[@"Result"][@"Point"] integerValue]];
            if([cat[cevab[@"Item"]] isEqual:@1] && ![[player getItems][[cat[cevab[@"Item"]] intValue]][@"Name"] isEqualToString:@"None"])
                [player addItem:@{@"Name":@"None"} toCategory:1];
        }else{
            NSDictionary *result = cevab[@"Fail"];
            d.text = result[@"Text"];
            [player addToAttrribute:@"points" value:-1*[result[@"Result"][@"Point"] integerValue]];
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
        int rand = arc4random_uniform(100)+1;
        NSLog(@"%d < %.2f, rand: %d - level: %d - itemPower: %.2f",[cevab[@"Zorluk"] integerValue],rand+[player getAttrribute:@"level"]*itemPower/2.0,rand,[player getAttrribute:@"level"],itemPower);
        if ([cevab[@"Zorluk"] integerValue]<rand+[player getAttrribute:@"level"]*itemPower/2.0){
            NSDictionary *result = cevab[@"Success"];
            d.text = result[@"Text"];
            [player addToAttrribute:@"xp" value:[result[@"Result"][@"XP"] integerValue]];
            [player addToAttrribute:@"points" value:[result[@"Result"][@"Point"] integerValue]];
            if([cat[cevab[@"Item"]] isEqual:@1] && ![[player getItems][[cat[cevab[@"Item"]] intValue]][@"Name"] isEqualToString:@"None"])
                [player addItem:@{@"Name":@"None"} toCategory:1];
        }else{
            NSDictionary *result = cevab[@"Fail"];
            d.text = result[@"Text"];
            [player addToAttrribute:@"points" value:-1*[result[@"Result"][@"Point"] integerValue]];
        }
    }
}

@end
