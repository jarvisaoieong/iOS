//
//  GameTestViewController.m
//  GameTest
//
//  Created by Ray Wong on 03/12/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GameTestViewController.h"

@implementation GameTestViewController

@synthesize label1, label2, ball, bar;

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch = [touches anyObject];
	
	bar.center = CGPointMake([touch locationInView:self.view].x, bar.center.y);
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch = [touches anyObject];
	
	bar.center = CGPointMake([touch locationInView:self.view].x, bar.center.y);
}

- (void)move
{
	ball.center = CGPointMake(ball.center.x + speedX, ball.center.y + speedY);
	
	if (ball.center.x > 320 - ball.frame.size.height/2 || ball.center.x < ball.frame.size.height/2) {
		speedX = -speedX;
	}
	if (ball.center.y < ball.frame.size.height/2) {
		speedY = -speedY;
	}
	
	if (CGRectIntersectsRect(ball.frame, bar.frame)) {
		if (speedX > 0) {
			speedX += 1;
		} else {
			speedX -= 1;
		}
		if (speedY > 0) {
			speedY += 1;
		} else {
			speedY -= 1;
		}
		speedY = -speedY;
	}
	
	bar.center = CGPointMake(ball.center.x, bar.center.y);
	
	BOOL there_are_solid_bricks = NO;
	for (int y=0; y<4; y++) {
		for (int x=0; x<5; x++) {
			if (bricks[x][y].alpha > 0.1) {
				there_are_solid_bricks = YES;
				if (CGRectIntersectsRect(ball.frame, bricks[x][y].frame)) {
					bricks[x][y].alpha -= 0.2;
					speedY = -speedY;
					score += 1;
					label2.text = [NSString stringWithFormat:@"%05d",score];
					ball.frame = CGRectMake(ball.frame.origin.x, ball.frame.origin.y, ball.frame.size.width+1, ball.frame.size.height+1);
				}
			}
		}
	}
	
	if (!there_are_solid_bricks) {
		[timer invalidate];
	}
	
	if (ball.center.y > 460 - ball.frame.size.height/2) {
		speedY = -speedY;
		life--;
		speedY = -random() % 10;
		label1.text = [NSString stringWithFormat:@"%d",life];
		if (life == 0) {
			[timer invalidate];
			label1.text = @"Over";
		}
	}
}

- (void)initializeBricks
{
	brickType[0] = @"B1.png";
	
	for (int y=0; y<4; y++) {
		for (int x=0; x<5; x++) {
			UIImage *images = [UIImage imageNamed:brickType[0]];
			bricks[x][y] = [[[UIImageView alloc]initWithImage:images]autorelease];
			CGRect newFrame = bricks[x][y].frame;
			newFrame.origin = CGPointMake(x*64, y*28 + 100);
			bricks[x][y].frame = newFrame;
			[self.view addSubview:bricks[x][y]];
		}
	}
}


/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	timer = [NSTimer scheduledTimerWithTimeInterval:1.0/60.0
											 target:self
										   selector:@selector(move)
										   userInfo:nil
											repeats:YES];
	
	speedX = 3.0;
	speedY = 3.0;
	score = 0;
	life = 3;
	[self initializeBricks];
}




// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
	
	NSLog(@"%f",self.view.frame.size.width);
	
    return YES;
}



- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[label1 release];
	[label2 release];
	[ball release];
	[bar release];
    [super dealloc];
}

@end
