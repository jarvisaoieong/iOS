//
//  ViewController.m
//  Lesson-7-2
//
//  Created by Ray Wong on 11年12月28日.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (IBAction)playSound:(id)sender
{
    //存放聲音ID的變數
    SystemSoundID soundID;
    
    //取得音訊檔的路徑
    NSURL *file_url = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"sound" ofType:@"wav"]];
    
    //製作系統音效
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)file_url, &soundID);
    
    //播放系統音效
    AudioServicesPlaySystemSound(soundID);
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
