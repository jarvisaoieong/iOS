//
//  ASI2AppDelegate.h
//  ASI2
//
//  Created by Jarvis on 5/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ASI2ViewController;

@interface ASI2AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ASI2ViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ASI2ViewController *viewController;

@end

