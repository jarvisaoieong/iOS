//
//  Lesson_1_3AppDelegate.h
//  Lesson-1-3
//
//  Created by Ray Wong on 11年11月21日.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Lesson_1_3ViewController;

@interface Lesson_1_3AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    Lesson_1_3ViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet Lesson_1_3ViewController *viewController;

@end

