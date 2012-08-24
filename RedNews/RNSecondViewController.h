//
//  RNSecondViewController.h
//  RedNews
//
//  Created by Sohel Dadia on 8/19/12.
//  Copyright (c) 2012 Sohel Dadia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RNSecondViewController : UIViewController <UIWebViewDelegate>
{
    UIWebView*                      mWebView;
    UIActivityIndicatorView*        activityIndicator;

}

@property (nonatomic, retain) IBOutlet UIWebView* webView;

@end
