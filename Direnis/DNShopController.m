//
//  DNShopController.m
//  Direnis
//
//  Created by Ali Can Bülbül on 6/15/13.
//  Copyright (c) 2013 Can Bülbül. All rights reserved.
//

#import "DNShopController.h"
#import "DNAppDelegate.h"
#import "DNStatusView.h"
#import "DNPlayer.h"

#define player ((DNAppDelegate *)[UIApplication sharedApplication].delegate).player
#define city ((DNAppDelegate *)[UIApplication sharedApplication].delegate).city
#define database ((DNAppDelegate *)[UIApplication sharedApplication].delegate).database
#define items ((DNAppDelegate *)[UIApplication sharedApplication].delegate).shopItems

#define sections @[@"Destek Malzemeleri",@"Maskeler",@"Eldivenler"]

@interface DNShopController ()

@end

@implementation DNShopController

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

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [player setLocation:@"Dükkan"];
    [self.status redraw];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goBack:(id)sender {
    [player setLocation:[[NSUserDefaults standardUserDefaults] valueForKey:@"lastplace"]];
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [items[sections[section]] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"item"];
    
    NSDictionary *item = items[sections[indexPath.section]][indexPath.row];
    NSDictionary *ptem = [player getItems][indexPath.section];
    
    ((UIImageView *)[cell viewWithTag:1]).image = [UIImage imageNamed: [NSString stringWithFormat:@"%@.jpg",item[@"Name"]]];
    ((UILabel *)[cell viewWithTag:2]).text = [item[@"Name"] stringByReplacingOccurrencesOfString:@"i" withString:@"İ"];
    if([ptem[@"Name"] isEqualToString:item[@"Name"]]){
        ((UILabel *)[cell viewWithTag:3]).text = @"Alındı";
    }else
        ((UILabel *)[cell viewWithTag:3]).text = [NSString stringWithFormat:@"Fİyat: %@ Puan",item[@"Value"]];
    
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return sections[section];
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *item = items[sections[indexPath.section]][indexPath.row];
    NSDictionary *ptem = [player getItems][indexPath.section];
    if([ptem[@"Name"] isEqualToString:item[@"Name"]]) {
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
        return;
    }
    if([item[@"Value"] integerValue]<[player getAttrribute:@"points"]){
        [player addItem:item toCategory:indexPath.section];
        [player addToAttrribute:@"points" value:-1*[item[@"Value"] integerValue]];
        [tableView reloadData];
        [self.status redraw];
    }else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Yetersiz Puan" message:@"Puanınız bu ürünü almaya yeterli değil." delegate:self cancelButtonTitle:@"Tamam" otherButtonTitles:nil];
        [alert show];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
}


@end
