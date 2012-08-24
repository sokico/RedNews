//
//  RNFinanceViewController.m
//  RedNews
//
//  Created by Sohel Dadia on 8/22/12.
//  Copyright (c) 2012 Sohel Dadia. All rights reserved.
//

#import "RNFinanceViewController.h"

@interface RNFinanceViewController ()

@end

@implementation RNFinanceViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"Finance", @"Money");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSURL* loadURL = [NSURL URLWithString:@"http://money.rediff.com/mobile"];
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
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark • Load Url
-(void) loadURL:(NSURL*) urlToLoad {
	[activityIndicator startAnimating];
	mWebView.hidden = YES;
	[mWebView loadRequest:[NSURLRequest requestWithURL:urlToLoad]];
}

-(void) loadURLMain: (NSString *)urlString {
    
    NSURL *urlToLoad = [NSURL URLWithString: urlString];
    NSURL *baseURL = [NSURL URLWithString: @"http://money.rediff.com/mobile"];
    
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
    
//    if (mDidFinishLoadBlock) {
//        mDidFinishLoadBlock(inWebView);
//    }
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    
}


#pragma mark • Memory Management
- (void)dealloc {
    
    mWebView.delegate = nil;
    [mWebView release];
    [super dealloc];
}

@synthesize webView = mWebView;

@end
