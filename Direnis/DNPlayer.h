//
//  DNPlayer.h
//  Direnis
//
//  Created by Ali Can Bülbül on 6/10/13.
//  Copyright (c) 2013 Can Bülbül. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <stdlib.h>


@interface DNPlayer : NSObject
{
    NSString *name;
    int level,xp,points;
    int cumPoints;
    NSMutableArray *items;
    NSDate *time;
    NSString *current;
}

- (id) init;
- (void) endTurn;
- (void) addPoints:(int)p;
- (void) addXP:(int)x;
- (void) setLocation:(NSString *)location;
- (void) passTime:(int)hours;
- (void) setTime:(int) timestamp;
- (void) addToAttrribute:(NSString *)attr value:(int)value;
- (void) setName:(NSString *)n;
- (void) addItem:(NSDictionary *)item toCategory:(int)category;
- (NSMutableArray *) getItems;
- (NSString *) getName;
- (NSString *) getLocation;
- (int) getAttrribute:(NSString *)attr;
- (int) getHour;
- (NSString *) getDate;
- (NSString *) getHourInterval;
- (NSString *) getCumulativeScore;

+ (void)save:(DNPlayer *)obj;
+ (DNPlayer *)load;



@end
