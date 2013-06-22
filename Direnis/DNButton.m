//
//  DNButton.m
//  Direnis
//
//  Created by Ali Can Bülbül on 6/22/13.
//  Copyright (c) 2013 Can Bülbül. All rights reserved.
//

#import "DNButton.h"

@implementation DNButton

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        UIImageView *image = [[UIImageView alloc] init];
        if (self.frame.size.height==55) {
            image.image = [UIImage imageNamed:@"button_280x55.png"];
            image.frame = CGRectMake(0, 0, 280, 55);
        }else {
            image.image = [UIImage imageNamed:@"button_280x44.png"];
            image.frame = CGRectMake(0, 0, 280, 44);
        }
        [self addSubview:image];
        [self sendSubviewToBack:image];
        self.titleLabel.font = [UIFont fontWithName:@"ArialMT" size:21];
        //self.titleLabel.text = [self.titleLabel.text stringByReplacingOccurrencesOfString:@"i" withString:@"İ"];
    }
    return self;
}

- (void) setTitle:(NSString *)title forState:(UIControlState)state {
    [super setTitle:[title stringByReplacingOccurrencesOfString:@"i" withString:@"İ"] forState:state];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
 
}*/


@end
