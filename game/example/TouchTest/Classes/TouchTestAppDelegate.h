//
//  TouchTestAppDelegate.h
//  TouchTest
//
//  Created by Ray Wong on 03/12/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TouchTestViewController;

@interface TouchTestAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    TouchTestViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet TouchTestViewController *viewController;

@end

