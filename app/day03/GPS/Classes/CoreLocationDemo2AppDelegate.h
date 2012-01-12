//
//  CoreLocationDemo2AppDelegate.h
//  CoreLocationDemo2
//
//  Created by MTel on 22/01/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CoreLocationDemo2ViewController;

@interface CoreLocationDemo2AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    CoreLocationDemo2ViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet CoreLocationDemo2ViewController *viewController;

@end

