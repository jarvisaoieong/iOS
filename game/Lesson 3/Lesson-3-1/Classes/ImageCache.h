//
//  ImageCache.h
//  Lesson-2-2
//
//  Created by Ray Wong on 11年11月23日.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ImageCache : NSObject {

}

+ (UIImage *)loadImage:(NSString *)imageName;
+ (void)releaseCache;

@end
