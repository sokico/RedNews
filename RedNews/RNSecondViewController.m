//
//  RNSecondViewController.m
//  RedNews
//
//  Created by Sohel Dadia on 8/19/12.
//  Copyright (c) 2012 Sohel Dadia. All rights reserved.
//

#import "RNSecondViewController.h"

@interface RNSecondViewController ()

@end

@implementation RNSecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Cricket", @"Cricket");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSURL* loadURL = [NSURL URLWithString:@"http://m.rediff.com/cricket/headlines"];
    [self loadURL:loadURL];

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

#pragma mark • Load URL
- (void) loadURL:(NSURL *)urlToLoad
{
    mWebView.hidden = YES;
	[mWebView loadRequest:[NSURLRequest requestWithURL:urlToLoad]];
}


#pragma mark • UIWebView Delegate Methods
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)inWebView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    inWebView.hidden = NO;
    
    //    if (mDidFinishLoadBlock) {
    //        mDidFinishLoadBlock(inWebView);
    //    }
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    if (navigationType == UIWebViewNavigationTypeLinkClicked) {
        //Check to see if its a rediff link. If not then show it with back/forward buttons.
        
    }
    return YES;
}

#pragma mark • Memory Management
- (void)dealloc
{
    [mWebView release];
    [super dealloc];
}

@synthesize webView = mWebView;

@end
