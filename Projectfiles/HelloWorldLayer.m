/*
 * Kobold2D™ --- http://www.kobold2d.org
 *
 * Copyright (c) 2010-2011 Steffen Itterheim. 
 * Released under MIT License in Germany (LICENSE-Kobold2D.txt).
 */

#import "HelloWorldLayer.h"
#import "SimpleAudioEngine.h"
#import "ScoreboardEntryNode.h"
#import "LeaderboardLayer.h"
#import "LeaderboardDemoLayer.h"
#import "ScoreboardDemoLayer.h"
#import "CCMenuBlockingDemoLayer.h"

@interface HelloWorldLayer (PrivateMethods)
@end

@implementation HelloWorldLayer

@synthesize helloWorldString, helloWorldFontName;
@synthesize helloWorldFontSize;

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
        
        CCMenu *menu = [CCMenu menuWithItems:leaderboardItem, scoreBoardItem, menuBlockingItem, nil];
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

@end
