//
//  MapKitDisplayViewController.h
//  MapKitDisplay
//
//  Created by Chakra on 12/07/10.
//  Copyright Chakra Interactive Pvt Ltd 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@class DisplayMap;

@interface MapKitDisplayViewController : UIViewController <MKMapViewDelegate,CLLocationManagerDelegate> {
	
	IBOutlet MKMapView *mapView;
	CLLocationManager *locMgr;
}
@property (nonatomic, retain) IBOutlet MKMapView *mapView;
@property (nonatomic, retain) CLLocationManager *locMgr;

@end

