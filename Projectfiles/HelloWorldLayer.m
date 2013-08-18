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

@interface HelloWorldLayer (PrivateMethods)
@end

@implementation HelloWorldLayer

@synthesize helloWorldString, helloWorldFontName;
@synthesize helloWorldFontSize;

-(id) init
{
	if ((self = [super init]))
	{
        ScoreboardEntryNode *scoreBoard = [[ScoreboardEntryNode alloc] initWithScoreImage:@"coin.png" fontFile:@"avenir.fnt"];
        [self addChild:scoreBoard];
        scoreBoard.position = ccp(8, self.contentSize.height - 20);
        
        
		glClearColor(0.2f, 0.2f, 0.4f, 1.0f);
	}

	return self;
}

- (void)onEnterTransitionDidFinish {
    [super onEnterTransitionDidFinish];
    
    [[CCDirector sharedDirector] replaceScene:(CCScene *)[[LeaderboardDemoLayer alloc] init]];
}
@end
