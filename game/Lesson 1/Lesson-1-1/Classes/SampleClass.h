//
//  SampleClass.h
//  Lesson-1-1
//
//  Created by Ray Wong on 11年11月21日.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SampleClass : NSObject {
	float floatMember;
}

+ (void)classMethod;
+ (int)classMethodWithParameter:(int)intParam;
- (void)instanceMethod;
- (float)instanceMethodWithParaml:(float)floatParam andParam2:(int)intParam;

@end
