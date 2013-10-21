//
//  PopupDemoLayer.m
//  MGWU_Widgets
//
//  Created by Benjamin Encz on 8/18/13.
//
//

#import "PopupDemoLayer.h"
#import "PopUp.h"

@implementation PopupDemoLayer {
    PopUp *popup;
}

- (id)init
{
    self = [super init];
    
    if (self)
    {
        CCLabelTTF *popupLabel = [CCLabelTTF labelWithString:@"Show Popup" fontName:@"Arial" fontSize:14];
        CCMenuItemLabel *popupMenuItem = [CCMenuItemLabel itemWithLabel:popupLabel target:self selector:@selector(showPopup)];
        
        CCLabelTTF *backLabel = [CCLabelTTF labelWithString:@"Back" fontName:@"Arial" fontSize:14];
        CCMenuItemLabel *backItem = [CCMenuItemLabel itemWithLabel:backLabel target:self selector:@selector(back)];
        
        CCMenu *menu = [CCMenu menuWithItems:popupMenuItem, backItem, nil];
        [menu alignItemsVertically];
        
        [self addChild:menu];
        
        menu.position = ccp(self.contentSize.width/2, self.contentSize.height/2);
    }
    
    return self;
}

- (void)showPopup
{
    NSString *popUpMessage = @"Demo Popup !\n multiline \n autosize!";
    popup = [PopUp showWithMessage:popUpMessage buttons:@[@"OK"] target:self selector:@selector(popUpButtonClicked:)];
}

- (void)popUpButtonClicked:(CCControlButton *)sender
{
    if (sender.tag == 0)
    {
        // OK button selected
        [popup dismiss];
    }
}

- (void)back
{
    [[CCDirector sharedDirector] popScene];
}

@end
