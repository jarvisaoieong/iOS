//
//  Sprite.h
//  Lesson-4-1
//
//  Created by Ray Wong on 28/11/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Sprite : NSObject {
	CGFloat x;			//x座標
	CGFloat y;			//y座標
	CGFloat r;			//紅色色調
	CGFloat g;			//綠色色調
	CGFloat b;			//藍色色調
	CGFloat alpha;		//透明度的alpha值
	CGFloat speed;		//以像素/影格為單位的移動速度
	CGFloat angle;		//以度數來表示的移動角度
	CGFloat rotation;	//以度數來表示，並以中心點為基準的動畫精靈旋轉程度
	CGFloat width;		//以像素為單位的動畫精靈寬度
	CGFloat height;		//以像素為單位的動畫精靈高度
	CGFloat scale;		//一致的大小縮放係數
	int frame;			//動畫效果用
	
	CGFloat cosTheta;	//針對速度的預先計算數值
	CGFloat sinTheta;	//
	CGRect box;			//邊界區塊
	
	BOOL render;		//正在進行描繪處理時，這個值就會是true
	BOOL offScreen;		//離開螢幕範圍時，這個值就會是true
	BOOL wrap;			//假如你希望動作要盤繞在螢幕上的話，這個值就會是true
}

@property (assign) BOOL wrap, render, offScreen;
@property (assign) CGFloat x, y, r, g, b, alpha;
@property (assign) CGFloat speed, angle, rotation;
@property (assign) CGFloat width, height, scale;
@property (assign) CGRect box;
@property (assign) int frame;

- (void)draw:(CGContextRef)context;
- (void)drawBody:(CGContextRef)context;
- (void)outlinePath:(CGContextRef)context;

- (void)updateBox;
- (void)tic:(NSTimeInterval)dt;

- (void)moveTo:(CGPoint)p;

@end
