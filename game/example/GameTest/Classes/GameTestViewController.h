//
//  GameTestViewController.h
//  GameTest
//
//  Created by Ray Wong on 03/12/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#define BRICKS_WIDTH 5
#define BRICKS_HEIGHT 4

@interface GameTestViewController : UIViewController {
	UILabel *label1, *label2;
	UIImageView *ball, *bar;
	
	NSTimer *timer;
	
	int speedX, speedY;
	int score;
	int life;
	
	UIImageView *bricks[BRICKS_WIDTH][BRICKS_HEIGHT];
	NSString *brickType[7];

}

@property (nonatomic, retain) IBOutlet UILabel *label1, *label2;
@property (nonatomic, retain) IBOutlet UIImageView *ball, *bar;

- (void)move;

- (void)initializeBricks;

@end

