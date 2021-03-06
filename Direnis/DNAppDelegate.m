//
//  DNAppDelegate.m
//  Direnis
//
//  Created by Ali Can Bülbül on 6/10/13.
//  Copyright (c) 2013 Can Bülbül. All rights reserved.
//

#import "DNAppDelegate.h"
#import "DNPlayer.h"

@implementation DNAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    self.player = [DNPlayer load];
    self.city = [[NSUserDefaults standardUserDefaults] stringForKey:@"city"];
    
    //read plists into a dictionary
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Database" ofType:@"plist"];
    self.database = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    path = [[NSBundle mainBundle] pathForResource:@"shop" ofType:@"plist"];
    self.shopItems = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
    
    if([[NSUserDefaults standardUserDefaults] objectForKey:@"scores"]==nil){
        [[NSUserDefaults standardUserDefaults] setObject:@[] forKey:@"scores"];
    }
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    [DNPlayer save:self.player];
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    [DNPlayer save:self.player];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    self.player = [DNPlayer load];
    [[NSUserDefaults standardUserDefaults] stringForKey:@"city"];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    [[self.window rootViewController].navigationController popToRootViewControllerAnimated:NO];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    [DNPlayer save:self.player];
    [[NSUserDefaults standardUserDefaults] setObject:self.city forKey:@"city"];
}

@end
