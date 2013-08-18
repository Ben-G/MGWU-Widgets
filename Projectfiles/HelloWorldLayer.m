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
        
        CCMenu *menu = [CCMenu menuWithItems:leaderboardItem, scoreBoardItem, nil];
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
@end
