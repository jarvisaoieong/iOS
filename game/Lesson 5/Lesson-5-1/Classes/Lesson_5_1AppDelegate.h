//
//  Lesson_5_1AppDelegate.h
//  Lesson-5-1
//
//  Created by Ray Wong on 01/12/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Lesson_5_1ViewController;

@interface Lesson_5_1AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    Lesson_5_1ViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet Lesson_5_1ViewController *viewController;

@end

