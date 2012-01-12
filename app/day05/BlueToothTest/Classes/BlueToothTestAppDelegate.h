//
//  BlueToothTestAppDelegate.h
//  BlueToothTest
//
//  Created by Chileung on 11年11月11日.
//  Copyright 2011 MTel Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BlueToothTestViewController;

@interface BlueToothTestAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    BlueToothTestViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet BlueToothTestViewController *viewController;

@end

