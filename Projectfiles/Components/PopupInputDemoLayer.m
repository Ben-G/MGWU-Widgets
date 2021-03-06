//
//  PopupInputDemoLayer.m
//  MGWU_Widgets
//
//  Created by Benjamin Encz on 8/18/13.
//
//

#import "PopupInputDemoLayer.h"
#import "PopUp.h"

#define POPUP_TOP_MARGIN 10
#define POPUP_HEIGHT 150
#define POPUP_WIDTH  250

@implementation PopupInputDemoLayer {
    PopUp *popup;
    CCLabelTTF *contentLabel;
}

- (id)init
{
    self = [super init];
    
    if (self)
    {
        CCLabelTTF *popupLabel = [CCLabelTTF labelWithString:@"Show Input Popup" fontName:@"Arial" fontSize:14];
        CCMenuItemLabel *popupMenuItem = [CCMenuItemLabel itemWithLabel:popupLabel target:self selector:@selector(showPopup)];
        
        CCLabelTTF *fancyPopupLabel = [CCLabelTTF labelWithString:@"Show Fancy Popup" fontName:@"Arial" fontSize:14];
        CCMenuItemLabel *fancyPopupMenuItem = [CCMenuItemLabel itemWithLabel:fancyPopupLabel target:self selector:@selector(showFancyPopup)];
        
        CCLabelTTF *backLabel = [CCLabelTTF labelWithString:@"Back" fontName:@"Arial" fontSize:14];
        CCMenuItemLabel *backItem = [CCMenuItemLabel itemWithLabel:backLabel target:self selector:@selector(back)];
        
        CCMenu *menu = [CCMenu menuWithItems:popupMenuItem, fancyPopupMenuItem, backItem, nil];
        [menu alignItemsVertically];
        
        [self addChild:menu];
        
        /* label for displaying what user entered */
        CCLabelTTF *headerLabel = [CCLabelTTF labelWithString:@"User entered:" fontName:@"Arial" fontSize:14];
        headerLabel.position = ccp(self.contentSize.width / 2, self.contentSize.height - 20);
        [self addChild:headerLabel];
        
        contentLabel = [CCLabelTTF labelWithString:@"Nothing entered yet." fontName:@"Arial" fontSize:14];
        contentLabel.position = ccp(self.contentSize.width / 2, self.contentSize.height - 60);
        [self addChild:contentLabel];
        
        menu.position = ccp(self.contentSize.width/2, self.contentSize.height/2);
    }
    
    return self;
}

- (void)showPopup
{
    NSString *popUpMessage = @"Enter your name: \n Second Line Test";
    popup = [PopUp showWithMessage:popUpMessage okButtonTitle:@"Ok" otherButtonTitles:@[@"Cancel"] target:self selector:@selector(popUpButtonClicked:) showsInputField:TRUE];
    
    /* INFO: There are many overloaded methods that allow to create a popup. In the most simple one, you do not need to provide
       a custom size or a custom position! */
}

- (void)showFancyPopup
{
    NSString *popUpMessage = @"Demo Popup!";
    
    popup = [PopUp showWithMessage:popUpMessage okButtonTitle:@"Send" otherButtonTitles:@[@"Don't send"] backgroundImage:@"usernamepopup_background.png" buttonImage:@"usernamepopup_button.png" target:self  selector:@selector(popUpButtonClicked:) showsInputField:TRUE];
}

- (void)popUpButtonClicked:(int)buttonIndex
{
    if (buttonIndex == OK_BUTTON_INDEX)
    {
        // OK button selected
        contentLabel.string = [popup textFieldText];
    }
    
    [popup dismiss];
}

- (void)back
{
    [[CCDirector sharedDirector] popScene];
}

@end
