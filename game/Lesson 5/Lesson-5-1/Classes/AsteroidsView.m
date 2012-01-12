//
//  AsteroidsView.m
//  Lesson-4-1
//
//  Created by Ray Wong on 28/11/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AsteroidsView.h"


@implementation AsteroidsView

#define RANDOM_SEED() srandom(time(NULL))
#define RANDOM_INT(_MIN_, _MAX_) ((_MIN_) + random() % ((_MAX_+1) - (_MIN_)))

//針對移動處理的相關常數
#define kSteps 8
#define kSpeed 100
#define kFPS 30.0
#define kBounce 30
#define kDirForward 0
#define kDirBackward 1
#define kDirUp 2
#define kDirDown 3

//使用影格編號來組成行走動畫
static int kForward[] = {0,1,2,3,4,5,6,7};

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
		test = [AtlasSprite fromFile:@"explorer_right_strip8.png" withRows:1 withColumns:8];
		test.angle = 0;
		test.speed = kSpeed;
		direction = kDirForward;
		self.backgroundColor = [UIColor whiteColor];
		timer = [NSTimer scheduledTimerWithTimeInterval:1.0/kFPS
												 target:self
											   selector:@selector(gameLoop)
											   userInfo:nil
												repeats:YES];
	}
	return self;
}

- (void)gameLoop
{
	frame = (frame + 1) % kSteps;
	[test tic:1.0/kFPS];
	
	//假如跑出螢幕的話，就回頭往屏幕中央，在增減些行進角度。利用行走角度來創造新動畫。
	if (test.offScreen) {
		RANDOM_SEED();
		int toCenter = round(atan2(-test.y, -test.x)*180.0 / 3.141592);
		if (toCenter < 0) toCenter += 360;
		int bounce = (toCenter + RANDOM_INT(-kBounce,kBounce)) % 360;
		test.angle = bounce;
		test.scale = 0.4 + 1.6 * RANDOM_INT(0,10) / 10;
		while (test.offScreen) [test tic:1.0/kFPS];
	}
	switch (direction) {
		case kDirForward:
			test.frame = kForward[frame];
			break;
	}
	[self setNeedsDisplay];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
	
	//取得圖像內文，保存它的狀態
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSaveGState(context);
	
	//重設轉換設定
	CGAffineTransform t0 = CGContextGetCTM(context);
	t0 = CGAffineTransformInvert(t0);
	CGContextConcatCTM(context, t0);

	[test draw:context];
	
	CGContextRestoreGState(context);
}


- (void)dealloc {
	[test release];
	[timer invalidate];
    [super dealloc];
}


@end
