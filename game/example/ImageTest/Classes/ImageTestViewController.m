//
//  ImageTestViewController.m
//  ImageTest
//
//  Created by Ray Wong on 03/12/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ImageTestViewController.h"

@implementation ImageTestViewController

@synthesize imageView;



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
	
	NSMutableArray *array = [[NSMutableArray alloc]init];
	[array addObject:[UIImage imageNamed:@"1.png"]];
	[array addObject:[UIImage imageNamed:@"2.png"]];
	[array addObject:[UIImage imageNamed:@"3.png"]];
	[array addObject:[UIImage imageNamed:@"4.png"]];
	[array addObject:[UIImage imageNamed:@"5.png"]];
	[array addObject:[UIImage imageNamed:@"6.png"]];
	
	imageView.animationImages = array;
	
	imageView.animationDuration = 10.0;
	imageView.animationRepeatCount = 0;
	[imageView startAnimating];
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
	[imageView release];
    [super dealloc];
}

@end
