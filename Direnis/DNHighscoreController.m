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
    NSMutableArray *scores = [NSMutableArray arrayWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:@"scores"]];
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
    items = scores;
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
    ((UILabel *)[cell viewWithTag:3]).text = [NSString stringWithFormat:@"%d",[item[@"score"] integerValue]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (IBAction)goBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
