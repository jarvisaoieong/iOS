//
//  TouchTestViewController.h
//  TouchTest
//
//  Created by Ray Wong on 03/12/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageView.h"

@interface TouchTestViewController : UIViewController {
	UILabel *label;
	ImageView *imageView;
}

@property (nonatomic, retain) IBOutlet UILabel *label;

@end

