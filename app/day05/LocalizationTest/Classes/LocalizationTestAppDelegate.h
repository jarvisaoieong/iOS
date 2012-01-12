//
//  LocalizationTestAppDelegate.h
//  LocalizationTest
//
//  Created by Chileung on 11年11月11日.
//  Copyright 2011 MTel Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LocalizationTestViewController;

@interface LocalizationTestAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    LocalizationTestViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet LocalizationTestViewController *viewController;

@end

