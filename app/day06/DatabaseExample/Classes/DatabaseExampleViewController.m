//
//  DatabaseExampleViewController.m
//  DatabaseExample
//
//  Created by Chileung on 11年11月18日.
//  Copyright 2011 MTel Ltd. All rights reserved.
//

#import "DatabaseExampleViewController.h"

@implementation DatabaseExampleViewController

@synthesize bookmarkDB;
@synthesize databaseName;


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
	databaseName = @"bookmarkdb.sqlite";
	[self openDatabase];
		[bookmarkDB executeUpdate:@"Insert into common_bookmark ('item_id', 'cate') values ('1', 'test')", nil];
		NSLog(@"%@", @"check point 1");
		FMResultSet *rs = [bookmarkDB executeQuery:@"select * from common_bookmark", nil];
		NSLog(@"%@", @"check point 2");
		if(rs != nil){
			while([rs next]){
				NSLog(@"item : %@", [rs stringForColumn:@"item_id"]);
			}
		}
		[rs close];
	
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

-(BOOL)openDatabase{
	//NSLog(@"start openDatabase");
	//Open Database
	[self checkDatabaseExist];
	NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
	NSString *path = [documentPaths objectAtIndex:0];
	NSString *databasePath = [path stringByAppendingPathComponent:databaseName];
	NSLog(@"databasePath : %@", databasePath);
	bookmarkDB = [FMDatabase databaseWithPath:databasePath];
	if (![bookmarkDB open]) {
		[bookmarkDB release];
		NSLog(@"openDatabase false");
		return FALSE;
	}else{
		[bookmarkDB retain];
		[bookmarkDB setLogsErrors:TRUE];
		[bookmarkDB setTraceExecution:TRUE];
		NSLog(@"openDatabase true");
		return TRUE;
	}
}

-(void)checkDatabaseExist{
	BOOL success;
	NSError *error;
	
	//FileManager - Object allows easy access to the File System.
	NSFileManager *FileManager = [NSFileManager defaultManager];
	
	//Get the complete users document directory path.
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
	
	//Get the first path in the array.
	NSString *documentsDirectory = [paths objectAtIndex:0];
	
	//Create the complete path to the database file.
	NSString *databasePath = [documentsDirectory stringByAppendingPathComponent:databaseName];
	
	//Check if the file exists or not.
	success = [FileManager fileExistsAtPath:databasePath];
	
	//If the database is present then quit.
	if(success) return;
	
	//the database does not exists, so we will copy it to the users document directory]
	NSString *dbPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:databaseName];
	
	//Copy the database file to the users document directory.
	success = [FileManager copyItemAtPath:dbPath toPath:databasePath error:&error];
	
	//If the above operation is not a success then display a message.
	//Error message can be seen in the debugger's console window.
	//[FileManager release];
	if(!success)
		NSAssert1(0, @"Failed to copy the database. Error: %@.", [error localizedDescription]);
}

@end
