//
//  TableViewExampleViewController.h
//  TableViewExample
//
//  Created by MTel on 15/01/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewExampleViewController : UIViewController <UITableViewDelegate,UITableViewDataSource> {
	IBOutlet UITableView *listTable;
	NSArray *arryData;
}

@end

