//
//  AnimationViewController.h
//  Animation
//
//  Created by Jarvis Ao Ieong on 17/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnimationViewController : UIViewController{
    IBOutlet UIImageView *football;
    int speedX, speedY;
    float radian;
    int x, y;
    float radio;
}
-(void)move;

@end
