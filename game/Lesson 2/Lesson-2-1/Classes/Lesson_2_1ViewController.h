//
//  Lesson_2_1ViewController.h
//  Lesson-2-1
//
//  Created by Ray Wong on 11年11月25日.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GameView.h"

@interface Lesson_2_1ViewController : UIViewController {
	GameView *_gameView;
}

@property (nonatomic, retain) GameView *_gameView;

- (IBAction) loadGameView;

@end

