//
//  PopoverTestAppDelegate.h
//  PopoverTest
//
//  Created by Chileung on 11年11月11日.
//  Copyright 2011 MTel Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PopoverTestViewController;

@interface PopoverTestAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    PopoverTestViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet PopoverTestViewController *viewController;

@end

