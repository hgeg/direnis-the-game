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
    items = [[NSUserDefaults standardUserDefaults] objectForKey:@"highscores"];
    if(items == nil) {
        
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    
    NSArray *item = items[indexPath.row];
    cell = [tableView dequeueReusableCellWithIdentifier:@"list"];
    ((UILabel *)[cell viewWithTag:1]).text = [NSString stringWithFormat:@"%d.",indexPath.row];
    ((UILabel *)[cell viewWithTag:2]).text = item[0];
    ((UILabel *)[cell viewWithTag:3]).text = [NSString stringWithFormat:@"%d",[item[1] integerValue]];
    return cell;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
