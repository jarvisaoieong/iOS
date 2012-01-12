//
//  Lesson_1_4AppDelegate.h
//  Lesson-1-4
//
//  Created by Ray Wong on 11年11月22日.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Lesson_1_4ViewController;

@interface Lesson_1_4AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    Lesson_1_4ViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet Lesson_1_4ViewController *viewController;

@end

