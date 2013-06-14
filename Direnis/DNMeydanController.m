//
//  DNMeydanController.m
//  Direnis
//
//  Created by Ali Can Bülbül on 6/15/13.
//  Copyright (c) 2013 Can Bülbül. All rights reserved.
//

#import "DNMeydanController.h"
#import "DNAppDelegate.h"
#import "DNPlayer.h"

#define player ((DNAppDelegate *)[UIApplication sharedApplication].delegate).player
#define city ((DNAppDelegate *)[UIApplication sharedApplication].delegate).city
#define database ((DNAppDelegate *)[UIApplication sharedApplication].delegate).database

@interface DNMeydanController ()

@end

@implementation DNMeydanController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSArray *meydans = [database[city] allKeys];
    NSLog(@"%@",meydans);
    self.m1.titleLabel.text = meydans[0];
    self.m2.titleLabel.text = meydans[1];
    self.m3.titleLabel.text = meydans[2];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSArray *meydans = [database[city] allKeys];
    if([segue.identifier isEqualToString:@"m1"]){
        [player setLocation:meydans[0]];
    }else if([segue.identifier isEqualToString:@"m2"]){
        [player setLocation:meydans[1]];
    }else if([segue.identifier isEqualToString:@"m3"]){
        [player setLocation:meydans[2]];
    }
}

@end
