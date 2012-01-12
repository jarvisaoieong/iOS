//
//  ASIAppDelegate.h
//  ASI
//
//  Created by Algebra Lo on 5/11/11.
//  Copyright 2011 MTel Limited. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ASIViewController;

@interface ASIAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ASIViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ASIViewController *viewController;

@end

