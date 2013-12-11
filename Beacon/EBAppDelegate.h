//
//  EBAppDelegate.h
//  Beacon
//
//  Created by Aaron Parecki on 12/10/13.
//  Copyright (c) 2013 Esri. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EBAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

+ (NSString *)getUUID;
+ (void)setMajorValue:(NSInteger)value;
+ (void)setMinorValue:(NSInteger)value;
+ (NSInteger)majorValue;
+ (NSInteger)minorValue;

@end
