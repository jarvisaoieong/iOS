//
//  CircleGameViewController.m
//  CircleGame
//
//  Created by Jarvis Ao Ieong on 17/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CircleGameViewController.h"

@implementation CircleGameViewController

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    ballList = [[NSMutableArray alloc] init];
    removeBallList = [[NSMutableArray alloc] init];
    [self initializeTimer];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)initializeTimer
{
	float theInterval = 1.0/1.0;
	[NSTimer scheduledTimerWithTimeInterval:theInterval
									 target:self
								   selector:@selector(appear)
								   userInfo:nil
									repeats:YES];
    
}

-(void) appear{
    UIImage *image = [UIImage imageNamed:@"football.png"];
    UIImageView *imageView = [[[UIImageView alloc] initWithImage:image] autorelease];
    imageView.frame = CGRectMake(random() % 320, random() % 480, 50, 50);
    [ballList addObject:imageView];
    [self.view addSubview:imageView];
    NSLog(@"%d", [ballList count]);
    if ([ballList count] > 10) {
        NSLog(@"you lose");
    }
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    CGRect frame = CGRectMake([touch locationInView:touch.view].x, [touch locationInView:touch.view].y, 5, 5);
    for (UIImageView *ball in ballList) {
        if (CGRectIntersectsRect(ball.frame, frame)) 
        {
            [ball removeFromSuperview];
            [removeBallList addObject:ball];
        }        
    }
    for (UIImageView *ball in removeBallList) {
        [ballList removeObject:ball];       
    }
    [removeBallList removeAllObjects];
    
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
