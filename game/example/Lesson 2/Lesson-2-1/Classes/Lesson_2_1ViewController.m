//
//  Lesson_2_1ViewController.m
//  Lesson-2-1
//
//  Created by Ray Wong on 11年11月25日.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Lesson_2_1ViewController.h"

@implementation Lesson_2_1ViewController

@synthesize _gameView;


- (IBAction) loadGameView {
	_gameView = [[GameView alloc]initWithNibName:@"GameView" bundle:[NSBundle mainBundle]];
	_gameView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:_gameView animated:YES];
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
