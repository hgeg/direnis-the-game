//
//  DNMenuController.m
//  Direnis
//
//  Created by Ali Can Bülbül on 6/15/13.
//  Copyright (c) 2013 Can Bülbül. All rights reserved.
//

#import "DNMenuController.h"
#import "DNAppDelegate.h"
#import "DNPlayer.h"

#define player ((DNAppDelegate *)[UIApplication sharedApplication].delegate).player
#define city ((DNAppDelegate *)[UIApplication sharedApplication].delegate).city

@interface DNMenuController ()

@end

@implementation DNMenuController

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

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.textField becomeFirstResponder];
    UITapGestureRecognizer *tgr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(endEdits)];
    [self.nameBackView addGestureRecognizer:tgr];
    if(player==nil)
        self.continueButton.hidden = true;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    [self performSegueWithIdentifier:@"city_select" sender:self];
    return YES;
}

- (IBAction) GoToMainMenu:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([segue.identifier isEqualToString:@"ankara"]){
        city = @"Ankara";
        [player setTime:1370003454];
        [[NSUserDefaults standardUserDefaults] setObject:@"Ankara" forKey:@"city"];
    }else if([segue.identifier isEqualToString:@"istanbul"]){
        city = @"İstanbul";
        [player setTime:1369755054];
        [[NSUserDefaults standardUserDefaults] setObject:@"İstanbul" forKey:@"city"];
    }
    if([segue.identifier isEqualToString:@"new_game"]){
        if (player != nil) {
            NSMutableArray *scores = [NSMutableArray arrayWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:@"scores"]];
            [scores addObject:@{@"name":[player getName],@"score":[player getCumulativeScore]}];
            [scores sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
                int value1 = [((NSDictionary *)obj1)[@"score"] integerValue];
                int value2 = [((NSDictionary *)obj2)[@"score"] integerValue];
                if (value1 > value2)
                {
                    return (NSComparisonResult)NSOrderedAscending;
                }
                
                if (value1 < value2)
                {
                    return (NSComparisonResult)NSOrderedDescending;
                }
                return (NSComparisonResult)NSOrderedSame;
            }];
            if ([scores count]>10) [scores subarrayWithRange:NSMakeRange(0, 10)];
            [[NSUserDefaults standardUserDefaults] setObject:scores forKey:@"scores"];
        }
        player = [[DNPlayer alloc] init];
    }else if([segue.identifier isEqualToString:@"continue"]){
        player = [DNPlayer load];
    }else if ([segue.identifier isEqualToString:@"city_select"]){
        [player setName:self.textField.text];
        [DNPlayer save:player];
    }
}

- (IBAction)textChanged:(id)sender{
    if(self.textField.text.length>50)
        self.textField.text = [self.textField.text substringToIndex:50];
    self.textField.text = [self.textField.text stringByReplacingOccurrencesOfString:@"i" withString:@"İ"];
}

- (void) endEdits {
    [self.textField resignFirstResponder];
}

@end
