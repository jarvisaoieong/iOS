//
//  ASIViewController.m
//  ASI
//
//  Created by Algebra Lo on 5/11/11.
//  Copyright 2011 MTel Limited. All rights reserved.
//

#import "ASIViewController.h"

@implementation ASIViewController



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
	ASIHTTPRequest *request = [[ASIHTTPRequest alloc] initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://finance.yahoo.com/rss/topfinstories",6]]];
	request.delegate = self;
	[request setDidFinishSelector:@selector(abc:)];
	/*[request startSynchronous];
	NSLog(@"%@",[request responseString]);*/
	[request startAsynchronous];
	//....
	abc = [@"123" retain];
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
	[abc release];
    [super dealloc];
}

#pragma mark -
#pragma mark ASIHTTPRequestDelegate
-(void) abc:(ASIHTTPRequest *)request {
	NSLog(@"abc");
	[request release];
}

-(void) requestFinished:(ASIHTTPRequest *)request {
	NSLog(@"%@",[request responseString]);
	[request release];
}

-(void) requestFailed:(ASIHTTPRequest *)request {
	[request release];
	
}

@end
