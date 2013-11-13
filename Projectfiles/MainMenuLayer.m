/*
 * Kobold2D™ --- http://www.kobold2d.org
 *
 * Copyright (c) 2010-2011 Steffen Itterheim. 
 * Released under MIT License in Germany (LICENSE-Kobold2D.txt).
 */

#import "MainMenuLayer.h"
#import "SimpleAudioEngine.h"
#import "ScoreboardEntryNode.h"
#import "LeaderboardLayer.h"
#import "LeaderboardDemoLayer.h"
#import "ScoreboardDemoLayer.h"
#import "CCMenuBlockingDemoLayer.h"
#import "PopupDemoLayer.h"
#import "PopupInputDemoLayer.h"
#import "NotificationBoxDemoLayer.h"

@interface MainMenuLayer (PrivateMethods)
@end

@implementation MainMenuLayer

-(id) init
{
	if ((self = [super init]))
	{
		glClearColor(0.2f, 0.2f, 0.4f, 1.0f);
        
        CCLabelTTF *leaderboardLabel = [CCLabelTTF labelWithString:@"Leaderboard" fontName:@"Arial" fontSize:14];
        
        CCMenuItem *leaderboardItem = [CCMenuItemLabel itemWithLabel:leaderboardLabel target:self selector:@selector(presentLeaderboard)];
        
        CCLabelTTF *scoreBoardLabel = [CCLabelTTF labelWithString:@"Scoreboard" fontName:@"Arial" fontSize:14];
        CCMenuItem *scoreBoardItem = [CCMenuItemLabel itemWithLabel:scoreBoardLabel target:self selector:@selector(presentScoreboard)];
        
        CCLabelTTF *menuBlockingLabel = [CCLabelTTF labelWithString:@"CCMenuBlocking" fontName:@"Arial" fontSize:14];
        CCMenuItem *menuBlockingItem = [CCMenuItemLabel itemWithLabel:menuBlockingLabel target:self selector:@selector(presentMenuBlocking)];
        
        CCLabelTTF *popupLabel = [CCLabelTTF labelWithString:@"Popup" fontName:@"Arial" fontSize:14];
        CCMenuItem *popupItem = [CCMenuItemLabel itemWithLabel:popupLabel target:self selector:@selector(presentPopup)];
        
        CCLabelTTF *inputPopupLabel = [CCLabelTTF labelWithString:@"Input Popup" fontName:@"Arial" fontSize:14];
        CCMenuItem *inputPopupItem = [CCMenuItemLabel itemWithLabel:inputPopupLabel target:self selector:@selector(presentInputPopup)];
        
        CCLabelTTF *notificationBoxLabel = [CCLabelTTF labelWithString:@"Notification" fontName:@"Arial" fontSize:14];
        CCMenuItem *notificationBoxItem = [CCMenuItemLabel itemWithLabel:notificationBoxLabel target:self selector:@selector(presentNotificationBox)];
        
        CCMenu *menu = [CCMenu menuWithItems:leaderboardItem, scoreBoardItem, menuBlockingItem, popupItem, inputPopupItem, notificationBoxItem, nil];
        menu.position = ccp(self.contentSize.width/2, self.contentSize.height/2);
        
        [menu alignItemsVertically];
        
        [self addChild:menu];
	}

	return self;
}

- (void)presentLeaderboard
{
    [[CCDirector sharedDirector] pushScene:(CCScene *)[[LeaderboardDemoLayer alloc] init]];
}

- (void)presentScoreboard
{
    [[CCDirector sharedDirector] pushScene:(CCScene *)[[ScoreboardDemoLayer alloc] init]];
}

- (void)presentMenuBlocking
{
    [[CCDirector sharedDirector] pushScene:(CCScene *)[[CCMenuBlockingDemoLayer alloc] init]];
}

- (void)presentPopup
{
    [[CCDirector sharedDirector] pushScene:(CCScene *)[[PopupDemoLayer alloc] init]];
}

- (void)presentInputPopup
{
    [[CCDirector sharedDirector] pushScene:(CCScene *)[[PopupInputDemoLayer alloc] init]];
}

- (void)presentNotificationBox
{
    [[CCDirector sharedDirector] pushScene:(CCScene *)[[NotificationBoxDemoLayer alloc] init]];
}

@end
