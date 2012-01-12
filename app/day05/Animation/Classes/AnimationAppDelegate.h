//
//  AnimationAppDelegate.h
//  Animation
//
//  Created by Jarvis on 12/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AnimationViewController;

@interface AnimationAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    AnimationViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet AnimationViewController *viewController;

@end

