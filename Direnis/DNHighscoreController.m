//
//  DNHighscoreController.m
//  Direnis
//
//  Created by Ali Can Bülbül on 6/25/13.
//  Copyright (c) 2013 Can Bülbül. All rights reserved.
//

#import "DNHighscoreController.h"

@implementation DNHighscoreController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    items = [[NSUserDefaults standardUserDefaults] objectForKey:@"scores"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    
    NSDictionary *item = items[indexPath.row];
    cell = [tableView dequeueReusableCellWithIdentifier:@"list"];
    ((UILabel *)[cell viewWithTag:1]).text = [NSString stringWithFormat:@"%d.",indexPath.row+1];
    ((UILabel *)[cell viewWithTag:2]).text = item[@"name"];
    ((UILabel *)[cell viewWithTag:3]).text = item[@"score"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (IBAction)goBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
