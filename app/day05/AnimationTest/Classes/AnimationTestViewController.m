//
//  AnimationTestViewController.m
//  AnimationTest
//
//  Created by Chileung on 11年11月11日.
//  Copyright 2011 MTel Ltd. All rights reserved.
//

#import "AnimationTestViewController.h"

@implementation AnimationTestViewController



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
	image.alpha = 0.0f;
	[UIView beginAnimations:@"fade in" context:nil];
	[UIView setAnimationDuration:4.0f];
	[UIView setAnimationDelay:1.0f];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(enlargeImage)];
	image.alpha = 1.0f;
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
    [super dealloc];
}

- (void)enlargeImage{
	[UIView beginAnimations:@"enlarge" context:nil];
	[UIView setAnimationDuration:3.0f];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(moveImage)];
	image.frame = CGRectMake(image.frame.origin.x, image.frame.origin.y, image.frame.size.width*1.5, image.frame.size.height*1.5);
	[UIView commitAnimations];
}

- (void)moveImage{
	[UIView beginAnimations:@"move" context:nil];
	[UIView setAnimationDuration:3.0f];
	image.frame = CGRectMake(-image.frame.size.width+320, -image.frame.size.height+480, image.frame.size.width, image.frame.size.height);
	[UIView commitAnimations];
}

@end
