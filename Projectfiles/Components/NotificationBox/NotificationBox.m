//
//  NotificationBox.m
//  _MGWU-SideScroller-Template_
//
//  Created by Benjamin Encz on 6/9/13.
//  Copyright (c) 2013 MakeGamesWithUs Inc. Free to use for all purposes.
//

#import "NotificationBox.h"
#import "CCLabelTTF+adjustToFitRequiredSize.h"
#import "CCScale9Sprite.h"

#define NOTIFICATION_BOX_FONT_SIZE 16
#define DEFAULT_FONT @"Avenir-Black"
#define DEFAULT_FONT_COLOR ccc3(255, 255, 255)

#define BOX_HEIGHT 40
#define BOX_WIDTH 200
#define BOX_RATIO 0.7

@implementation NotificationBox

- (id)init
{
    self = [super init];
    
    if (self)
    {
        self.backgroundSprite = [CCScale9Sprite spriteWithFile:@"notification-box.png" capInsets:CGRectZero];
        self.contentSize = CGSizeMake(BOX_WIDTH, BOX_HEIGHT);
        
        contentLabel = [[CCLabelTTF alloc] initWithString:@"" fontName:DEFAULT_FONT fontSize:NOTIFICATION_BOX_FONT_SIZE];
        contentLabel.color = DEFAULT_FONT_COLOR;
        
        [self addChild:contentLabel];
    }
    
    return self;
}

- (void)setText:(NSString *)text
{
    [contentLabel setString:text];
    [contentLabel adjustToFitRequiredSize:self.contentSize];
    
    // center the content label
    contentLabel.anchorPoint = ccp(0.5, 0.5);
    contentLabel.position = ccp(self.contentSize.width / 2, self.contentSize.height / 2);
}

- (void)presentOnParentNode:(CCNode *)parentNode withDuration:(NSTimeInterval)duration
{
    // add to parent node
    [parentNode addChild:self];
    
    // place ourselves above screen, later we will animate on screen
    self.position = ccp(parentNode.contentSize.width / 2, parentNode.contentSize.height + self.contentSize.height / 2);
    self.anchorPoint = ccp(0.5, 0.5);
    
    // animate on screen
    CGPoint targetPosition = ccp(parentNode.contentSize.width / 2, parentNode.contentSize.height - self.contentSize.height / 2);
    CCMoveTo *move = [CCMoveTo actionWithDuration:0.5f position:targetPosition];
    id easeMove = [CCEaseBackInOut actionWithAction:move];
    [self runAction: easeMove];
        
    [self performSelector:@selector(hide) withObject:nil afterDelay:duration];
}

- (void)hide
{
    if (self.parent != nil)
    {
        CCNode *parentNode = self.parent;
        // animate off screen
        CGPoint targetPosition = ccp(parentNode.contentSize.width / 2, parentNode.contentSize.height + self.contentSize.height / 2);
        CCMoveTo *move = [CCMoveTo actionWithDuration:0.5f position:targetPosition];
        id easeMove = [CCEaseBackInOut actionWithAction:move];

        CCCallBlock *removeFromParent = [[CCCallBlock alloc] initWithBlock:^{
            [self removeFromParentAndCleanup:TRUE];
        }];
        
        CCSequence *hideSequence = [CCSequence actions:easeMove, removeFromParent, nil];
        [self runAction:hideSequence];
    }
}

#pragma mark - Helper class methods

+ (void)presentNotificationBoxOnNode:(CCNode *)parentNode withText:(NSString *)text duration:(NSTimeInterval)duration {
    NotificationBox *box = [[NotificationBox alloc] init];
    [box setText:text];
    [box presentOnParentNode:parentNode withDuration:duration];
}

@end
