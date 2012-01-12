//
//  AnimationAppDelegate.h
//  Animation
//
//  Created by Jarvis Ao Ieong on 17/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AnimationViewController;

@interface AnimationAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet AnimationViewController *viewController;

@end
