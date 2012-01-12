//
//  HelloWorldLayer.m
//  Lesson-8-1
//
//  Created by Ray Wong on 11年12月29日.
//  Copyright __MyCompanyName__ 2011年. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// HelloWorldLayer implementation
@implementation HelloWorldLayer

- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if (!isGameOver) return;
    
    [self removeAllChildrenWithCleanup:YES];
    
    myShip = [CCSprite spriteWithFile:@"ship.png"];
    myShip.position = ccp(160, 80);
    [self addChild:myShip];
    
    numOfMeteo = 0;
    
    isGameOver = NO;
}

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{
    CGPoint newPosition = myShip.position;
    
    newPosition.x += acceleration.x * 5;
    if (newPosition.x < 0) newPosition.x = 0;
    if (newPosition.x > 320) newPosition.x = 320;
    
    newPosition.y += acceleration.y * 5;
    if (newPosition.y < 0) newPosition.y = 0;
    if (newPosition.y > 480) newPosition.y = 480;
    
    myShip.position = newPosition;
}

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
		myShip = [CCSprite spriteWithFile:@"ship.png"];
        myShip.position = ccp(160, 80);
        [self addChild:myShip];
        
        self.isAccelerometerEnabled = YES;
        [[UIAccelerometer sharedAccelerometer]setUpdateInterval:(1.0/60.0)];
        
        [self schedule:@selector(handleTimerEvent) interval:1.0/60.0];
        
        self.isTouchEnabled = YES;
	}
	return self;
}

- (void)handleTimerEvent
{
    if (random() % 60 == 0 && numOfMeteo < MAX_METEO) {
        meteo[numOfMeteo] = [CCSprite spriteWithFile:@"meteo.png"];
        meteo[numOfMeteo].position = ccp(random() % 320, 500);
        [self addChild:meteo[numOfMeteo]];
        
        id moveAction = [CCMoveTo actionWithDuration:4 position:ccp(random() % 320, -30)];
        id rotateAction = [CCRotateTo actionWithDuration:4 angle:180];
        id action = [CCSpawn actions:moveAction, rotateAction, nil];
        [meteo[numOfMeteo] runAction:action];
        
        numOfMeteo++;
    }
    
    for (int i = 0; i < numOfMeteo; i++) {
        if ([self distanceFromPoint:myShip.position toPoint:meteo[i].position] < 50) {
            if (isGameOver == NO) {
                [self gameOver];
                isGameOver = YES;
            }
        }
        
        if (meteo[i].position.y < 0) {
            [self removeChild:meteo[i] cleanup:YES];
            meteo[i] = meteo[numOfMeteo - 1];
            numOfMeteo--;
            i--;
        }
    }
}

- (float)distanceFromPoint:(CGPoint)p1 toPoint:(CGPoint)p2
{
    return sqrt((p2.x - p1.x) * (p2.x - p1.x) + (p2.y - p1.y) * (p2.y - p1.y));
}

- (void)gameOver
{
    myShip.visible = NO;
    
    CCParticleExplosion *explosion = [CCParticleExplosion node];
    explosion.position = myShip.position;
    explosion.texture = [[[CCTexture2D alloc]initWithImage:[UIImage imageNamed:@"fire.png"]]autorelease];
    
    explosion.speed = 300;
    explosion.life = 1;
    explosion.blendAdditive = YES;
    explosion.autoRemoveOnFinish = YES;
    [self addChild:explosion];
    
    CCSprite *gameOverSprite = [CCSprite spriteWithFile:@"gameover.png"];
    gameOverSprite.position = ccp(160,300);
    [self addChild:gameOverSprite z:1];
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
