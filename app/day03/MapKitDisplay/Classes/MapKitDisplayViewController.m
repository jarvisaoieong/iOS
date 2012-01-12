//
//  MapKitDisplayViewController.m
//  MapKitDisplay
//
//  Created by Chakra on 12/07/10.
//  Copyright Chakra Interactive Pvt Ltd 2010. All rights reserved.
//

#import "MapKitDisplayViewController.h"
#import "DisplayMap.h"

@implementation MapKitDisplayViewController

@synthesize mapView;
@synthesize locMgr;


/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
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
	
	[mapView setMapType:MKMapTypeStandard];
	[mapView setZoomEnabled:YES];
	[mapView setScrollEnabled:YES];
	MKCoordinateRegion region = { {0.0, 0.0 }, { 0.0, 0.0 } }; 
	region.center.latitude = 22.569722 ;
	region.center.longitude = 88.369722;
	region.span.longitudeDelta = 0.01f;
	region.span.latitudeDelta = 0.01f;
	[mapView setRegion:region animated:YES]; 
	
	[mapView setDelegate:self];
	
	DisplayMap *ann = [[DisplayMap alloc] init]; 
	ann.title = @" Kolkata";
	ann.subtitle = @"Mahatma Gandhi Road"; 
	ann.coordinate = region.center; 
	[mapView addAnnotation:ann];
	
	locMgr = [[CLLocationManager alloc] init];
	locMgr.delegate = self;
	[locMgr startUpdatingLocation];
	NSLog(@"location manager started");
}



-(MKAnnotationView *)mapView:(MKMapView *)mV viewForAnnotation:
 (id <MKAnnotation>)annotation {
//	MKPinAnnotationView *pinView = nil; 
//	if(annotation != mapView.userLocation) 
//	{
//		static NSString *defaultPinID = @"com.invasivecode.pin";
//		pinView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:defaultPinID];
//		if ( pinView == nil ) pinView = [[[MKPinAnnotationView alloc]
//										  initWithAnnotation:annotation reuseIdentifier:defaultPinID] autorelease];
//		pinView.image = [UIImage imageNamed:@"flag.png"];
//		//pinView.pinColor = MKPinAnnotationColorRed; 
//		pinView.canShowCallout = YES;
//		pinView.animatesDrop = YES;
//		} 
//	else {
//		[mapView.userLocation setTitle:@"I am here"];
//	}
//	return pinView;
	MKAnnotationView *annView=[[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"BOCPin"];
	annView.image = [UIImage imageNamed:@"flag.png"];
	annView.canShowCallout = TRUE;
	return [annView autorelease];
}


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


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
	[mapView release];
    [super dealloc];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
	MKCoordinateRegion region = { {0.0, 0.0 }, { 0.0, 0.0 } }; 
	region.center.latitude = newLocation.coordinate.latitude;
	region.center.longitude = newLocation.coordinate.longitude;
	region.span.longitudeDelta = 0.01f;
	region.span.latitudeDelta = 0.01f;
	[mapView setRegion:region animated:YES]; 
	[mapView setDelegate:self];
	
	DisplayMap *ann = [[DisplayMap alloc] init]; 
	ann.title = @"I am here";
	ann.subtitle = @"iOS course"; 
	ann.coordinate = region.center; 
	[mapView addAnnotation:ann];
	
	NSLog(@"location : %+.6f",  newLocation.coordinate.latitude);
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
	NSLog(@"Get location fail");
}

-(void) locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading {

}

@end
