//
//  ASI2ViewController.m
//  ASI2
//
//  Created by Jarvis on 5/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ASI2ViewController.h"

@implementation ASI2ViewController



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
	ASIHTTPRequest* request = [[ASIHTTPRequest alloc] initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://finance.yahoo.com/rss/topfinstories"]]];
	request.delegate = self;
	[request startAsynchronous];
	//NSLog(@"%@", [request responseString]);
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

-(void) requestFinished:(ASIHTTPRequest *)request{
	NSArray* items = PerformXMLXPathQuery([request responseData], @"//item");
	NSLog(@"%d", [items count]);
	NSMutableDictionary* record = [NSMutableDictionary new];
	NSArray* title = PerformXMLXPathQuery([request responseData], @"//item[1]/title/text()");
	//NSLog(@"%@", [[title objectAtIndex:0] objectForKey:@"nodeName"]);
	//NSLog(@"%@", [[title objectAtIndex:0] objectForKey:@"nodeContent"]);
	[record setObject:[[title objectAtIndex:0] objectForKey:@"nodeContent"] forKey:@"title"];
	NSLog(@"%@", [record objectForKey:@"title"]);
	[record release];
	[request release];
}

-(void) requestFailed:(ASIHTTPRequest *)request{

}

@end
