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

#define sections @[@"Eldivenler",@"Destek Malzemeleri",@"Maskeler"]

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
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger)
numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [items[sections[section]] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"item"];
    
    NSDictionary *item = items[ sections[indexPath.section] ][indexPath.row];
    
    ((UIImageView *)[cell viewWithTag:1]).image = [UIImage imageNamed: [NSString stringWithFormat:@"%@.jpg",item[@"Name"]]];
    ((UILabel *)[cell viewWithTag:2]).text = item[@"Name"];
    ((UILabel *)[cell viewWithTag:3]).text = [NSString stringWithFormat:@"Fiyat: %@ Puan",item[@"Value"]];
    
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return sections[section];
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}


@end
