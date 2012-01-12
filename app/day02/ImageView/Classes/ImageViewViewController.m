//
//  ImageViewViewController.m
//  ImageView
//
//  Created by Jarvis on 22/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ImageViewViewController.h"

@implementation ImageViewViewController



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
	logo.image = [UIImage imageNamed:@"image.JPG"];	
	[logo sizeToFit];
	
	logo.alpha = 0.0f;
	[UIView beginAnimations:@"fade in" context:nil];
	[UIView setAnimationDuration:4.0f];
	[UIView setAnimationDelay:1.0f];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(enlargeImage)];
	logo.alpha = 1.0f;
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

-(void) enlargeImage {
	[UIView beginAnimations:@"large" context:nil];
	[UIView setAnimationDuration:2.0f];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(moveToBottom)];
	//logo.transform = CGAffineTransformMakeTranslation(0, 0);
	//logo.center = CGPointMake(100.0, 100.0);
	[UIView commitAnimations];
}

-(void) moveToBottom {
	[UIView beginAnimations:@"move" context:nil];
	[UIView setAnimationDuration:2.0f];
	//logo.transform = CGAffineTransformMakeTranslation(0, 0);
	logo.center = CGPointMake(80.0, 60.0);
	[UIView commitAnimations];
}

@end
