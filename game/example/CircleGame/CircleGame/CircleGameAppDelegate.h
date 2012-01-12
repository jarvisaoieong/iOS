//
//  CircleGameAppDelegate.h
//  CircleGame
//
//  Created by Jarvis Ao Ieong on 17/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CircleGameViewController;

@interface CircleGameAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet CircleGameViewController *viewController;

@end
