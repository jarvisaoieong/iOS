//
//  OpenURLAppDelegate.h
//  OpenURL
//
//  Created by Algebra Lo on 5/11/11.
//  Copyright 2011 MTel Limited. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OpenURLViewController;

@interface OpenURLAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    OpenURLViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet OpenURLViewController *viewController;

@end

