//
//  AnimationTestAppDelegate.h
//  AnimationTest
//
//  Created by Chileung on 11年11月11日.
//  Copyright 2011 MTel Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AnimationTestViewController;

@interface AnimationTestAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    AnimationTestViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet AnimationTestViewController *viewController;

@end

