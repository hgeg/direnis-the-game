//
//  DNStatusView.m
//  Direnis
//
//  Created by Ali Can Bülbül on 6/15/13.
//  Copyright (c) 2013 Can Bülbül. All rights reserved.
//

#import "DNStatusView.h"
#import "DNAppDelegate.h"
#import "DNPlayer.h"

#define player ((DNAppDelegate *)[UIApplication sharedApplication].delegate).player
#define city ((DNAppDelegate *)[UIApplication sharedApplication].delegate).city


@implementation DNStatusView

- (id) initWithCoder:(NSCoder *)aDecoder {
    NSLog(@"memeler");
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.timeLabel.text = [player getDate];
        self.locationLabel.text  = [player getLocation];
        self.levelLabel.text = [NSString stringWithFormat:@"%d",[player getAttrribute:@"level"]];
        self.pointLabel.text = [NSString stringWithFormat:@"%d",[player getAttrribute:@"points"]];
    }
    return self;
}

- (void) redraw {
    self.timeLabel.text = [player getDate];
    self.locationLabel.text  = [player getLocation];
    self.levelLabel.text = [NSString stringWithFormat:@"%d",[player getAttrribute:@"level"]];
    self.pointLabel.text = [NSString stringWithFormat:@"%d",[player getAttrribute:@"points"]];
    [self setNeedsDisplay];
}

/*
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
}*/

@end
