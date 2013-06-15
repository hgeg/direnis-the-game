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
    NSMutableDictionary *items;
    NSDate *time;
    NSString *current;
}

- (id) init;
- (void) endTurn;
- (void) addPoints:(int)p;
- (void) addXP:(int)x;
- (void) setLocation:(NSString *)location;
- (void) passTime:(int)hours;
- (void) addItem:(NSString *)item forKey:(NSString *) key;
- (void) addToAttrribute:(NSString *)attr value:(int)value;
- (void) setName:(NSString *)n;
- (NSMutableDictionary *) getItems;
- (NSString *) getName;
- (NSString *) getLocation;
- (int) getAttrribute:(NSString *)attr;
- (NSString *) getDate;
- (NSString *) getHourInterval;

+ (void)save:(DNPlayer *)obj;
+ (DNPlayer *)load;



@end
