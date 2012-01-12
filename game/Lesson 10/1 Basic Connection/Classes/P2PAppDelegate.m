//
//  P2PAppDelegate.m
//  P2P
//
//  Copyright AGES5&UP 2010. All rights reserved.
//

#import "P2PAppDelegate.h"

@implementation P2PAppDelegate

@synthesize window;
@synthesize currentSession;

- (void) dealloc
{
	//釋放Session
	[currentSession disconnectFromAllPeers];
	currentSession.available = NO;
	[currentSession setDataReceiveHandler: nil withContext:nil];
	currentSession.delegate = nil;
	[currentSession release];
	
	[window release];
	[super dealloc];
}


#pragma mark -- UIApplicationDelegate --

- (BOOL) application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	[window makeKeyAndVisible];
	
	//呼叫動作
	[self showPeerPicker];
	
	return YES;
}


#pragma mark -- GameKit --

- (void) showPeerPicker
{
	//初始化GKPeerPickerController
	GKPeerPickerController* picker;
	picker = [[GKPeerPickerController alloc] init];
	
	//設定委派
	picker.delegate = self;
	
	//顯示Picker
	[picker show];
}


- (IBAction) test
{
	//測試傳送設備的名稱
	NSString *name = [UIDevice currentDevice].name;
	NSData *data = [name dataUsingEncoding:NSUTF8StringEncoding];
	[self sendData:data];
    
}


- (void) receiveData:(NSData *)data
						fromPeer:(NSString *)peer
					 inSession:(GKSession *)session
						 context:(void *)context
{
	//更新狀態
	label.text = [NSString stringWithFormat:@"receive %d(bytes) text:%@", [data length], [NSString stringWithCString:[data bytes] encoding:NSUTF8StringEncoding]];
}


- (void) sendData:(NSData *)data
{
	//更新狀態
	label.text = [NSString stringWithFormat:@"send %d(bytes) text:%@", [data length], [NSString stringWithCString:[data bytes] encoding:NSUTF8StringEncoding]];
	
	//傳送資料
	[currentSession sendDataToAllPeers:data
												withDataMode:GKSendDataUnreliable
															 error:nil];
}


#pragma mark -- GKPeerPickerControllerDelegate --

- (void) peerPickerController:(GKPeerPickerController *)picker
							 didConnectPeer:(NSString *)peerID
										toSession:(GKSession *)session
{
	//更新狀態
	label.text = [NSString stringWithFormat:@"%@ Connected.", peerID];
	
	//保存session
	self.currentSession = session;
	
	//設定委派
	currentSession.delegate = self;
	[currentSession setDataReceiveHandler:self withContext:nil];
	
	//刪除Picker
	picker.delegate = nil;
	[picker dismiss];
	[picker autorelease];
}


- (void) peerPickerControllerDidCancel:(GKPeerPickerController *)picker
{
	//更新狀態
	label.text = @"Canceled";
	
	//釋放Picker
	picker.delegate = nil;
	[picker autorelease];
}

@end
