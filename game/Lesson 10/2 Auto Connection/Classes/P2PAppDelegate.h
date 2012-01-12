//
//  P2PAppDelegate.h
//  P2P
//
//  Copyright AGES5&UP 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GameKit/GameKit.h>


@interface P2PAppDelegate : NSObject
<UIApplicationDelegate, GKSessionDelegate>
{
	UIWindow *window;
	IBOutlet UILabel *label; //表示結果的標簽
	
	GKSession *currentSession; //Session
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) GKSession *currentSession;


- (void) searchPeer; //顯示peer
- (void) sendData:(NSData *)data; //傳送資料
- (IBAction) test; //連線測試的trigger

@end

