//
//  DNPlayer.m
//  Direnis
//
//  Created by Ali Can Bülbül on 6/10/13.
//  Copyright (c) 2013 Can Bülbül. All rights reserved.
//

#import "DNPlayer.h"

@implementation DNPlayer

- (id) init {
    
    self = [super init];
    
    if(self){
        //distribute stats
        int n = 10;
        str = arc4random_uniform(n-4);
        n -= str;
        con = arc4random_uniform(n-2);
        n -= con;
        iq = n;
        
        //set attributes
        health = con*2+str;
        level  = 1;
        xp     = 0;
        points = 10;
        items  = [NSMutableDictionary dictionaryWithCapacity:10];
        current = @"ev";
    }
    return self;
}

@end
