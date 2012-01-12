//
//  DatabaseExampleViewController.h
//  DatabaseExample
//
//  Created by Chileung on 11年11月18日.
//  Copyright 2011 MTel Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMDatabase.h"

@interface DatabaseExampleViewController : UIViewController {
	FMDatabase* bookmarkDB;
	NSString *databaseName;
}

@property(nonatomic, retain)FMDatabase *bookmarkDB;
@property(nonatomic, retain)NSString *databaseName;



-(BOOL)openDatabase;
-(void)checkDatabaseExist;

@end

