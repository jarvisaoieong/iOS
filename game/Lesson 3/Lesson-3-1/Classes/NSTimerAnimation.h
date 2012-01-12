//
//  NSTimerAnimation.h
//  Lesson-2-2
//
//  Created by Ray Wong on 11年11月23日.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface NSTimerAnimation : UIImageView {
	int _frameCounter;
	int _repeatCounter;
	NSTimeInterval _animationInterval;
	NSTimeInterval _timeElapsed;
	NSTimer *_theTimer;
	
}

@property (nonatomic, readwrite) NSTimeInterval animationInterval;

@end
