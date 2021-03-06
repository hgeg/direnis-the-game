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
        points = 200;
        cumPoints = 200;
        items  = [NSMutableArray arrayWithArray:@[@{@"Name": @"None"},@{@"Name": @"None"},@{@"Name": @"None"}]];
        current = @"Ev";
        time = [NSDate dateWithTimeIntervalSince1970:1371490589];
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
    if(xp>100+(level*level)) {
        level++;
        xp %= 100;
    }
}
- (void) setLocation:(NSString *)location {
    current = location;
}

- (void) passTime:(float)hours {
    time = [time dateByAddingTimeInterval:hours*3600];
}

- (void) setTime:(int) timestamp {
    time = [NSDate dateWithTimeIntervalSince1970:timestamp];
}

- (NSMutableArray *) getItems {
    return items;
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

- (void) addItem:(NSDictionary *)item toCategory:(int)category {
    items[category] = item;
    medCount = [item[@"Power"] integerValue];
}

- (int) getAttrribute:(NSString *)attr {
    if([attr isEqualToString:@"level"]) return level;
    if([attr isEqualToString:@"xp"]) return xp;
    if([attr isEqualToString:@"points"]) return points;
    return -1;
}

- (void) addToAttrribute:(NSString *)attr value:(int)value{
    if([attr isEqualToString:@"level"]) level+=value;
    if([attr isEqualToString:@"xp"]) [self addXP:value];
    if([attr isEqualToString:@"points"]) {
        points += value;
        cumPoints += value>0?value:0;
    }
}

- (NSString *) getDate {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"tr"]];
    [formatter setDateFormat:@"dd MMMM EEEE, HH:mm"];
    return [[formatter stringFromDate:time] stringByReplacingOccurrencesOfString:@"i" withString:@"İ"];
}

- (int) getHour {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH"];
    return [[formatter stringFromDate:time] integerValue];
}

- (NSString *) getHourInterval {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH"];
    int hour = [[formatter stringFromDate:time] integerValue];
    NSString *interval = @"";
    if (hour>=14 && hour<18) interval = @"14-18";
    else if (hour>=18 && hour<22) interval = @"18-22";
    else if (hour>=22 || (hour>=0 && hour<02)) interval = @"22-02";
    else if (hour>=02 && hour<06) interval = @"02-06";
    else interval = @"Zamansız";
    return interval;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    //Encode properties, other class variables, etc
    [encoder encodeObject:name forKey:@"name"];
    [encoder encodeObject:time forKey:@"time"];
    [encoder encodeObject:current forKey:@"current"];
    [encoder encodeObject:items forKey:@"items"];
    
    [encoder encodeObject:[NSNumber numberWithInt:medCount] forKey:@"medc"];
    [encoder encodeObject:[NSNumber numberWithInt:level] forKey:@"level"];
    [encoder encodeObject:[NSNumber numberWithInt:xp] forKey:@"xp"];
    [encoder encodeObject:[NSNumber numberWithInt:points] forKey:@"points"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    if((self = [super init])) {
        //decode properties, other class vars
        name = [decoder decodeObjectForKey:@"name"];
        time = [decoder decodeObjectForKey:@"time"];
        items = [decoder decodeObjectForKey:@"items"];
        current = [decoder decodeObjectForKey:@"current"];
        
        medCount = [[decoder decodeObjectForKey:@"medc"] integerValue];
        level = [[decoder decodeObjectForKey:@"level"] integerValue];
        xp = [[decoder decodeObjectForKey:@"xp"] integerValue];
        points = [[decoder decodeObjectForKey:@"points"] integerValue];
    }
    return self;
}

- (int) medC {
    return medCount;
}
- (void) decMedC {
    medCount--;
}

+ (void)save:(DNPlayer *)obj {
    NSData *encoded = [NSKeyedArchiver archivedDataWithRootObject:obj];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:encoded forKey:@"player"];
    [defaults synchronize];
}

+ (DNPlayer *)load {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *myEncodedObject = [defaults objectForKey:@"player"];
    DNPlayer *obj = (DNPlayer *)[NSKeyedUnarchiver unarchiveObjectWithData: myEncodedObject];
    return obj;
}


- (NSNumber *) getCumulativeScore {
    return [NSNumber numberWithInt:cumPoints+1000*(level-1)+10*xp+(int)([time timeIntervalSinceDate:[NSDate dateWithTimeIntervalSince1970:1369755054]])%1000000/1000];
}

@end