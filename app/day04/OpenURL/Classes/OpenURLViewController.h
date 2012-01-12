//
//  OpenURLViewController.h
//  OpenURL
//
//  Created by Algebra Lo on 5/11/11.
//  Copyright 2011 MTel Limited. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OpenURLViewController : UIViewController <UIAlertViewDelegate> {

}

-(IBAction)openWeb:(UIButton *)button;
-(IBAction)openEmail:(UIButton *)button;
-(IBAction)openTel:(UIButton *)button;

@end

