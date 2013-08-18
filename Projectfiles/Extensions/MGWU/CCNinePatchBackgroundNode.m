//
//  CCNinePatchBackgroundNode.m
//  _MGWU-SideScroller-Template_
//
//  Created by Benjamin Encz on 5/23/13.
//  Copyright (c) 2013 MakeGamesWithUs Inc. Free to use for all purposes.
//

#import "CCNinePatchBackgroundNode.h"

@implementation CCNinePatchBackgroundNode

- (void)onExit
{
    [super onExit];
    
    [self removeChild:self.backgroundScaleSprite];
}

- (void)onEnterTransitionDidFinish
{
    [super onEnterTransitionDidFinish];
    
    /*
     A CCScale9Sprite is used for "9-Patch-Images" (see: http://yannickloriot.com/2013/03/9-patch-technique-in-cocos2d/#sthash.7DqE3Bcu.dpbs).
     A 9-Patch image, is a image that has a strechable region within it. You use the capInsets to define a rectangle for the strechable part of the texture.
     */
    if (self.backgroundScaleSprite)
    {
        self.backgroundScaleSprite.contentSize = self.contentSize;
        self.backgroundScaleSprite.position = ccp(self.contentSize.width / 2, self.contentSize.height / 2);
        // move to the deepest possible layer
        [self addChild:self.backgroundScaleSprite z:MAX_INT * (-1)];
    }
}

@end
