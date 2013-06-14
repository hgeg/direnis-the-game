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
    int health,level,xp,points;
    int str,con,iq;
    NSMutableDictionary *items;
    NSDateComponents *time;
    NSString *current;
}

- (id) init;

@end
