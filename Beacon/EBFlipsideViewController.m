//
//  EBFlipsideViewController.m
//  Beacon
//
//  Created by Aaron Parecki on 12/10/13.
//  Copyright (c) 2013 Esri. All rights reserved.
//

#import "EBFlipsideViewController.h"

@interface EBFlipsideViewController ()

@end

@implementation EBFlipsideViewController

- (void)awakeFromNib
{
    self.preferredContentSize = CGSizeMake(320.0, 480.0);
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)done:(id)sender
{
    [self.delegate flipsideViewControllerDidFinish:self];
}

@end
