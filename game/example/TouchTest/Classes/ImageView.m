//
//  ImageView.m
//  TouchTest
//
//  Created by Ray Wong on 03/12/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ImageView.h"


@implementation ImageView

/*
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch = [touches anyObject];
	self.center = CGPointMake([touch locationInView:self].x, [touch locationInView:self].y);
}
*/


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
