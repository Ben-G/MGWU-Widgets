//
//  LeaderboardDemoLayer.m
//  MGWU_Widgets
//
//  Created by Benjamin Encz on 8/18/13.
//
//

#import "LeaderboardDemoLayer.h"
#import "LeaderboardLayer.h"

@implementation LeaderboardDemoLayer {
    CCMenuItem *presentLeaderboardItem;
}

- (id)init
{
    self = [super init];
    
    if (self)
    {
        CCLabelTTF *presentLeaderboardLabel = [CCLabelTTF labelWithString:@"Show leaderboard" fontName:@"Arial" fontSize:14];
        presentLeaderboardItem = [CCMenuItemLabel itemWithLabel:presentLeaderboardLabel target:self selector:@selector(presentLeaderboard)];
        CCMenu *menu = [CCMenu menuWithItems:presentLeaderboardItem, nil];
        [self addChild:menu];
    }
    
    return self;
}

- (void)presentLeaderboard
{
    LeaderboardLayer *leaderboard = [[LeaderboardLayer alloc] initWithTarget:self selector:@selector(buttonPressed)];
    [[CCDirector sharedDirector] replaceScene:leaderboard];
}

- (void)buttonPressed {
    [[CCDirector sharedDirector] replaceScene:(CCScene*)self];
    [presentLeaderboardItem setTarget:self selector:@selector(presentLeaderboard)];
}

@end
