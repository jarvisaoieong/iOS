//
//  ImageViewAppDelegate.h
//  ImageView
//
//  Created by Jarvis on 22/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ImageViewViewController;

@interface ImageViewAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ImageViewViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ImageViewViewController *viewController;

@end

