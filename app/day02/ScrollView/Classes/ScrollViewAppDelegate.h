//
//  ScrollViewAppDelegate.h
//  ScrollView
//
//  Created by Jarvis on 22/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ScrollViewViewController;

@interface ScrollViewAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ScrollViewViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ScrollViewViewController *viewController;

@end

