//
//  DNPlayer.m
//  Direnis
//
//  Created by Ali Can Bülbül on 6/10/13.
//  Copyright (c) 2013 Can Bülbül. All rights reserved.
//

#import "DNPlayer.h"
#import "DNAppDelegate.h"

@implementation DNPlayer

- (id) init {
    
    self = [super init];
    
    if(self){
        //set attributes
        level  = 1;
        xp     = 0;
        points = 500;
        items  = [NSMutableDictionary dictionaryWithCapacity:10];
        current = @"ev";
    }
    return self;
}


- (void) endTurn{}

- (void) addPoints:(int)p{
    points += p;
    [self endTurn];
}
- (void) addXP:(int)x {
    xp += x;
    if(xp>100) {
        level++;
        xp %= 100;
    }
}
- (void) setLocation:(NSString *)location {
    current = location;
}
- (void) passTime:(int)hours {
    time = [time dateByAddingTimeInterval:hours*3600];
}
- (NSMutableDictionary *) getItems {
    return items;
}

- (void) addItem:(NSString *)item forKey:(NSString *)key{
    items[key] = item;
}

- (void) setName:(NSString *)n {
    name = n;
}

- (NSString *) getName {
    return name;
}

- (NSString *) getLocation {
    return current;
}

- (int) getAttrribute:(NSString *)attr {
    if([attr isEqualToString:@"level"]) return level;
    if([attr isEqualToString:@"xo"]) return xp;
    if([attr isEqualToString:@"points"]) return points;
    return -1;
}

- (NSString *) getDate {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd MMM EEEE"];
    return [formatter stringFromDate:time];
}

@end