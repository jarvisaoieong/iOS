//
//  ViewController.h
//  Lesson-7-1
//
//  Created by Ray Wong on 11年12月28日.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController
{
    AVAudioPlayer *player;
    AVAudioPlayer *player2;
}

- (IBAction)playSound:(id)sender;
- (IBAction)playSound2:(id)sender;
- (IBAction)pauseSound:(id)sender;
- (IBAction)stopSound:(id)sender;
- (void)initSound;

@end
