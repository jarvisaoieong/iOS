//
//  HelloWorldLayer.h
//  Lesson-9-1
//
//  Created by Ray Wong on 12年1月1日.
//  Copyright __MyCompanyName__ 2012年. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import "Box2D.h"
#import "GLES-Render.h"

class b2Body;

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer
{
	b2World* world;
	GLESDebugDraw *m_debugDraw;
    
    b2Body *playerBody;
    
    int score;
    CCLabelTTF *scoreLabel;
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;
// adds a new sprite at a given coordinate
-(void) addNewSpriteWithCoords:(CGPoint)p isDot:(BOOL)isDot;

@end
