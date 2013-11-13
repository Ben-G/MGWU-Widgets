//
//  NotificationBoxDemoLayer.m
//  MGWU_Widgets
//
//  Created by Benjamin Encz on 13/11/13.
//
//

#import "NotificationBox.h"
#import "NotificationBoxDemoLayer.h"

@implementation NotificationBoxDemoLayer

- (id)init
{
    self = [super init];
    
    if (self)
    {
        CCLabelTTF *notificationLabel = [CCLabelTTF labelWithString:@"Show Notification" fontName:@"Arial" fontSize:14];
        CCMenuItemLabel *notificationItem = [CCMenuItemLabel itemWithLabel:notificationLabel target:self selector:@selector(showNotification)];
        
        CCLabelTTF *backLabel = [CCLabelTTF labelWithString:@"Back" fontName:@"Arial" fontSize:14];
        CCMenuItemLabel *backItem = [CCMenuItemLabel itemWithLabel:backLabel target:self selector:@selector(back)];
        
        CCMenu *menu = [CCMenu menuWithItems:notificationItem, backItem, nil];
        [menu alignItemsVertically];
        
        [self addChild:menu];
        
        menu.position = ccp(self.contentSize.width/2, self.contentSize.height/2);
    }
    
    return self;
}

- (void)showNotification
{
    NSString *notificationMessage = @"Demo";
    [NotificationBox presentNotificationBoxOnNode:self withText:notificationMessage duration:2.f];
}

- (void)back
{
    [[CCDirector sharedDirector] popScene];
}

@end
