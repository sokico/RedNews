//
//  RNWebViewController.m
//  RedNews
//
//  Created by Sohel Dadia on 8/19/12.
//  Copyright (c) 2012 Sohel Dadia. All rights reserved.
//

#import "RNWebViewController.h"

@interface RNWebViewController ()

@end

@implementation RNWebViewController

#pragma mark • Initialization
-(id) initWithURLString:(NSString *) inURLString; {
	self = [super init];
	if (self) {
		url = [[NSURL URLWithString:inURLString] retain];
	}
	return self;
}

- (id) initWithURL:(NSURL *)inURL {
	self = [super init];
	if (self) {
		url = [inURL retain];
	}
	return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark • View Manipulations
- (void) loadView
{
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
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
    NSURL *baseURL = [NSURL URLWithString: @"http://m.rediff.com/"];
    
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
    
    if (mDidFinishLoadBlock) {
        mDidFinishLoadBlock(inWebView);
    }
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    
}

#pragma mark • Memory Management
- (void)dealloc
{
    mWebView.delegate = nil;
    [mWebView release];
    [url release];
    [super dealloc];
}

@synthesize didFinishLoadBlock  = mDidFinishLoadBlock;
@synthesize webView             = mWebView;

@end
