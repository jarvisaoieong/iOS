//
//  VectorSprite.h
//  Lesson-4-1
//
//  Created by Ray Wong on 29/11/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Sprite.h"


@interface VectorSprite : Sprite {
	CGFloat *points;
	int count;
	CGFloat vectorScale;
}

@property (assign) int count;
@property (assign) CGFloat vectorScale;
@property (assign) CGFloat *points;

+ (VectorSprite *)withPoints:(CGFloat *)rawPoints count:(int)count;
- (void) updateSize;

@end
