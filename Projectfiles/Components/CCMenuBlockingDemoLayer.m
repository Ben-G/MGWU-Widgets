//
//  CCMenuBlockingDemoLayer.m
//  MGWU_Widgets
//
//  Created by Benjamin Encz on 8/18/13.
//
//

#import "CCMenuBlockingDemoLayer.h"
#import "CCMenuBlocking.h"

@implementation CCMenuBlockingDemoLayer {
    CCMenu *blockingMenu;
}

- (id)init
{
    self = [super init];
    
    if (self)
    {
        CCLabelTTF *blockingMenuLabel = [CCLabelTTF labelWithString:@"Show blocking Menu" fontName:@"Arial" fontSize:14];
        CCMenuItemLabel *blockingMenuItem = [CCMenuItemLabel itemWithLabel:blockingMenuLabel target:self selector:@selector(showBlockingMenu)];
        
        CCLabelTTF *backLabel = [CCLabelTTF labelWithString:@"Back" fontName:@"Arial" fontSize:14];
        CCMenuItemLabel *backItem = [CCMenuItemLabel itemWithLabel:backLabel target:self selector:@selector(back)];
        
        CCMenu *menu = [CCMenu menuWithItems:blockingMenuItem, backItem, nil];
        [menu alignItemsVertically];
        
        [self addChild:menu];
    }
    
    return self;
}

- (void)showBlockingMenu
{
    // create instance of CCMenuBlocking
    CCLabelTTF *hideLabel = [CCLabelTTF labelWithString:@"Hide" fontName:@"Arial" fontSize:14];
    CCMenuItemLabel *hideItem = [CCMenuItemLabel itemWithLabel:hideLabel target:self selector:@selector(hide)];
    
    blockingMenu = [CCMenuBlocking menuWithItems:hideItem, nil];
    blockingMenu.color = ccc3(255, 0, 0);
    blockingMenu.position = ccp(blockingMenu.position.x, self.contentSize.height - 100);
    [self addChild:blockingMenu];
}

- (void)hide
{
    [blockingMenu removeFromParent];
}

- (void)back
{
    [[CCDirector sharedDirector] popScene];
}

@end
