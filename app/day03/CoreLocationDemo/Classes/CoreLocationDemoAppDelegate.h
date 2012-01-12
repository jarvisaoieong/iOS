//
//  CoreLocationDemoAppDelegate.h
//  CoreLocationDemo
//
//  Created by Nicholas Vellios on 8/15/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CoreLocationDemoViewController;

@interface CoreLocationDemoAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    CoreLocationDemoViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet CoreLocationDemoViewController *viewController;

@end

