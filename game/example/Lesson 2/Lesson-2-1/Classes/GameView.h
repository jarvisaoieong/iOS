//
//  GameView.h
//  Blcok_Break
//
//  Created by MacBook Pro on 08/11/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#define BRICKS_WIDTH 5
#define BRICKS_HEIGHT 7

@interface GameView : UIViewController {
	IBOutlet UILabel *scoreLabel;
	int score;
	
	IBOutlet UIImageView *ball;
	float speedX, speedY;
	
	IBOutlet UIImageView *paddle;
	float touchOffset;
	
	BOOL isPlaying;
	NSTimer *theTimer;

	UIImageView *bricks[BRICKS_WIDTH][BRICKS_HEIGHT];
	NSString *brickTypes[7];
	
	int stage;
}

@property (nonatomic, retain) IBOutlet UILabel *scoreLabel;
@property (nonatomic, retain) IBOutlet UIImageView *ball;
@property (nonatomic, retain) IBOutlet UIImageView *paddle;

- (void)initializeTimer;
- (void)gameLogic;

- (void)startPlaying;
- (void)pauseGame;

- (void)initializeBricks;
- (void)processCollision:(UIImageView *)brick;
@end
