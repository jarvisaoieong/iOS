

#import "ValueInputView.h"


@implementation ValueInputView

@synthesize delegate;
@synthesize value = _value;
- (void)dealloc {
    [self.value release];
    [super dealloc];
}

- (IBAction)buttonClick:(id)sender
{
	UIButton *btn = (UIButton *)sender;
	NSString* tag = [btn currentTitle];
//	NSString* output = [NSString stringWithFormat:@"%i",tag];
	NSLog(@"Tag: %d", tag);	

    [delegate passValue:tag];
	[self dismissModalViewControllerAnimated:true];
   
}
- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
	
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
}
*/


@end
