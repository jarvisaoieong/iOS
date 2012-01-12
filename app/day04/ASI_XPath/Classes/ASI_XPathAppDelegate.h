//
//  ASI_XPathAppDelegate.h
//  ASI_XPath
//
//  Created by Algebra Lo on 4/11/11.
//  Copyright 2011 MTel Limited. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ASI_XPathViewController;

@interface ASI_XPathAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ASI_XPathViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ASI_XPathViewController *viewController;

@end

