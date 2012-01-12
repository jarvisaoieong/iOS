//
//  Lesson_3_1ViewController.m
//  Lesson-3-1
//
//  Created by Ray Wong on 11年11月25日.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Lesson_3_1ViewController.h"
#import "ImageCache.h"
#import "NSTimerAnimation.h"

@implementation Lesson_3_1ViewController

@synthesize imageView;

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
	
	
	NSMutableArray *images = [[NSMutableArray alloc]initWithCapacity:10];
	for (int i = 1; i <= 10; i++) {
		NSString *imageName = [NSString stringWithFormat:@"%d.png",i];
		UIImage *image = [ImageCache loadImage:imageName];
		[images addObject:image];
	}
	
	imageView.animationImages = images;
	[images release];
	
	imageView.animationDuration = 1;
	imageView.animationRepeatCount = 0;
	[imageView startAnimating];
	
	
	/*
	 NSTimerAnimation *_imageView = [[NSTimerAnimation alloc]init];
	 _imageView.frame = CGRectMake(0, 0, 110, 150);
	 _imageView.backgroundColor = [UIColor blackColor];
	 [self.view addSubview:_imageView];
	 [_imageView release];
	 
	 NSMutableArray *images = [[NSMutableArray alloc]initWithCapacity:10];
	 for (int i = 1; i <= 10; i++) {
	 NSString *imageName = [NSString stringWithFormat:@"%d.png",i];
	 UIImage *image = [ImageCache loadImage:imageName];
	 [images addObject:image];
	 }
	 
	 _imageView.animationImages = images;
	 [images release];
	 
	 [_imageView setAnimationInterval:1.0/10.0];
	 _imageView.animationDuration = 10;
	 _imageView.animationRepeatCount = 1;
	 [_imageView startAnimating];
	 */
	
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
	[imageView release];
    [super dealloc];
}

@end
