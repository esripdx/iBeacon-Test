//
//  EBMainViewController.h
//  Beacon
//
//  Created by Aaron Parecki on 12/10/13.
//  Copyright (c) 2013 Esri. All rights reserved.
//

#import "EBFlipsideViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface EBMainViewController : UIViewController <EBFlipsideViewControllerDelegate, UIPopoverControllerDelegate, CBPeripheralManagerDelegate, MFMailComposeViewControllerDelegate>

@property (strong, nonatomic) UIPopoverController *flipsidePopoverController;

@property (strong, nonatomic) CLBeaconRegion *beaconRegion;
@property (strong, nonatomic) NSDictionary *beaconPeripheralData;
@property (strong, nonatomic) CBPeripheralManager *peripheralManager;

@property (strong, nonatomic) IBOutlet UILabel *uuidLabel;
@property (strong, nonatomic) IBOutlet UILabel *majorField;
@property (strong, nonatomic) IBOutlet UILabel *minorField;
@property (strong, nonatomic) IBOutlet UIStepper *majorStepper;
@property (strong, nonatomic) IBOutlet UIStepper *minorStepper;

- (IBAction)majorValueWasChanged:(id)sender;
- (IBAction)minorValueWasChanged:(id)sender;
- (IBAction)uuidWasPressed:(id)sender;

@end
