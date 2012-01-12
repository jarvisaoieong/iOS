//
//  Lesson_1_2ViewController.m
//  Lesson-1-2
//
//  Created by Ray Wong on 11年11月21日.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Lesson_1_2ViewController.h"

@implementation Lesson_1_2ViewController

@synthesize ball;

- (void)initializeTimer
{
	float theInterval = 1.0/30.0;
	[NSTimer scheduledTimerWithTimeInterval:theInterval
									 target:self
								   selector:@selector(animateBall:)
								   userInfo:nil
									repeats:YES];

}
- (void)animateBall:(NSTimer *)theTimer
{
	if (ball.center.x <= 200) {
		ball.center = CGPointMake(ball.center.x + ballMovement.x, ball.center.y + ballMovement.y);
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
	
	ballMovement = CGPointMake(2, 5);
	[self initializeTimer];
}



/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

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
	[ball release];
    [super dealloc];
}

@end
