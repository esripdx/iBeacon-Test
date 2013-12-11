//
//  EBMainViewController.m
//  Beacon
//
//  Created by Aaron Parecki on 12/10/13.
//  Copyright (c) 2013 Esri. All rights reserved.
//

#import "EBMainViewController.h"
#import "EBAppDelegate.h"

@interface EBMainViewController ()

@end

@implementation EBMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self restoreUIState];
    [self initBeacon];
    [self transmitBeacon];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Flipside View Controller

- (void)flipsideViewControllerDidFinish:(EBFlipsideViewController *)controller
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self.flipsidePopoverController dismissPopoverAnimated:YES];
    }
}

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
    self.flipsidePopoverController = nil;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
        [[segue destinationViewController] setDelegate:self];
        
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
            UIPopoverController *popoverController = [(UIStoryboardPopoverSegue *)segue popoverController];
            self.flipsidePopoverController = popoverController;
            popoverController.delegate = self;
        }
    }
}

- (IBAction)togglePopover:(id)sender
{
    if (self.flipsidePopoverController) {
        [self.flipsidePopoverController dismissPopoverAnimated:YES];
        self.flipsidePopoverController = nil;
    } else {
        [self performSegueWithIdentifier:@"showAlternate" sender:sender];
    }
}

#pragma mark - UI

- (void)restoreUIState {
    self.uuidLabel.text = [EBAppDelegate getUUID];
    self.majorStepper.value = [EBAppDelegate majorValue];
    self.minorStepper.value = [EBAppDelegate minorValue];
    self.majorField.text = [NSString stringWithFormat:@"%.0f", round(self.majorStepper.value)];
    self.minorField.text = [NSString stringWithFormat:@"%.0f", round(self.minorStepper.value)];
}

- (IBAction)majorValueWasChanged:(id)sender {
    self.majorField.text = [NSString stringWithFormat:@"%.0f", round(self.majorStepper.value)];
    [EBAppDelegate setMajorValue:(int)self.majorStepper.value];
}

- (IBAction)minorValueWasChanged:(id)sender {
    self.minorField.text = [NSString stringWithFormat:@"%.0f", round(self.minorStepper.value)];
    [EBAppDelegate setMinorValue:(int)self.minorStepper.value];
}

- (IBAction)uuidWasPressed:(UILongPressGestureRecognizer *)sender {
    if(sender.state == UIGestureRecognizerStateBegan) {
        NSLog(@"%@", [EBAppDelegate getUUID]);
    }
}


#pragma mark - Beacon

- (void)initBeacon {
    NSUUID *uuid = [[NSUUID alloc] initWithUUIDString:[EBAppDelegate getUUID]];
    self.beaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID:uuid
                                                                major:1
                                                                minor:1
                                                           identifier:@"com.esri.pdx.beacon"];
}

- (void)transmitBeacon {
    self.beaconPeripheralData = [self.beaconRegion peripheralDataWithMeasuredPower:nil];
    self.peripheralManager = [[CBPeripheralManager alloc] initWithDelegate:self queue:nil options:nil];
}

- (void)peripheralManagerDidUpdateState:(CBPeripheralManager *)peripheral {
    if (peripheral.state == CBPeripheralManagerStatePoweredOn) {
        NSLog(@"Powered On");
        [self.peripheralManager startAdvertising:self.beaconPeripheralData];
    } else if (peripheral.state == CBPeripheralManagerStatePoweredOff) {
        NSLog(@"Powered Off");
        [self.peripheralManager stopAdvertising];
    }
}

@end
