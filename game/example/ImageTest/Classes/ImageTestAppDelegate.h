//
//  ImageTestAppDelegate.h
//  ImageTest
//
//  Created by Ray Wong on 03/12/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ImageTestViewController;

@interface ImageTestAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ImageTestViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ImageTestViewController *viewController;

@end

