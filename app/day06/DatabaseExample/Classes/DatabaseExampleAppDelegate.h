//
//  DatabaseExampleAppDelegate.h
//  DatabaseExample
//
//  Created by Chileung on 11年11月18日.
//  Copyright 2011 MTel Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DatabaseExampleViewController;

@interface DatabaseExampleAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    DatabaseExampleViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet DatabaseExampleViewController *viewController;

@end

