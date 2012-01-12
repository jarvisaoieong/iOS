//
//  AnimationViewController.m
//  Animation
//
//  Created by Jarvis Ao Ieong on 17/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AnimationViewController.h"

@implementation AnimationViewController

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
    x = y = 3;
    radio = 10 * 3.14 / 180;
    [NSTimer scheduledTimerWithTimeInterval:1.0/20.0
                                     target:self
                                   selector:@selector(move)
                                   userInfo:nil
                                    repeats:YES];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(void) move {
    speedX += x;
    speedY += y;
    radian += radio;

    CGAffineTransform transform = CGAffineTransformIdentity;
    transform = CGAffineTransformTranslate(transform, speedX, speedY);
    transform = CGAffineTransformRotate(transform, radian);
    football.transform = transform;
    if (football.center.x + speedX > 270) {
        x = -x;
        if (y * radio < 0) {
            radio = - radio;
        }
    }
    if (football.center.x + speedX < 50) {
        x = -x;
        if (y * radio > 0) {
            radio = - radio;
        }
    }
    if (football.center.y + speedY > 410 || football.center.y + speedY < 50) {
        y = -y;
        //radio = -radio;
    }
    NSLog(@"%f", football.center.x + speedX);
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
