//
//  RNFirstViewController.h
//  RedNews
//
//  Created by Sohel Dadia on 8/19/12.
//  Copyright (c) 2012 Sohel Dadia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RNFirstViewController : UIViewController <UIWebViewDelegate>
{
    UIWebView*      mWebView;
}

@property (nonatomic, retain) IBOutlet UIWebView* webView;


@end
