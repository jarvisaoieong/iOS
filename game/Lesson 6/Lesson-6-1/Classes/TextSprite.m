//
//  TextSprite.m
//  Lesson-6-1
//
//  Created by Ray Wong on 01/12/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TextSprite.h"

#define kDefaultFont @"Helvetica"
#define kDefaultFontSize 14


@implementation TextSprite

@synthesize text, font, fontSize;

- (id)init
{
	self = [super init];
	if (self) {
		font = [kDefaultFont retain];
		fontSize = kDefaultFontSize;
		text = nil;
		width = height = 0.0;
	}
	return self;
}

+ (TextSprite *)withString:(NSString *)label
{
	TextSprite *ts = [[TextSprite alloc]init];
	if (ts) {
		ts.text = [label retain];
	}
	return ts;
}

- (void)newText:(NSString *)val
{
	if (text) [text release];
	text = [val retain];
	width = 0;
	height = 0;
}

- (void)dealloc
{
	[text release];
	[font release];
	[super dealloc];
}

- (void)computeWidth:(CGContextRef)context
{
	textLength = [text length];
	
	CGFontRef fref = CGFontCreateWithFontName((CFStringRef)font);
	if (!fref) {
		width = 0;
		height = 0;
		printf("Warning:missing font %s\n",[font UTF8String]);
		return;
	}
	CGRect bbox = CGFontGetFontBBox(fref);
	int units = CGFontGetUnitsPerEm(fref);
	
	// 轉換字型單位，並乘上fontSize來取得高度
	height = (((float)bbox.size.height) / ((float)units)) * fontSize;
	
	// 以不可見的方式來繪製文字，以便算出它的寬度
	CGPoint left = CGContextGetTextPosition(context);
	CGContextSetTextMatrix(context, CGAffineTransformIdentity);
	CGContextSelectFont(context, [font UTF8String], fontSize, kCGEncodingMacRoman);
	CGContextShowText(context, [text UTF8String], textLength);
	CGPoint right = CGContextGetTextPosition(context);
	width = right.x - left.x;
	
	// 算出新的邊界區塊，並進行釋放
	[self updateBox];
	CGFontRelease(fref);
	return;
}

- (void)drawBody:(CGContextRef)context
{
	if (!text) return;
	if (!width) [self computeWidth:context];
	
	CGContextSelectFont(context, [font UTF8String], fontSize, kCGEncodingMacRoman);
	CGContextSetTextDrawingMode(context, kCGTextFillStroke);
	CGContextSetRGBFillColor(context, r, g, b, alpha);
	CGContextSetRGBStrokeColor(context, r, g, b, alpha);
	CGContextShowTextAtPoint(context, 0, 0, [text UTF8String], textLength);
}

- (void)moveUpperLeftTo:(CGPoint)p
{
	CGPoint p2 = CGPointMake(0, 0);
	p2.x = p.x;
	p2.y = p.y + height;
	[self moveTo:p2];
}

@end
