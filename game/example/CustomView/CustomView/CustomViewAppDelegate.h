//
//  CustomViewAppDelegate.h
//  CustomView
//
//  Created by Jarvis Ao Ieong on 10/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CustomViewViewController;

@interface CustomViewAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet CustomViewViewController *viewController;

@end
