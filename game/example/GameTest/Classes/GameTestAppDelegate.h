//
//  GameTestAppDelegate.h
//  GameTest
//
//  Created by Ray Wong on 03/12/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GameTestViewController;

@interface GameTestAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    GameTestViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet GameTestViewController *viewController;

@end

