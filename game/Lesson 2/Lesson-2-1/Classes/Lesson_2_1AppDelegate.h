//
//  Lesson_2_1AppDelegate.h
//  Lesson-2-1
//
//  Created by Ray Wong on 11年11月25日.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Lesson_2_1ViewController;

@interface Lesson_2_1AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    Lesson_2_1ViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet Lesson_2_1ViewController *viewController;

@end

