//
//  ASIViewController.h
//  ASI
//
//  Created by Algebra Lo on 5/11/11.
//  Copyright 2011 MTel Limited. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIHTTPRequest.h"

@interface ASIViewController : UIViewController <ASIHTTPRequestDelegate> {
	NSString *abc;
}

@end

