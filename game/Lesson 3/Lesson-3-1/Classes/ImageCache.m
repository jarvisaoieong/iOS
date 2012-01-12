//
//  ImageCache.m
//  Lesson-2-2
//
//  Created by Ray Wong on 11年11月23日.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ImageCache.h"


@implementation ImageCache

static NSMutableDictionary *dict;

+ (UIImage *)loadImage:(NSString *)imageName
{
	if (!dict) dict = [[NSMutableDictionary dictionary] retain];
	UIImage *image = [dict objectForKey:imageName];
	if (!image) {
		NSString *imagePath = [[NSBundle mainBundle]pathForResource:imageName ofType:nil];
		image = [UIImage imageWithContentsOfFile:imagePath];
		if (image) {
			[dict setObject:image forKey:imageName];
		}
	}
	return image;
}

+ (void)releaseCache
{
	if (dict) {
		[dict removeAllObjects];
	}
}

@end
