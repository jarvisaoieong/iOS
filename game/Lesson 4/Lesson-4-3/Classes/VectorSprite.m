//
//  VectorSprite.m
//  Lesson-4-1
//
//  Created by Ray Wong on 29/11/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "VectorSprite.h"


@implementation VectorSprite

@synthesize points, count, vectorScale;

- (void)setScale:(CGFloat)s
{
	self.vectorScale = s;
	scale = 1.0;
	[self updateSize];
}

- (void)updateSize
{
	CGFloat w,h,minX,minY,maxX,maxY;
	w = h;
	minX = minY = maxX = maxY = 0.0;
	for (int i = 0; i < count; i++) {
		CGFloat x1 = points[i * 2] * vectorScale;
		CGFloat y1 = points[i * 2 + 1] * vectorScale;
		if (x1 < minX) minX = x1;
		if (x1 > maxX) maxX = x1;
		if (y1 < minY) minY = y1;
		if (y1 > maxY) maxY = y1;
	}
	width = ceil(maxX - minX);
	height = ceil(maxY - minY);
}

+ (VectorSprite *)withPoints:(CGFloat *)rawPoints count:(int)count
{
	VectorSprite *v = [[VectorSprite alloc]init];
	v.count = count;
	v.points = rawPoints;
	v.vectorScale = 1.0;
	[v updateSize];
	return v;
}

- (void)outlinePath:(CGContextRef)context
{
	CGContextBeginPath(context);
	CGContextSetRGBStrokeColor(context, r, g, b, alpha);
	for (int i = 0 ; i < count; i++) {
		CGFloat x1 = points[i * 2] * vectorScale;
		CGFloat y1 = points[i * 2 + 1] * vectorScale;
		if (i == 0) {
			CGContextMoveToPoint(context, x1, y1);
		}
		else {
			CGContextAddLineToPoint(context, x1, y1);
		}
	}
	CGContextClosePath(context);
}

@end
