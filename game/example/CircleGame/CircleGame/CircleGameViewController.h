//
//  CircleGameViewController.h
//  CircleGame
//
//  Created by Jarvis Ao Ieong on 17/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleGameViewController : UIViewController{
    NSMutableArray *ballList;
    NSMutableArray *removeBallList;
}
- (void)initializeTimer;
@end