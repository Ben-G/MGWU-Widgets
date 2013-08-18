//
//  ScoreboardDemoLayer.m
//  MGWU_Widgets
//
//  Created by Benjamin Encz on 8/18/13.
//
//

#import "ScoreboardDemoLayer.h"

@implementation ScoreboardDemoLayer

- (id)init {
    self = [super init];
    
    if (self)
    {
        ScoreboardEntryNode *scoreBoard = [[ScoreboardEntryNode alloc] initWithScoreImage:@"coin.png" fontFile:@"avenir.fnt"];
        [self addChild:scoreBoard];
        scoreBoard.position = ccp(8, self.contentSize.height - 20);
    }
    
    return self;
}

@end
