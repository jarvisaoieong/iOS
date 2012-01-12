//
//  ImagePickerViewController.m
//  ImagePicker
//
//  Created by Algebra Lo on 4/11/11.
//  Copyright 2011 MTel Limited. All rights reserved.
//

#import "ImagePickerViewController.h"

@implementation ImagePickerViewController



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


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


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

-(void) getImage:(UIButton *)button {
	UIImagePickerController *picker = [[UIImagePickerController alloc] init];
	picker.delegate = self;
	picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
	//picker.sourceType = UIImagePickerControllerSourceTypeCamera;
	[self presentModalViewController:picker animated:TRUE];
	[picker release];
	
}

#pragma mark -
#pragma mark UIImagePickerControllerDelegate
-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
	[picker dismissModalViewControllerAnimated:TRUE];
	image.image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
	UIImageWriteToSavedPhotosAlbum(image.image, nil, nil, nil);
	// Create paths to output images
	NSString  *pngPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/Test.png"];
	NSString  *jpgPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/Test.jpg"];
	
	// Write a UIImage to JPEG with minimum compression (best quality)
	// The value 'image' must be a UIImage object
	// The value '1.0' represents image compression quality as value from 0.0 to 1.0
	[UIImageJPEGRepresentation(image, 1.0) writeToFile:jpgPath atomically:YES];
	
	// Write image to PNG
	[UIImagePNGRepresentation(image) writeToFile:pngPath atomically:YES];
	
	
}

@end
