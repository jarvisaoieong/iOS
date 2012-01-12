//
//  PopoverTestViewController.m
//  PopoverTest
//
//  Created by Chileung on 11年11月11日.
//  Copyright 2011 MTel Ltd. All rights reserved.
//

#import "PopoverTestViewController.h"

@implementation PopoverTestViewController


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
	
}



// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
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
    [super dealloc];
}

-(IBAction)showPopover:(id)sender{
	popup = [[PopupViewController alloc] initWithNibName:@"PopupViewController" bundle:nil];	
	popup.delegate = self;
	popover = [[UIPopoverController alloc] initWithContentViewController:popup];
	[popover presentPopoverFromRect:((UIButton *)sender).frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

-(void)btnClick{
	[popover dismissPopoverAnimated:TRUE];
}

@end
