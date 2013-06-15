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
    return YES;
}

- (void) textFieldDidEndEditing:(UITextField *)textField {
    [player setName:textField.text];
    [self performSegueWithIdentifier:@"city_select" sender:self];
}

- (IBAction) GoToMainMenu:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([segue.identifier isEqualToString:@"ankara"]){
        city = @"Ankara";
        [[NSUserDefaults standardUserDefaults] setObject:@"Ankara" forKey:@"city"];
    }else if([segue.identifier isEqualToString:@"istanbul"]){
        city = @"İstanbul";
        [[NSUserDefaults standardUserDefaults] setObject:@"İstanbul" forKey:@"city"];
    }
    if([segue.identifier isEqualToString:@"new_game"]){
        player = [[DNPlayer alloc] init];
    }else if([segue.identifier isEqualToString:@"continue"]){
        player = [DNPlayer load];
    }
}

@end
