//
//  UIImageView+Shuffle.m
//  Direnis
//
//  Created by Ali Can Bülbül on 6/22/13.
//  Copyright (c) 2013 Can Bülbül. All rights reserved.
//

#import "UIImageView+Shuffle.h"

@implementation UIImageView (Shuffle)

- (void) shuffle {
    int m = arc4random_uniform(70)+1;
    self.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",m]];
}

@end
