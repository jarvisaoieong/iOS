//
//  RootViewController.h
//  RSSExample2
//
//  Created by Chileung on 11年11月12日.
//  Copyright 2011 MTel Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIHTTPRequest.h"
#import "DetailPageViewController.h"

@interface RootViewController : UITableViewController<ASIHTTPRequestDelegate> {
	NSMutableArray *arryData;
	NSMutableArray *urlData;
	
}

@end
