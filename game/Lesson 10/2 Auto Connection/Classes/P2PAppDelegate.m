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
	//釋放session
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
	//[self showPeerPicker];
	
	//呼叫找尋Peer，找到則自動連線
	[self searchPeer];
	
	return YES;
}


#pragma mark -- GameKit --


- (void) searchPeer
{
	//更新狀態
	label.text = @"Search Peer.";
	
	//初始化session
	currentSession = [[GKSession alloc] initWithSessionID:@"P2P"
                                                                    displayName:nil
                                                                    sessionMode:GKSessionModePeer];
	
	//設定委派
	currentSession.delegate = self;
	[currentSession setDataReceiveHandler:self withContext:nil];
	
	//啓用session
	//嘗試連接Peer時會呼叫seesion:didReceiveConnectionRequestFromPeer:方法
	currentSession.available = YES;
}


- (IBAction) test
{
	//測試傳送設備的名稱
	NSString *udid = [UIDevice currentDevice].uniqueIdentifier;
	NSData *data = [udid dataUsingEncoding:NSUTF8StringEncoding];
	[self sendData:data];
}


- (void) receiveData:(NSData *)data
						fromPeer:(NSString *)peer
					 inSession: (GKSession *)session
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


#pragma mark -- GKSessionDelegate --

- (void) session:(GKSession *)session
didReceiveConnectionRequestFromPeer:(NSString *)peerID
{
	//更新狀態
	label.text = [NSString stringWithFormat:@"Request From %@.", peerID];
	
	//允許連接
	[session acceptConnectionFromPeer:peerID error:nil];
}


- (void) session:(GKSession *)session
						peer:(NSString *)peerID
	didChangeState:(GKPeerConnectionState)state
{
	//	Peer的状態
	//	0:GKPeerStateAvailable    有效(連接前)
	//	1:GKPeerStateUnavailable  無效
	//	2:GKPeerStateConnected    連接中
	//	3:GKPeerStateDisconnected 中斷連接
	//	4:GKPeerStateConnecting   待機中允許連接/無回應
	NSArray *states = [NSArray arrayWithObjects:@"Available", @"Unavailable", @"Connected", @"Disconnected", @"Connecting", nil];
	
	//狀態更新
	label.text = [NSString stringWithFormat:@"%@ State %@", peerID, [states objectAtIndex:state]];
	
	switch (state) {
		case GKPeerStateAvailable:
			//狀態更新
			label.text = [NSString stringWithFormat:@"Connect to %@.", peerID];
			//連接Peer
			[session connectToPeer:peerID withTimeout:15];
			break;
	}
}

@end
