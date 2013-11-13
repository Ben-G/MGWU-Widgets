//
//  NotificationBox.h
//  _MGWU-SideScroller-Template_
//
//  Created by Benjamin Encz on 6/9/13.
//  Copyright (c) 2013 MakeGamesWithUs Inc. Free to use for all purposes.
//

#import "CCSpriteBackgroundNode.h"

@interface NotificationBox : CCSpriteBackgroundNode
{
    CCLabelTTF *contentLabel;
}

/* 
 Sets a text displayed in the notification box
 */
- (void)setText:(NSString *)text;

/*
 Tells the notification box to present itself on the provided parentNode for the specified amount of time.
 The notification will automatically hide, once the specified time is over.
 */
- (void)presentOnParentNode:(CCNode *)parentNode withDuration:(NSTimeInterval)duration;

/* 
 Tells the notification box to hide itself. Usually there is no need to call this method, since it is autmatically called internally.
 */
- (void)hide;

/*
 Helper method to simply display a notification box. Creates a notification, sets the text and displays and hides the notification automatically.
 */
+ (void)presentNotificationBoxOnNode:(CCNode *)parentNode withText:(NSString *)text duration:(NSTimeInterval)duration;

@end
