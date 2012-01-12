//
//  PreferencesViewController.h
//  Preferences
//
//  Created by MTel on 22/01/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PreferencesViewController : UIViewController {
	IBOutlet UITextField *userInput;
	IBOutlet UIButton *saveBtn;
}

-(IBAction) saveText;

@end

