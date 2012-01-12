//
//  RootViewController.m
//  RSSExample2
//
//  Created by Chileung on 11年11月12日.
//  Copyright 2011 MTel Ltd. All rights reserved.
//

#import "RootViewController.h"


@implementation RootViewController

@synthesize bookmarkDB;
@synthesize databaseName;

#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];
	arryData = [[NSMutableArray alloc] init];
	urlData = [[NSMutableArray alloc] init];
	
	[loading startAnimating];
	[self performSelector:@selector(stopLoading) withObject:nil afterDelay:5.0f];
}


/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}
*/

/*
 // Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
 */

#pragma mark -
#pragma mark ASIHTTPRequestDelegate
-(void) requestFinished:(ASIHTTPRequest *)request {
	NSLog(@"data received : %@", [request responseString]);
	int num_of_item = [PerformXMLXPathQuery([request responseData], @"//item") count];
	for (int i =0; i<num_of_item; i++) {
		NSString *title = [[PerformXMLXPathQuery([request responseData], [NSString stringWithFormat:@"//item[%d]/title/text()", i+1]) objectAtIndex:0] objectForKey:@"nodeContent"];
		NSString *url = [[PerformXMLXPathQuery([request responseData], [NSString stringWithFormat:@"//item[%d]/link/text()", i+1]) objectAtIndex:0] objectForKey:@"nodeContent"];
		[arryData addObject:title];
		[urlData addObject:url];
		[bookmarkDB executeUpdate:@"Insert into yahoo ('title', 'url') values (?, ?)", title, url];
	
	}
	[self.tableView reloadData];
}

-(void) requestFailed:(ASIHTTPRequest *)request {
	NSLog(@"data download failed");
}


#pragma mark -
#pragma mark Table view data source

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [arryData count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
	// Configure the cell.
	cell.textLabel.text = [arryData objectAtIndex:indexPath.row];
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIBarButtonItem *_backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
	self.navigationItem.backBarButtonItem = _backButton;
	DetailPageViewController *page = [[DetailPageViewController alloc] initWithNibName:@"DetailPageViewController" bundle:nil];
	page.urlStr = [urlData objectAtIndex:indexPath.row];
	[self.navigationController pushViewController:page animated:TRUE];
	[page release];
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
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

-(void)stopLoading{
	[loading stopAnimating];
	[UIView beginAnimations:@"loading fade out" context:nil];
	[UIView setAnimationDuration:2.0f];
	loading.alpha = 0.0f;
	[UIView commitAnimations];
	[self performSelector:@selector(loadTable)];
}

-(void) loadTable {
	int count;
	databaseName = @"rss.sqlite";
	[self openDatabase];
	FMResultSet *rs = [bookmarkDB executeQuery:@"SELECT COUNT(*) FROM yahoo", nil];
	if ([rs next]) {
		count = [rs intForColumnIndex:0];
	}	
	if(count != 0){
		NSLog(@"load in db");
		FMResultSet *rs = [bookmarkDB executeQuery:@"select * from yahoo", nil];
		while([rs next]){
			[arryData addObject:[rs stringForColumn:@"title"]];
			[urlData addObject:[rs stringForColumn:@"url"]];
		}
		[self.tableView reloadData];
		
	} else {
		NSLog(@"load in net");
		ASIHTTPRequest *request = [[ASIHTTPRequest alloc] initWithURL:[NSURL URLWithString:@"http://hk.news.yahoo.com/rss/hongkong/rss.xml"]];
		request.delegate = self;
		[request setDidFinishSelector:@selector(requestFinished:)];
		[request setDidFailSelector:@selector(requestFailed:)];
		[request start];
	}
	[rs close];
}


@end

