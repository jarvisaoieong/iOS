//
//  PopoverTestViewController.h
//  PopoverTest
//
//  Created by Chileung on 11年11月11日.
//  Copyright 2011 MTel Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PopupViewController.h"

@interface PopoverTestViewController : UIViewController <PopupViewDelegate> {
	PopupViewController *popup;
	UIPopoverController *popover;
}

-(IBAction)showPopover:(id)sender;

@end

