//
//  DetailPageViewController.h
//  RSSExample2
//
//  Created by Chileung on 11年11月12日.
//  Copyright 2011 MTel Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DetailPageViewController : UIViewController {
	IBOutlet UIWebView *web;
	NSString *urlStr;
}

@property(nonatomic, retain) NSString *urlStr;

@end
