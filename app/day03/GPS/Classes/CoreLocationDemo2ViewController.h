//
//  CoreLocationDemo2ViewController.h
//  CoreLocationDemo2
//
//  Created by MTel on 22/01/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface CoreLocationDemo2ViewController : UIViewController <CLLocationManagerDelegate> {
	CLLocationManager *locMgr;
}

@property (nonatomic, retain) CLLocationManager *locMgr;

@end

