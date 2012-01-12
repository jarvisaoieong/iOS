//
//  HelloWorldLayer.h
//  Lesson-8-1
//
//  Created by Ray Wong on 11年12月29日.
//  Copyright __MyCompanyName__ 2011年. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

#define MAX_METEO 10

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer
{
    CCSprite *myShip;
    
    int numOfMeteo;
    CCSprite *meteo[MAX_METEO];
    
    BOOL isGameOver;
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

- (float)distanceFromPoint:(CGPoint)p1 toPoint:(CGPoint)p2;
- (void)gameOver;

@end
