//
//  DNAppDelegate.h
//  Direnis
//
//  Created by Ali Can Bülbül on 6/10/13.
//  Copyright (c) 2013 Can Bülbül. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DNPlayer;

@interface DNAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSDictionary *database;
@property (strong, nonatomic) NSDictionary *shopItems;
@property (strong, nonatomic) DNPlayer *player;
@property (strong, nonatomic) NSString *city;

@end
