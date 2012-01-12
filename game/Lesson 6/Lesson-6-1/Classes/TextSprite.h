//
//  TextSprite.h
//  Lesson-6-1
//
//  Created by Ray Wong on 01/12/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Sprite.h"


@interface TextSprite : Sprite {
	NSString *text;
	NSString *font;
	uint fontSize;
	uint textLength;
}

@property (assign) NSString *text;
@property (assign) NSString *font;
@property (assign) uint fontSize;

+ (TextSprite *)withString:(NSString *)label;
- (void)moveUpperLeftTo:(CGPoint)p;
- (void)newText:(NSString *)val;

@end
