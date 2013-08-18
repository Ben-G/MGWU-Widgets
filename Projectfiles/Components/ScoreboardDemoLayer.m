//
//  ScoreboardDemoLayer.m
//  MGWU_Widgets
//
//  Created by Benjamin Encz on 8/18/13.
//
//

#import "ScoreboardDemoLayer.h"

@implementation ScoreboardDemoLayer {
    ScoreboardEntryNode *scoreBoard;
}

- (id)init
{
    self = [super init];
    
    if (self)
    {
        scoreBoard = [[ScoreboardEntryNode alloc] initWithScoreImage:@"coin.png" fontFile:@"avenir.fnt"];
        [self addChild:scoreBoard];
        scoreBoard.position = ccp(8, self.contentSize.height - 20);
                
        CCLabelTTF *backLabel = [CCLabelTTF labelWithString:@"Back" fontName:@"Arial" fontSize:14];
        CCMenuItemLabel *backItem = [CCMenuItemLabel itemWithLabel:backLabel target:self selector:@selector(back)];
        
        CCMenu *menu = [CCMenu menuWithItems:backItem, nil];
        [menu alignItemsVertically];
        
        [self performSelector:@selector(changePoints) withObject:nil afterDelay:0.5f];
        
        [self addChild:menu];
    }
    
    return self;
}

- (void)back
{
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    [[CCDirector sharedDirector] popScene];
}

- (void)changePoints
{
    [scoreBoard setScore:(scoreBoard.score + 20) animated:TRUE];
    [self performSelector:@selector(changePoints) withObject:nil afterDelay:0.5f];
}

@end
