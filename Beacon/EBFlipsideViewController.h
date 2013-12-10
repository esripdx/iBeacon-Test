//
//  EBFlipsideViewController.h
//  Beacon
//
//  Created by Aaron Parecki on 12/10/13.
//  Copyright (c) 2013 Esri. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EBFlipsideViewController;

@protocol EBFlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(EBFlipsideViewController *)controller;
@end

@interface EBFlipsideViewController : UIViewController

@property (weak, nonatomic) id <EBFlipsideViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;

@end
