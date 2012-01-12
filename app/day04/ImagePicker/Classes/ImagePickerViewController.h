//
//  ImagePickerViewController.h
//  ImagePicker
//
//  Created by Algebra Lo on 4/11/11.
//  Copyright 2011 MTel Limited. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImagePickerViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate> {
	IBOutlet UIImageView *image;
}

-(IBAction)getImage:(UIButton *)button;

@end

