//
//  Lesson_3_1AppDelegate.h
//  Lesson-3-1
//
//  Created by Ray Wong on 11年11月25日.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Lesson_3_1ViewController;

@interface Lesson_3_1AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    Lesson_3_1ViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet Lesson_3_1ViewController *viewController;

@end

