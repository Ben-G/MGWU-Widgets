//
//  PopUp.m
//  _MGWU-SideScroller-Template_
//
//  Created by Benjamin Encz on 5/28/13.
//  Copyright (c) 2013 MakeGamesWithUs Inc. Free to use for all purposes.
//
//

#import "PopUp.h"
#import "CCBackgroundColorNode.h"

@implementation PopUp

- (void)presentOnNode:(CCNode *)parentNode
{
    // add to the most front layer
    [parentNode addChild:self z:MAX_INT];
    self.anchorPoint = ccp(0.5, 0.5);
    self.position = ccp(parentNode.contentSize.width / 2, parentNode.contentSize.height / 2);
}

- (void)dismiss
{
    [self removeFromParent];
}

#pragma mark - Touch Swallowing

- (void)onEnter {
    [super onEnter];
    
    [[CCDirector sharedDirector].touchDispatcher addTargetedDelegate:self priority:(-1)*MAX_INT swallowsTouches:TRUE];
}

- (void)onExit {
    [[CCDirector sharedDirector].touchDispatcher removeDelegate:self];
}

-(BOOL) ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{    
    for (id child in self.children) {
        if ([child respondsToSelector:@selector(ccTouchBegan:withEvent:)]) {
            [child ccTouchBegan:touch withEvent:event];
        }
    }
    
	return TRUE;
}

-(void) ccTouchCancelled:(UITouch *)touch withEvent:(UIEvent *)event
{
    for (id child in self.children) {
        if ([child respondsToSelector:@selector(ccTouchCancelled:withEvent:)]) {
            [child ccTouchCancelled:touch withEvent:event];
        }
    }
}

-(void) ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
    for (id child in self.children) {
        if ([child respondsToSelector:@selector(ccTouchMoved:withEvent:)]) {
            [child ccTouchMoved:touch withEvent:event];
        }
    }
}

-(void) ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event {
    for (id child in self.children) {
        if ([child respondsToSelector:@selector(ccTouchEnded:withEvent:)]) {
            [child ccTouchEnded:touch withEvent:event];
        }
    }
}

@end
