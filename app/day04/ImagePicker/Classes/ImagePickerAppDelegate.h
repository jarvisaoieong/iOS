//
//  ImagePickerAppDelegate.h
//  ImagePicker
//
//  Created by Algebra Lo on 4/11/11.
//  Copyright 2011 MTel Limited. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ImagePickerViewController;

@interface ImagePickerAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ImagePickerViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ImagePickerViewController *viewController;

@end

