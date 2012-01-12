//
//  TitleLayer.m
//  Lesson-8-1
//
//  Created by Ray Wong on 11年12月30日.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "TitleLayer.h"
#import "HelloWorldLayer.h"

@implementation TitleLayer

+ (id)scene
{
    CCScene *scene = [CCScene node];
    TitleLayer *layer = [TitleLayer node];
    [scene addChild:layer];
    return scene;
}

- (id)init
{
    if (self = [super init]) {
        CCSprite *backgroundSprite = [CCSprite spriteWithFile:@"title.png"];
        backgroundSprite.position = ccp(160,240);
        [self addChild:backgroundSprite];
        
        self.isTouchEnabled = YES;
    }
    return self;
}

- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    CCScene *scene = [HelloWorldLayer scene];
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0f scene:scene]];
}

@end
