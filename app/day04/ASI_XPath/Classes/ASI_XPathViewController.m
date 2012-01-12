//
//  ASI_XPathViewController.m
//  ASI_XPath
//
//  Created by Algebra Lo on 4/11/11.
//  Copyright 2011 MTel Limited. All rights reserved.
//

#import "ASI_XPathViewController.h"

@implementation ASI_XPathViewController



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
	
	ASIHTTPRequest *request = [[ASIHTTPRequest alloc] initWithURL:[NSURL URLWithString:@"http://finance.yahoo.com/rss/topfinstories"]];
	request.delegate = self;
	[request startAsynchronous];
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

#pragma mark -
#pragma mark ASIHTTPRequest
-(void) requestFinished:(ASIHTTPRequest *)request {
	NSLog(@"%@",[request responseString]);
	NSArray *items = PerformXMLXPathQuery([request responseData], @"//item");
	NSLog(@"%d", [items count]);
	NSString *description = [[PerformXMLXPathQuery([request responseData], @"//item[1]/description/text()") objectAtIndex:0] objectForKey:@"nodeContent"];
	NSLog(@"%@",description);
	[request release];
}

-(void) requestFailed:(ASIHTTPRequest *)request {
	[request release];
}

@end
