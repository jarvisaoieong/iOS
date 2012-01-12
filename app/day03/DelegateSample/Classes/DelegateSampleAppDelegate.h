

#import <UIKit/UIKit.h>

@class DelegateSampleViewController;

@interface DelegateSampleAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    DelegateSampleViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet DelegateSampleViewController *viewController;

@end

