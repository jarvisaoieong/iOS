//
//  WebViewAppDelegate.h
//  WebView
//
//  Created by Jarvis on 22/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WebViewViewController;

@interface WebViewAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    WebViewViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet WebViewViewController *viewController;

@end

