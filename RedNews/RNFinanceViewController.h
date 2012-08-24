//
//  RNFinanceViewController.h
//  RedNews
//
//  Created by Sohel Dadia on 8/22/12.
//  Copyright (c) 2012 Sohel Dadia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RNFinanceViewController : UIViewController <UIWebViewDelegate>
{
    UIWebView*          mWebView;
    UIActivityIndicatorView*        activityIndicator;
}

@property (nonatomic, retain) IBOutlet UIWebView* webView;

@end
