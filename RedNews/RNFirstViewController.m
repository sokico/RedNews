//
//  RNFirstViewController.m
//  RedNews
//
//  Created by Sohel Dadia on 8/19/12.
//  Copyright (c) 2012 Sohel Dadia. All rights reserved.
//

#import "RNFirstViewController.h"

@interface RNFirstViewController ()

@end

@implementation RNFirstViewController

#pragma mark • Initialization
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"News", @"News");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}
							
#pragma mark • View Manipulations
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


@end
