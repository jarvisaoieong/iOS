//
//  MyView.m
//  CustomView
//
//  Created by Jarvis Ao Ieong on 10/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MyView.h"

@implementation MyView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    CGAffineTransform t0 = CGContextGetCTM(context);
    t0 = CGAffineTransformInvert(t0);
    CGContextConcatCTM(context, t0);
    
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, 0, 100);
    CGContextAddLineToPoint(context, 0, 100);
    CGContextAddLineToPoint(context, 100, 200);
    CGContextAddLineToPoint(context, 200, 200);
    CGContextAddLineToPoint(context, 300, 100);
    CGContextAddLineToPoint(context, 200, 0);
    CGContextAddLineToPoint(context, 100, 0);
    CGContextAddLineToPoint(context, 0, 100);
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFill);
    CGContextRestoreGState(context);
}


@end
