//
//  LoadingExampleAppDelegate.h
//  LoadingExample
//
//  Created by Chileung on 11年11月19日.
//  Copyright 2011 MTel Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LoadingExampleViewController;

@interface LoadingExampleAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    LoadingExampleViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet LoadingExampleViewController *viewController;

@end

