//
//  DNHomeController.m
//  Direnis
//
//  Created by Ali Can Bülbül on 6/15/13.
//  Copyright (c) 2013 Can Bülbül. All rights reserved.
//

#import "DNHomeController.h"
#import "DNStatusView.h"
#import "DNAppDelegate.h"
#import "DNPlayer.h"

#define player ((DNAppDelegate *)[UIApplication sharedApplication].delegate).player
#define city ((DNAppDelegate *)[UIApplication sharedApplication].delegate).city


@interface DNHomeController ()

@end

@implementation DNHomeController

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
    self.nameLabel.text = [player getName];
	// Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    [player setLocation:@"Ev"];
    [[NSUserDefaults standardUserDefaults] setValue:[player getLocation] forKey:@"lastplace"];
    [super viewWillAppear:animated];
    [self.items reloadData];
    [self.status redraw];
}

- (IBAction) passTime:(id)sender {
    if([player getHour]==6){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Dinlen" message:@"bu saatten sonra iyice dinlenip gücünü toparlaman daha iyi olur." delegate:self cancelButtonTitle:@"Uyu" otherButtonTitles:nil];
        [alert show];
    }else{
        [player passTime:1];
    }
    if ([player getAttrribute:@"points"]<100) {
        [player addToAttrribute:@"points" value:[player getAttrribute:@"points"]<95?5:100-[player getAttrribute:@"points"]];
    }
    [self.status redraw];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [player getItems].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    
    NSDictionary *item = [player getItems][indexPath.row];
    if ([item[@"Name"] isEqualToString:@"None"]) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"none"];
        return cell;
    }
    cell = [tableView dequeueReusableCellWithIdentifier:@"item"];
    
    ((UIImageView *)[cell viewWithTag:1]).image = [UIImage imageNamed: [NSString stringWithFormat:@"%@.jpg",item[@"Name"]]];
    ((UILabel *)[cell viewWithTag:2]).text = [item[@"Name"] stringByReplacingOccurrencesOfString:@"i" withString:@"İ"];
    ((UILabel *)[cell viewWithTag:3]).text = [NSString stringWithFormat:@"Güç: %@",item[@"Power"]];
    
    return cell;
}

- (void) alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
    [player passTime:8];
    if ([player getAttrribute:@"points"]<100) [player addToAttrribute:@"points" value:100-[player getAttrribute:@"points"]];
    [self.status redraw];
}

- (IBAction) goBackToMainMenu:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
