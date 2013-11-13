//
//  CCSpriteBackgroundNode.m
//  _MGWU-SideScroller-Template_
//
//  Created by Benjamin Encz on 5/24/13.
//  Copyright (c) 2013 MakeGamesWithUs Inc. Free to use for all purposes.
//

#import "CCSpriteBackgroundNode.h"

@implementation CCSpriteBackgroundNode

- (void)onExit
{
    [super onExit];
    
    [self removeChild:self.backgroundSprite];
}

- (void)onEnterTransitionDidFinish
{
    [super onEnterTransitionDidFinish];
    
    if (self.backgroundSprite)
    {
        self.backgroundSprite.contentSize = self.contentSize;
        self.backgroundSprite.position = ccp(self.contentSize.width / 2, self.contentSize.height / 2);
        // move to the deepest possible layer
        [self addChild:self.backgroundSprite z:MAX_INT * (-1)];
    }
}

@end
