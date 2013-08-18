//
//  CCNinePatchBackgroundNode.h
//  _MGWU-SideScroller-Template_
//
//  Created by Benjamin Encz on 5/23/13.
//  Copyright (c) 2013 MakeGamesWithUs Inc. Free to use for all purposes.
//

#import "CCNode.h"
#import "CCScale9Sprite.h"

/**
 CCNode subclass, that allows setting a nine-patch background sprite.
 **/
@interface CCNinePatchBackgroundNode : CCNode

/*
 A CCScale9Sprite is used for "9-Patch-Images" (see: http://yannickloriot.com/2013/03/9-patch-technique-in-cocos2d/#sthash.7DqE3Bcu.dpbs).
 A 9-Patch image, is a image that has a strechable region within it. You use the capInsets to define a rectangle for the strechable part of the texture.
 */
@property (nonatomic, strong) CCScale9Sprite *backgroundScaleSprite;

@end
