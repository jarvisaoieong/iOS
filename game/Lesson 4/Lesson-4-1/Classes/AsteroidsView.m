//
//  AsteroidsView.m
//  Lesson-4-1
//
//  Created by Ray Wong on 01/12/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AsteroidsView.h"


@implementation AsteroidsView


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // 取得圖像內文，保存它的狀態
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSaveGState(context);
	
	// 重設轉換設定
	CGAffineTransform t0 = CGContextGetCTM(context);
	t0 = CGAffineTransformInvert(t0);
	CGContextConcatCTM(context, t0);
	
	// 繪製一個綠色矩形
	CGContextBeginPath(context);
	CGContextSetRGBFillColor(context, 0, 1, 0, 1);
	CGContextAddRect(context, CGRectMake(0, 0, 100, 200));
	CGContextClosePath(context);
	CGContextDrawPath(context, kCGPathFill);
	
	CGContextRestoreGState(context);
}


- (void)dealloc {
    [super dealloc];
}


@end
