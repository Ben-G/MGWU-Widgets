//
//  PopupDemoLayer.m
//  MGWU_Widgets
//
//  Created by Benjamin Encz on 8/18/13.
//
//

#import "PopupDemoLayer.h"
#import "PopupProvider.h"
#import "PopUp.h"
#import "CCControlButton.h"

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
    }
    
    return self;
}

- (void)showPopup
{
    NSString *popUpMessage = @"Demo Popup!";
    popup = [PopupProvider presentPopUpWithContentString:popUpMessage target:self selector:@selector(popUpButtonClicked:) buttonTitles:@[@"OK"]];
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
