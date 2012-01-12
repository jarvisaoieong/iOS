//
//  AtlasSprite.h
//  Lesson-4-1
//
//  Created by Ray Wong on 29/11/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Sprite.h"


@interface AtlasSprite : Sprite {
	CGFloat w2;				//一半寬度（快取用）
	CGFloat h2;				//一半高度（快取用）
	CGFloat atlasWidth;		//地圖集寬度
	CGFloat atlasHeight;	//地圖集高度
	UIImage *atlas;			//含有這些動畫精靈影像的地圖集
	CGImageRef image;		//
	CGRect clipRect;		//圖塊片段矩形
	int rows;				//地圖集裡的列數
	int columns;			//地圖集裡的欄數
}

@property (assign) CGFloat w2, h2, atlasWidth, atlasHeight;
@property (assign) CGRect clipRect;
@property (assign) int rows, columns;
@property (nonatomic, retain) UIImage *atlas;
@property (assign) CGImageRef image;

+ (AtlasSprite *)fromFile:(NSString *)fname withRows:(int)rows withColumns:(int)columns;
+ (NSMutableDictionary *)sharedSpriteAtlas;
+ (UIImage *)getSpriteAtlas:(NSString *)name;

@end
