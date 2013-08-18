//
//  CCMenuBlocking.m
//  _MGWU-Endless-Game-Template_
//
//  Created by Benjamin Encz on 7/28/13.
//  Copyright (c) 2013 MakeGamesWithUs Inc. All rights reserved.
//

#import "CCMenuBlocking.h"

@implementation CCMenuBlocking {
    BOOL _touchClaimingCausedByInterceptor;
}

- (void)onEnter {
    [super onEnter];
    
    // remove the previously added delegate of CCMenu
    [[CCDirector sharedDirector].touchDispatcher removeDelegate:self];
    // add a new delegate with higher priority that swallows touches
    [[CCDirector sharedDirector].touchDispatcher addTargetedDelegate:self priority:(-1)*MAX_INT swallowsTouches:TRUE];
}

- (void)onExit {
    [super onExit];
    
    // remove the swallowing touches delegate
    [[CCDirector sharedDirector].touchDispatcher removeDelegate:self];
}

-(BOOL) ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    /* Forward the call to CCMenu. Store if CCMenu claims the touch. Only
     if CCMenu claimed it we will forward touchEnded messages.*/
    BOOL returnValue = [super ccTouchBegan:touch withEvent:event];
    
    // remember if the interceptor claimed the touch
    _touchClaimingCausedByInterceptor = !returnValue;
    
    // always claim touches, this causes the touches to be swallowed
	return TRUE;
}

-(void) ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event {
    // only forward touchEnded message if the touch was claimed by CCMenu and not the CCMenuBlocking touch interceptor
    if (! _touchClaimingCausedByInterceptor)
    {
        [super ccTouchEnded:touch withEvent:event];
    }
}


@end
