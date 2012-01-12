//
//  Lesson_1_3ViewController.m
//  Lesson-1-3
//
//  Created by Ray Wong on 11年11月21日.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Lesson_1_3ViewController.h"

@implementation Lesson_1_3ViewController

@synthesize ball;


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
	
	[self goDown];
}

-(void) goDown{
	[UIView beginAnimations:@"goDown" context:nil];
	[UIView setAnimationDuration:1.0];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(goUp)];
	ball.center = CGPointMake(arc4random() % 320, arc4random() % 480);
	[UIView commitAnimations];
}

-(void) goUp{
	[UIView beginAnimations:@"goUp" context:nil];
	[UIView setAnimationDuration:1.0];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(goDown)];
	ball.center = CGPointMake(arc4random() % 320, arc4random() % 480);
	[UIView commitAnimations];
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
