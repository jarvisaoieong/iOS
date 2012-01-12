//
//  AsteroidsView.h
//  Lesson-4-1
//
//  Created by Ray Wong on 28/11/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Sprite.h"
#import "VectorSprite.h"
#import "AtlasSprite.h"


@interface AsteroidsView : UIView {
	Sprite *test;
	NSTimer *timer;
	int frame;
	int direction;

}

@end
