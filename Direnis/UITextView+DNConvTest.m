//
//  UITextView+DNConvTest.m
//  Direnis
//
//  Created by Ali Can Bülbül on 6/22/13.
//  Copyright (c) 2013 Can Bülbül. All rights reserved.
//

#import "UITextView+DNConvTest.h"

@implementation UITextView (DNConvTest)

- (void) setTextN:(NSString *)text {
    [self setText:[text stringByReplacingOccurrencesOfString:@"i" withString:@"İ"]];
    [self setFont:[UIFont fontWithName:@"BebasNeue" size:20]];
}

@end
