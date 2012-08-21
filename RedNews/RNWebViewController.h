//
//  RNWebViewController.h
//  RedNews
//
//  Created by Sohel Dadia on 8/19/12.
//  Copyright (c) 2012 Sohel Dadia. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^WebViewDidFinishLoadBlock) (UIWebView* webView);

@interface RNWebViewController : UIViewController <UIWebViewDelegate>
{
    UIWebView*                      mWebView;
    UIActivityIndicatorView*        activityIndicator;
    NSURL*                          url;
    WebViewDidFinishLoadBlock       mDidFinishLoadBlock;
}

@property (nonatomic, retain) IBOutlet UIWebView*       webView;
@property (nonatomic, assign) WebViewDidFinishLoadBlock didFinishLoadBlock;

- (void) loadURL:(NSURL*) urlToLoad;
- (id) initWithURLString:(NSString *) inURLString;
- (id) initWithURL:(NSURL *)inURL;
- (void) loadURLMain: (NSString *)urlString;


@end
