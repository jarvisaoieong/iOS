//
//  Lesson_4_3AppDelegate.h
//  Lesson-4-3
//
//  Created by Ray Wong on 01/12/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Lesson_4_3ViewController;

@interface Lesson_4_3AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    Lesson_4_3ViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet Lesson_4_3ViewController *viewController;

@end

