//
//  LoadingExampleViewController.m
//  LoadingExample
//
//  Created by Chileung on 11年11月19日.
//  Copyright 2011 MTel Ltd. All rights reserved.
//

#import "LoadingExampleViewController.h"

@implementation LoadingExampleViewController



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
	[loading startAnimating];
	[self performSelector:@selector(stopLoading) withObject:nil afterDelay:5.0f];
}
	 
-(void)stopLoading{
	[loading stopAnimating];
	[UIView beginAnimations:@"loading fade out" context:nil];
	[UIView setAnimationDuration:2.0f];
	loading.alpha = 0.0f;
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

@end
