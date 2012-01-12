//
//  Lesson_1_2ViewController.h
//  Lesson-1-2
//
//  Created by Ray Wong on 11年11月21日.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Lesson_1_2ViewController : UIViewController {
	UIImageView *ball;
	CGPoint ballMovement;
}

@property (nonatomic, retain) IBOutlet UIImageView *ball;

- (void)initializeTimer;
- (void)animateBall:(NSTimer *)theTimer;

@end

