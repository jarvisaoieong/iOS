//
//  ScrollViewViewController.h
//  ScrollView
//
//  Created by Jarvis on 22/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollViewViewController : UIViewController {
	IBOutlet UIScrollView *sView;
	int currentX;
}

-(IBAction)goClick;

@end

