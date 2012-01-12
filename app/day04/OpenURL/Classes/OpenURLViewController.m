//
//  OpenURLViewController.m
//  OpenURL
//
//  Created by Algebra Lo on 5/11/11.
//  Copyright 2011 MTel Limited. All rights reserved.
//

#import "OpenURLViewController.h"

@implementation OpenURLViewController



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

-(void) openWeb:(UIButton *)button {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.youtube.com/watch?v=V0gNYQj_PPk&feature=topvideos_entertainment"]];
}

-(void) openEmail:(UIButton *)button {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"mailto:algebra_lo@mtelnet.com?subject=test&body=test"]];
}

-(void) openTel:(UIButton *)button {
	//[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://+85312345678"]];
	UIAlertView *alert_view = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"Do you want to phone?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Call",nil];
	[alert_view show];
	[alert_view release];
}

#pragma mark -
#pragma mark UIAlertViewDelegate
-(void) alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
	NSLog(@"%d",buttonIndex);
	if (buttonIndex==1) {
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://+85312345678"]];
	}
}

@end
