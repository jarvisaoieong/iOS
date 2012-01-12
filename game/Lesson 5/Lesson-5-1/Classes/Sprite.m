//
//  Sprite.m
//  Lesson-4-1
//
//  Created by Ray Wong on 28/11/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Sprite.h"


@implementation Sprite

@synthesize x, y, speed, angle, width, height, scale, frame, box, rotation, wrap, render;
@synthesize r, g, b, alpha, offScreen;

#define kScreenWidth 320
#define kScreenHeight 480

- (id)init
{
	self = [super init];
	if (self) {
		wrap = NO;
		x = y = 0.0;
		width = height = 1.0;
		scale = 1.0;
		speed = 0.0;
		angle = 0.0;
		rotation = 0.0;
		cosTheta = 1.0;
		sinTheta = 0.0;
		r = 1.0;
		g = 1.0;
		b = 1.0;
		alpha = 1.0;
		offScreen = NO;
		box = CGRectMake(0, 0, 0, 0);
		frame = 0;
		render = YES;
	}
	return self;
}

- (void)setRotation:(CGFloat)degrees
{
	rotation = degrees * 3.141592 / 180.0;
}

- (CGFloat)rotation
{
	return rotation * 180.0 / 3.141592;
}

- (void)setAngle:(CGFloat)degrees
{
	rotation = degrees * 3.141592 / 180;
	cosTheta = cos(rotation);
	sinTheta = sin(rotation);
}

- (CGFloat)angle
{
	return rotation * 180.0 / 3.141592;
}

- (void)draw:(CGContextRef)context
{
	CGContextSaveGState(context);
	
	//設定動畫精靈的位置
	CGAffineTransform t = CGAffineTransformIdentity;
	t = CGAffineTransformTranslate(t, y + 160, 240 - x);
	t = CGAffineTransformRotate(t, rotation - 3.141592 * 0.5);
	t = CGAffineTransformScale(t, scale, scale);
	CGContextConcatCTM(context, t);
	
	//繪製圖像本體
	[self drawBody:context];
	
	CGContextRestoreGState(context);
}

- (void)drawBody:(CGContextRef)context
{
	CGContextSetRGBFillColor(context, r, g, b, alpha);
	[self outlinePath:(context)];
	CGContextDrawPath(context, kCGPathFill);
}

- (void)outlinePath:(CGContextRef)context
{
	//在預設情況下，就只要繪出區塊輪廓，並假設中心點位於(0,0)
	CGFloat w2 = box.size.width*0.5;
	CGFloat h2 = box.size.height*0.5;
	
	CGContextBeginPath(context);
	CGContextMoveToPoint(context, -w2, h2);
	CGContextAddLineToPoint(context, w2, h2);
	CGContextAddLineToPoint(context, w2, -h2);
	CGContextAddLineToPoint(context, -w2, -h2);
	CGContextAddLineToPoint(context, -w2, h2);
	CGContextClosePath(context);
}

- (void)updateBox
{
	CGFloat w = width * scale;
	CGFloat h = height * scale;
	CGFloat w2 = w * 0.5;
	CGFloat h2 = h * 0.5;
	CGPoint origin = box.origin;
	CGSize bsize = box.size;
	CGFloat left = -kScreenHeight*0.5;
	CGFloat right = -left;
	CGFloat top = kScreenWidth*0.5;
	CGFloat bottom = -top;
	
	offScreen = NO;
	if (wrap) {
		if ((x+w2) < left) x = right + w2;
		else if ((x-w2) > right) x = left - w2;
		else if ((y+h2) < bottom) y = top + h2;
		else if ((y-h2) > top) y = bottom - h2; 
	}
	else {
		offScreen = 
		((x+w2) < left) ||
		((x-w2) > right) ||
		((y+h2) < bottom) ||
		((y-h2) > top);
	}
	
	origin.x = x - w2 * scale;
	origin.y = y - h2 * scale;
	bsize.width = w;
	bsize.height = h;
	box.origin = origin;
	box.size = bsize;
}

- (void)tic:(NSTimeInterval)dt
{
	if (!render) return;
	CGFloat sdt = speed * dt;
	x += sdt * cosTheta;
	y += sdt * sinTheta;
	if (sdt) [self updateBox];
}

@end
