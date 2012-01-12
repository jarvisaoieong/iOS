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
#import "FMDatabase.h"

@interface RootViewController : UITableViewController<ASIHTTPRequestDelegate> {
	NSMutableArray *arryData;
	NSMutableArray *urlData;
	FMDatabase* bookmarkDB;
	NSString *databaseName;
	IBOutlet UIActivityIndicatorView *loading;
}

@property(nonatomic, retain)FMDatabase *bookmarkDB;
@property(nonatomic, retain)NSString *databaseName;

-(BOOL)openDatabase;
-(void)checkDatabaseExist;

@end