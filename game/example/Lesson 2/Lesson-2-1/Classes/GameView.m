//
//  GameView.m
//  Blcok_Break
//
//  Created by MacBook Pro on 08/11/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GameView.h"

@implementation GameView

@synthesize scoreLabel, ball, paddle;

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	if (isPlaying) {
		UITouch *touch = [[event allTouches] anyObject];
		touchOffset = paddle.center.x - [touch locationInView:touch.view].x;
	} else {
		[self startPlaying];
	}
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	if (isPlaying) {
		UITouch *touch = [[event allTouches] anyObject];
		
		float newX = [touch locationInView:touch.view].x + touchOffset;
		
		if (newX > 48 && newX < 272) {
			paddle.center = CGPointMake(newX, paddle.center.y);
		}
		if (newX > 272) {
			paddle.center = CGPointMake(272, paddle.center.y);
		}
		if (newX < 48) {
			paddle.center = CGPointMake(48, paddle.center.y);
		}
	}
}

- (void)startPlaying
{
	scoreLabel.text = [NSString stringWithFormat:@"%05d",score];
	speedX = 5.0;
	speedY = 5.0;
	if (arc4random() % 100 < 50) {
		speedX = -speedX;
	}
	isPlaying = YES;
	[self initializeTimer];
}

- (void)pauseGame
{
	[theTimer invalidate];
	theTimer = nil;
}

- (void)initializeTimer
{
	float theInterval = 1.0/60.0;
	theTimer = [NSTimer scheduledTimerWithTimeInterval:theInterval 
									 target:self
								   selector:@selector(gameLogic)
								   userInfo:nil
									repeats:YES];
}

- (void)initializeBricks
{
	int step;
	
	switch (stage) {
		case 1:
			step = 3;
			break;
		case 2:
			step = 2;
			break;
		case 3:
			step = 1;
			break;
		default:
			break;
	}
	
	brickTypes[0] = @"B1.png";
	brickTypes[1] = @"B2.png";
	brickTypes[2] = @"B3.png";
	brickTypes[3] = @"B4.png";
	brickTypes[4] = @"B5.png";
	brickTypes[5] = @"B6.png";
	brickTypes[6] = @"B7.png";
	
	int count = 0;
	for (int y=0; y<BRICKS_HEIGHT; y+=step) {
		for (int x=0; x<BRICKS_WIDTH; x++) {
			UIImage *image = [UIImage imageNamed:brickTypes[count++ % 7]];
			bricks[x][y] = [[[UIImageView alloc]initWithImage:image]autorelease];
			CGRect newFrame = bricks[x][y].frame;
			newFrame.origin = CGPointMake(x * 64, 50 + y * 25);
			bricks[x][y].frame = newFrame;
			[self.view addSubview:bricks[x][y]];
		}
	}
}
	
- (void)gameLogic
{
	ball.center = CGPointMake(ball.center.x+speedX, ball.center.y+speedY);
	
	BOOL paddleCollision = ball.center.y >= paddle.center.y - 16 &&
		ball.center.y <= paddle.center.y + 16 &&
		ball.center.x > paddle.center.x - 48 &&
		ball.center.x < paddle.center.x + 48;
	
	
	if (paddleCollision) {
		speedY = -speedY;
		
		if (ball.center.x + 16 >= paddle.center.x - 48 && ball.center.x + 16 <= paddle.center.x - 24 && speedX > 0
			|| ball.center.x - 16 <= paddle.center.x + 48 && ball.center.x - 16 >= paddle.center.x + 24 && speedX < 0) {
			speedX = -speedX;
		}
		
		if (ball.center.y >= paddle.center.y - 16 && speedY < 0) {
			ball.center = CGPointMake(ball.center.x, paddle.center.y - 16);
		} else if (ball.center.y <= paddle.center.y + 16 && speedY > 0) {
			ball.center = CGPointMake(ball.center.x, paddle.center.y + 16);
		} else if (ball.center.x >= paddle.center.x - 48 && speedX < 0) {
			ball.center = CGPointMake(paddle.center.x - 48, ball.center.y);
		} else if (ball.center.x <= paddle.center.x + 48 && speedX > 0) {
			ball.center = CGPointMake(paddle.center.x + 48, ball.center.y);
		}
	}
	
	BOOL there_are_solid_bricks = NO;
	for (int y=0; y<BRICKS_HEIGHT; y++) 
	{
		for (int x=0; x<BRICKS_WIDTH; x++) 
		{
			if (bricks[x][y].alpha > 0.3) 
			{
				there_are_solid_bricks = YES;
				if (CGRectIntersectsRect(ball.frame, bricks[x][y].frame)) 
				{
					[self processCollision:bricks[x][y]];
				}
			}
			else 
			{
				bricks[x][y].alpha -= 0.1;
			}
		}
	}
	
	if (!there_are_solid_bricks) {
		[theTimer invalidate];
		isPlaying = NO;
		if (stage < 3) {
			stage++;
			ball.center = CGPointMake(152 + 8, 253 + 8);
			paddle.center = CGPointMake(160, paddle.center.y);
			[self initializeBricks];
		}
	}
	 
	if (ball.center.x > 307 || ball.center.x < 13) speedX = -speedX;
	if (ball.center.y < 33) speedY = -speedY;
	if (ball.center.y > 447) {
		[self pauseGame];
		isPlaying = NO;
		[self dismissModalViewControllerAnimated:YES];
	}
}

- (void)processCollision:(UIImageView *)brick
{
	float speedStep;
	
	switch (stage) {
		case 1:
			speedStep = 0.04;
			break;
		case 2:
			speedStep = 0.05;
			break;
		case 3:
			speedStep = 0.07;
			break;
		default:
			break;
	}
	
	if (speedX < 0) {
		speedX -= speedStep;
	} else {
		speedX += speedStep;
	}
	if (speedY < 0) {
		speedY -= speedStep;
	} else {
		speedY += speedStep;
	}
	score += 10;
	scoreLabel.text = [NSString stringWithFormat:@"%d",score];
	
	//speedX = -speedX;
	speedY = -speedY;
	//if (ballMovement.x > 0 && brick.frame.origin.x - ball.center.x <= 4) ballMovement.x = -ballMovement.x;
	//else if (ballMovement.x <0 && ball.center.x - (brick.frame.origin.x + brick.frame.size.width) <= 4) ballMovement.x = -ballMovement.x;
	//if (ballMovement.y > 0 && brick.frame.origin.y - ball.center.y <= 4) ballMovement.y = -ballMovement.y;
	//else if (ballMovement.y <0 && ball.center.y - (brick.frame.origin.y + brick.frame.size.height) <= 4) ballMovement.y = -ballMovement.y;
	brick.alpha -= 0.3;
}

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	stage = 1;
	[self initializeBricks];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[scoreLabel release];
	[ball release];
	[paddle release];
    [super dealloc];
}


@end
