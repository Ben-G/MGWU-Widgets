//
//  LeaderboardDemoLayer.m
//  MGWU_Widgets
//
//  Created by Benjamin Encz on 8/18/13.
//
//

#import "LeaderboardDemoLayer.h"
#import "LeaderboardLayer.h"

@implementation LeaderboardDemoLayer

- (id)init
{
    self = [super init];
    
    if (self)
    {
        CCLabelTTF *presentLeaderboardLabel = [CCLabelTTF labelWithString:@"Show leaderboard" fontName:@"Arial" fontSize:14];
        CCMenuItemLabel *presentLeaderboardItem = [CCMenuItemLabel itemWithLabel:presentLeaderboardLabel target:self selector:@selector(presentLeaderboard)];
        
        CCLabelTTF *backLabel = [CCLabelTTF labelWithString:@"Back" fontName:@"Arial" fontSize:14];
        CCMenuItemLabel *backItem = [CCMenuItemLabel itemWithLabel:backLabel target:self selector:@selector(back)];
        
        CCMenu *menu = [CCMenu menuWithItems:presentLeaderboardItem, backItem, nil];
        [menu alignItemsVertically];
        
        [self addChild:menu];
        
        menu.position = ccp(self.contentSize.width/2, self.contentSize.height/2);
    }
    
    return self;
}

// This method creates and presents the leaderboard
- (void)presentLeaderboard
{
    LeaderboardLayer *leaderboard = [[LeaderboardLayer alloc] initWithTarget:self selector:@selector(buttonPressed)];
    [[CCDirector sharedDirector] pushScene:leaderboard];
}

// This method reacts to the callback of the leaderboard and pops the leaderboard from the scene stack
- (void)buttonPressed
{
    [[CCDirector sharedDirector] popScene];
}

// returns to the main screen
- (void)back
{
    [[CCDirector sharedDirector] popScene];
}


@end
