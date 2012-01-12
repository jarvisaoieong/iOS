//
//  AsteroidsView.m
//  Lesson-4-1
//
//  Created by Ray Wong on 28/11/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AsteroidsView.h"


@implementation AsteroidsView

/*
- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
    }
    return self;
}
*/

- (id)initWithCoder:(NSCoder *)aDecoder
{
	if (self = [super initWithCoder:aDecoder]) {
		test = [[Sprite alloc]init];
		test.x = 50;
		test.y = 100;
		test.width = 100;
		test.height = 200;
		test.r = 0.0;
		test.g = 1.0;
		test.b = 0.0;
	}
	return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
	
	// 取得圖像內文，保存它的狀態
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSaveGState(context);
	
	// 重設轉換設定
	CGAffineTransform t0 = CGContextGetCTM(context);
	t0 = CGAffineTransformInvert(t0);
	CGContextConcatCTM(context, t0);

	// 繪製一個綠色矩形
	[test updateBox];
	[test draw:context];
	
	// 再次繪製一個紫色，並且有旋轉效果的矩形
	test.x = 75;
	test.y = 100;
	test.r = 1.0;
	test.g = 0.0;
	test.b = 1.0;
	test.alpha = 0.25;
	test.scale = 0.5;
	test.rotation = 90;
	[test updateBox];
	[test draw:context];
	
	CGContextRestoreGState(context);
}


- (void)dealloc {
	[test release];
    [super dealloc];
}


@end
