//
//  AtlasSprite.m
//  Lesson-4-1
//
//  Created by Ray Wong on 29/11/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AtlasSprite.h"


@implementation AtlasSprite

@synthesize rows, columns;
@synthesize image, atlas, atlasWidth, atlasHeight, clipRect, w2, h2;

+ (NSMutableDictionary *)sharedSpriteAtlas
{
	static NSMutableDictionary *sharedSpriteDictionary;
	@synchronized(self)
	{
		if (!sharedSpriteDictionary) {
			sharedSpriteDictionary = [[NSMutableDictionary alloc]init];
			return sharedSpriteDictionary;
		}
	}
	return sharedSpriteDictionary;
}

+ (UIImage *)getSpriteAtlas:(NSString *)name
{
	NSMutableDictionary *d = [AtlasSprite sharedSpriteAtlas];
	UIImage *img = [d objectForKey:name];
	if (!img) {
		img = [[UIImage alloc]initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:name ofType:nil]];
		[d setObject:img forKey:name];
	}
	return img;
}

+ (AtlasSprite *)fromFile:(NSString *)fname withRows:(int)rows withColumns:(int)columns
{
	AtlasSprite *s = [[AtlasSprite alloc]init];
	s.atlas = [[AtlasSprite getSpriteAtlas:fname]retain];
	CGImageRef img = [s.atlas CGImage];
	s.image = img;
	int width = CGImageGetWidth(s.image);
	int height = CGImageGetHeight(s.image);
	if (rows < 1) rows = 1;
	if (columns < 1) columns = 1;
	s.atlasWidth = width;
	s.atlasHeight = height;
	s.rows = rows;
	s.columns = columns;
	s.width = round(width / s.columns);
	s.height = round(height / s.rows);
	s.w2 = s.width * 0.5;
	s.h2 = s.height * 0.5;
	s.clipRect = CGRectMake(-s.width*0.5, -s.height*0.5, s.width, s.height);
	return s;
}

- (void)drawBody:(CGContextRef)context
{
	int r0 = floor(frame / columns);
	int c0 = frame - columns * r0;
	CGFloat u = c0 * width + w2;	//(u,v)動畫精靈影格在地圖裡的中心點
	CGFloat v = atlasHeight - (r0 * height + h2);
	
	//從地圖集裡裁切出圖片
	CGContextBeginPath(context);
	CGContextAddRect(context, clipRect);
	CGContextClip(context);
	
	//繪製地圖集
	CGContextDrawImage(context, CGRectMake(-u, -v, atlasWidth, atlasHeight), image);
}

- (id)init
{
	self = [super init];
	if (self) {
		rows = 0.0;
		columns = 0.0;
	}
	return self;
}

- (void)dealloc
{
	[atlas release];
	CGImageRelease(image);
	[super dealloc];
}

@end
