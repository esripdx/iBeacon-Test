//
//  EBAppDelegate.m
//  Beacon
//
//  Created by Aaron Parecki on 12/10/13.
//  Copyright (c) 2013 Esri. All rights reserved.
//

#import "EBAppDelegate.h"

static NSString *const EBUUIDDefaultsName = @"EBUUIDDefaultsName";
static NSString *const EBMajorValueDefaultsName = @"EBMajorValueDefaultsName";
static NSString *const EBMinorValueDefaultsName = @"EBMinorValueDefaultsName";

@implementation EBAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark -

+ (NSString *)getUUID
{
    NSString *uuidString;
    
    if(!(uuidString = [[NSUserDefaults standardUserDefaults] stringForKey:EBUUIDDefaultsName])) {
        CFUUIDRef newUniqueId = CFUUIDCreate(kCFAllocatorDefault);
        uuidString = (__bridge_transfer NSString*)CFUUIDCreateString(kCFAllocatorDefault, newUniqueId);
        CFRelease(newUniqueId);
        [[NSUserDefaults standardUserDefaults] setObject:uuidString forKey:EBUUIDDefaultsName];
        [[NSUserDefaults standardUserDefaults] synchronize];
        NSLog(@"Generated new UUID: %@", uuidString);
    } else {
        NSLog(@"Returned stored UUID: %@", uuidString);
    }
    
    return uuidString;
}

+ (void)setMajorValue:(NSInteger)value {
    [[NSUserDefaults standardUserDefaults] setInteger:value forKey:EBMajorValueDefaultsName];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (void)setMinorValue:(NSInteger)value {
    [[NSUserDefaults standardUserDefaults] setInteger:value forKey:EBMinorValueDefaultsName];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSInteger)majorValue {
    return [[NSUserDefaults standardUserDefaults] integerForKey:EBMajorValueDefaultsName];
}

+ (NSInteger)minorValue {
    return [[NSUserDefaults standardUserDefaults] integerForKey:EBMinorValueDefaultsName];
}


@end
