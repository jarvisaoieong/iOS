//
//  Lesson_1_5ViewController.m
//  Lesson-1-5
//
//  Created by Ray Wong on 11年11月22日.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Lesson_1_5ViewController.h"

@implementation Lesson_1_5ViewController

- (IBAction)changeView
{
	UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 480)];
	view1.backgroundColor = [UIColor whiteColor];
	[self.view addSubview:view1];
	
	CATransition *transition = [CATransition animation];
	transition.duration = 5.0;
	transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
	transition.type = kCATransitionMoveIn;
	transition.subtype = kCATransitionFromRight;
	[self.view.layer addAnimation:transition forKey:nil];
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


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


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
