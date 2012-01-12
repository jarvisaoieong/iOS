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
	ballMovement = CGPointMake(6, 6);
	if (arc4random() % 100 < 50) {
		ballMovement.x = -ballMovement.x;
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
	float theInterval = 1.0/30.0;
	theTimer = [NSTimer scheduledTimerWithTimeInterval:theInterval 
									 target:self
								   selector:@selector(gameLogic)
								   userInfo:nil
									repeats:YES];
}

- (void)initializeBricks
{
	brickTypes[0] = @"B1.png";
	brickTypes[1] = @"B2.png";
	brickTypes[2] = @"B3.png";
	brickTypes[3] = @"B4.png";
	brickTypes[4] = @"B5.png";
	brickTypes[5] = @"B6.png";
	brickTypes[6] = @"B7.png";
	
	int count = 0;
	for (int y=0; y<BRICKS_HEIGHT; y++) {
		for (int x=0; x<BRICKS_WIDTH; x++) {
			UIImage *image = [UIImage imageNamed:brickTypes[count++ % 7]];
			bricks[x][y] = [[[UIImageView alloc]initWithImage:image]autorelease];
			CGRect newFrame = bricks[x][y].frame;
			newFrame.origin = CGPointMake(x * 64, y * 32 + 100);
			bricks[x][y].frame = newFrame;
			[self.view addSubview:bricks[x][y]];
		}
	}
}
	
- (void)gameLogic
{
	ball.center = CGPointMake(ball.center.x+ballMovement.x, ball.center.y+ballMovement.y);
	
	BOOL paddleCollision = ball.center.y >= paddle.center.y - 16 &&
		ball.center.y <= paddle.center.y + 16 &&
		ball.center.x > paddle.center.x - 48 &&
		ball.center.x < paddle.center.x + 48;
	
	
	if (paddleCollision) {
		ballMovement.y = -ballMovement.y;
		if (ball.center.y >= paddle.center.y - 16 && ballMovement.y < 0) {
			ball.center = CGPointMake(ball.center.x, paddle.center.y - 16);
		} else if (ball.center.y <= paddle.center.y + 16 && ballMovement.y > 0) {
			ball.center = CGPointMake(ball.center.x, paddle.center.y + 16);
		} else if (ball.center.x >= paddle.center.x - 48 && ballMovement.x < 0) {
			ball.center = CGPointMake(paddle.center.x - 48, ball.center.y);
		} else if (ball.center.x <= paddle.center.x + 48 && ballMovement.x > 0) {
			ball.center = CGPointMake(paddle.center.x + 48, ball.center.y);
		}
	}
	
	BOOL there_are_solid_bricks = NO;
	for (int y=0; y<BRICKS_HEIGHT; y++) 
	{
		for (int x=0; x<BRICKS_WIDTH; x++) 
		{
			if (1.0 == bricks[x][y].alpha) 
			{
				there_are_solid_bricks = YES;
				if (CGRectIntersectsRect(ball.frame, bricks[x][y].frame)) 
				{
					[self processCollision:bricks[x][y]];
                    [self playSound];
				}
			}
			else 
			{
				if (bricks[x][y].alpha > 0) bricks[x][y].alpha -= 0.1;
			}
		}
	}
	
	if (!there_are_solid_bricks) {
		[theTimer invalidate];
		isPlaying = NO;
	}
	 
	if (ball.center.x > 307 || ball.center.x < 13) ballMovement.x = -ballMovement.x;
	if (ball.center.y < 33) ballMovement.y = -ballMovement.y;
	if (ball.center.y > 447) {
		[self pauseGame];
		isPlaying = NO;
	}
}

- (void)processCollision:(UIImageView *)brick
{
	score += 10;
	scoreLabel.text = [NSString stringWithFormat:@"%d",score];
	//ballMovement.x = -ballMovement.x;
	ballMovement.y = -ballMovement.y;
	//if (ballMovement.x > 0 && brick.frame.origin.x - ball.center.x <= 4) ballMovement.x = -ballMovement.x;
	//else if (ballMovement.x <0 && ball.center.x - (brick.frame.origin.x + brick.frame.size.width) <= 4) ballMovement.x = -ballMovement.x;
	//if (ballMovement.y > 0 && brick.frame.origin.y - ball.center.y <= 4) ballMovement.y = -ballMovement.y;
	//else if (ballMovement.y <0 && ball.center.y - (brick.frame.origin.y + brick.frame.size.height) <= 4) ballMovement.y = -ballMovement.y;
	brick.alpha -= 0.1;
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
	
	[self initializeBricks];
    [self playMusic];
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

- (void)playMusic {
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *path = [bundle pathForResource:@"Story" ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:path];
    
    player = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
    [player setNumberOfLoops:10];
    [player play];
}

- (void)playSound
{
    //存放聲音ID的變數
    SystemSoundID soundID;
    
    //取得音訊檔的路徑
    NSURL *file_url = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"sound" ofType:@"wav"]];
    
    //製作系統音效
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)file_url, &soundID);
    
    //播放系統音效
    AudioServicesPlaySystemSound(soundID);
}


@end
