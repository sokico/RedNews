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
        self.title = NSLocalizedString(@"Movies", @"Movies");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSURL* loadURL = [NSURL URLWithString:@"http://m.rediff.com/movies/headlines"];
    [self loadURL:loadURL];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark • Load Url
-(void) loadURL:(NSURL*) urlToLoad {
	[activityIndicator startAnimating];
	mWebView.hidden = YES;
	[mWebView loadRequest:[NSURLRequest requestWithURL:urlToLoad]];
}

-(void) loadURLMain: (NSString *)urlString {
    
    NSURL *urlToLoad = [NSURL URLWithString: urlString];
    NSURL *baseURL = [NSURL URLWithString: @"http://m.rediff.com/movies/headlines"];
    
    NSData *data = [NSData dataWithContentsOfURL: urlToLoad];
    [mWebView loadData: data MIMEType: @"text/html" textEncodingName: @"utf-8" baseURL: baseURL];
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
    [activityIndicator stopAnimating];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    
}


#pragma mark • Memory Management
- (void)dealloc
{
    mWebView.delegate = nil;
    [mWebView release];
    [super dealloc];
}

@synthesize webView = mWebView;

@end
