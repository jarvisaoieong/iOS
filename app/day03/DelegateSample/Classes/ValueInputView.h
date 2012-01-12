

#import <UIKit/UIKit.h>
#import "UIViewPassValueDelegate.h"

@interface ValueInputView : UIViewController {

    NSObject<UIViewPassValueDelegate> * delegate;
    UITextField *_value;
}

@property(nonatomic, retain)IBOutlet UITextField *value;
@property(nonatomic, retain) NSObject<UIViewPassValueDelegate> * delegate;

- (IBAction)buttonClick:(id)sender;

@end
