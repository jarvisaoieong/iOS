//
//  TableViewExampleAppDelegate.h
//  TableViewExample
//
//  Created by MTel on 15/01/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TableViewExampleViewController;

@interface TableViewExampleAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    TableViewExampleViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet TableViewExampleViewController *viewController;

@end

