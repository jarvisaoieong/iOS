//
//  ViewController.m
//  Lesson-7-1
//
//  Created by Ray Wong on 11年12月28日.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (IBAction)playSound:(id)sender
{
    [player play];
}

- (IBAction)pauseSound:(id)sender
{
    [player pause];
}

- (IBAction)stopSound:(id)sender
{
    [player stop];
    [self initSound];
}

- (void)initSound {
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *path = [bundle pathForResource:@"Story" ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:path];
    
    player = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
    [player setNumberOfLoops:10];
}

- (IBAction)playSound2:(id)sender
{
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *path = [bundle pathForResource:@"Story" ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:path];
    
    player2 = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
    [player2 setNumberOfLoops:10];
    [player2 playAtTime:3];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initSound];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
