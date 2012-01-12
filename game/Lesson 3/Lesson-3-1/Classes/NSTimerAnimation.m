//
//  NSTimerAnimation.m
//  Lesson-2-2
//
//  Created by Ray Wong on 11年11月23日.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NSTimerAnimation.h"


@implementation NSTimerAnimation

@synthesize animationInterval = _animationInterval;


- (NSTimerAnimation *)init
{
	if (self = [super init]) {
		_animationInterval = 1.0/30.0;
		_frameCounter = 0;
		_repeatCounter = 0;
		_timeElapsed = 0;
		_theTimer = nil;
	}
	return self;
}

- (void)setAnimationInterval:(NSTimeInterval)newValue
{
	if ((1.0 / 10.0) < newValue) {
		_animationInterval = 1.0 / 10.0;
	} else if ((1.0 / 60.0) > newValue) {
		_animationInterval = 1.0 / 60.0;
	} else {
		_animationInterval = newValue;
	}
}

- (void)stopAnimating
{
	if (_theTimer) {
		[_theTimer invalidate];
		_theTimer = nil;
	}
}

- (void)startAnimating
{
	if (self.animationDuration > 0 && self.animationImages && [self.animationImages count] > 0) {
		_frameCounter = 0;
		_repeatCounter = 0;
		_timeElapsed = 0;
		_theTimer = [NSTimer scheduledTimerWithTimeInterval:_animationInterval
													 target:self
												   selector:@selector(changeAnimationImage)
												   userInfo:nil
													repeats:(self.animationRepeatCount > 0)];
	
	}
}

- (void)changeAnimationImage
{
	self.image = [self.animationImages objectAtIndex:_frameCounter++];
	_timeElapsed += _animationInterval;
	if ((_timeElapsed >= self.animationDuration || _frameCounter >= [self.animationImages count])
		&& (0 < self.animationRepeatCount && _repeatCounter <= self.animationRepeatCount)) {
		_repeatCounter++;
		_frameCounter = 0;
	}
	if (_repeatCounter >= self.animationRepeatCount) {
		[self stopAnimating];
	}
}


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
}
*/

- (void)dealloc {
    [super dealloc];
}


@end
