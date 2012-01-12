//
//  SampleClass.m
//  Lesson-1-1
//
//  Created by Ray Wong on 11年11月21日.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SampleClass.h"


@implementation SampleClass

static int intMember;

+ (void)classMethod
{
	NSLog(@"inside classMethod");
}

+ (int)classMethodWithParameter:(int)intParam
{
	intMember = intParam;
	return intParam;
}

- (void)instanceMethod
{
	NSLog(@"inside instanceMethod");
}

- (float)instanceMethodWithParaml:(float)floatParam andParam2:(int)intParam;
{
	floatMember = floatParam;
	intMember = intParam;
	return floatParam * intParam;
}

@end
