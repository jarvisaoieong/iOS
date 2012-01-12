//
//  Lesson_4_2AppDelegate.h
//  Lesson-4-2
//
//  Created by Ray Wong on 01/12/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Lesson_4_2ViewController;

@interface Lesson_4_2AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    Lesson_4_2ViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet Lesson_4_2ViewController *viewController;

@end

