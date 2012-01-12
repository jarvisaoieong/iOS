//
//  PreferencesAppDelegate.h
//  Preferences
//
//  Created by MTel on 22/01/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PreferencesViewController;

@interface PreferencesAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    PreferencesViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet PreferencesViewController *viewController;

@end

