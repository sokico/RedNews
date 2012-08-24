//
//  RNMoviesViewController.m
//  RedNews
//
//  Created by Sohel Dadia on 8/22/12.
//  Copyright (c) 2012 Sohel Dadia. All rights reserved.
//

#import "RNMoviesViewController.h"

@interface RNMoviesViewController ()

@end

@implementation RNMoviesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


@synthesize webView = mWebView;

@end
