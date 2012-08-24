//
//  RNFirstViewController.h
//  RedNews
//
//  Created by Sohel Dadia on 8/19/12.
//  Copyright (c) 2012 Sohel Dadia. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RNWebViewController;

@interface RNFirstViewController : UIViewController <UIWebViewDelegate>
{
    UIWebView*      mWebView;
    UIActivityIndicatorView*        activityIndicator;
    RNWebViewController* mWebViewController;
    BOOL            mInterceptLinks;
}

@property (nonatomic, retain) IBOutlet UIWebView* webView;
@property (nonatomic, retain) RNWebViewController*  webViewController;

@end
