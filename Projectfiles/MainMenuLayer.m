/*
 * Kobold2D™ --- http://www.kobold2d.org
 *
 * Copyright (c) 2010-2011 Steffen Itterheim. 
 * Released under MIT License in Germany (LICENSE-Kobold2D.txt).
 */

#import "MainMenuLayer.h"
#import "PopupDemoLayer.h"
#import "PopupInputDemoLayer.h"

@interface MainMenuLayer (PrivateMethods)
@end

@implementation MainMenuLayer

-(id) init
{
	if ((self = [super init]))
	{
		glClearColor(0.2f, 0.2f, 0.4f, 1.0f);
        
        CCLabelTTF *popupLabel = [CCLabelTTF labelWithString:@"Popup" fontName:@"Arial" fontSize:14];
        CCMenuItem *popupItem = [CCMenuItemLabel itemWithLabel:popupLabel target:self selector:@selector(presentPopup)];
        
        CCLabelTTF *inputPopupLabel = [CCLabelTTF labelWithString:@"Input Popup" fontName:@"Arial" fontSize:14];
        CCMenuItem *inputPopupItem = [CCMenuItemLabel itemWithLabel:inputPopupLabel target:self selector:@selector(presentInputPopup)];
        
        
        CCMenu *menu = [CCMenu menuWithItems: popupItem, inputPopupItem, nil];
        menu.position = ccp(self.contentSize.width/2, self.contentSize.height/2);
        
        [menu alignItemsVertically];
        
        [self addChild:menu];
	}

	return self;
}


- (void)presentPopup
{
    [[CCDirector sharedDirector] pushScene:(CCScene *)[[PopupDemoLayer alloc] init]];
}

- (void)presentInputPopup
{
    [[CCDirector sharedDirector] pushScene:(CCScene *)[[PopupInputDemoLayer alloc] init]];
}

@end
