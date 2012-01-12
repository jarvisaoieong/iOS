//
//  PopupViewController.h
//  PopoverTest
//
//  Created by Chileung on 11年11月11日.
//  Copyright 2011 MTel Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PopupViewDelegate
- (void)btnClick;
@end


@interface PopupViewController : UIViewController {
	id<PopupViewDelegate> delegate;
}

@property(nonatomic, retain) id<PopupViewDelegate> delegate;

-(IBAction)confirmBtnClick;

@end
