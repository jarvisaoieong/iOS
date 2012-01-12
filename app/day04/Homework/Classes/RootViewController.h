//
//  RootViewController.h
//  Homework
//
//  Created by Jarvis on 11/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIHTTPRequest.h"
#import "XPathQuery.h"

@interface RootViewController : UITableViewController {
	NSArray *dataItems;
	ASIHTTPRequest *request;
}

@end
