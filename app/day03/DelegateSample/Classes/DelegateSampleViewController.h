

#import <UIKit/UIKit.h>
#import "UIViewPassValueDelegate.h"
@interface DelegateSampleViewController : UIViewController <UIViewPassValueDelegate>
{
    IBOutlet UILabel* label;
}


- (IBAction)buttonClick:(id)sender;

@end

