//
//  EBMainViewController.h
//  Beacon
//
//  Created by Aaron Parecki on 12/10/13.
//  Copyright (c) 2013 Esri. All rights reserved.
//

#import "EBFlipsideViewController.h"

@interface EBMainViewController : UIViewController <EBFlipsideViewControllerDelegate, UIPopoverControllerDelegate>

@property (strong, nonatomic) UIPopoverController *flipsidePopoverController;

@end
