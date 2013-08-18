//
//  PopupInputDemoLayer.m
//  MGWU_Widgets
//
//  Created by Benjamin Encz on 8/18/13.
//
//

#import "PopupInputDemoLayer.h"
#import "PopupProvider.h"
#import "PopUp.h"
#import "CCControlButton.h"

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
        
        CCLabelTTF *backLabel = [CCLabelTTF labelWithString:@"Back" fontName:@"Arial" fontSize:14];
        CCMenuItemLabel *backItem = [CCMenuItemLabel itemWithLabel:backLabel target:self selector:@selector(back)];
        
        CCMenu *menu = [CCMenu menuWithItems:popupMenuItem, backItem, nil];
        [menu alignItemsVertically];
        
        [self addChild:menu];
        
        /* label for displaying what user entered */
        CCLabelTTF *headerLabel = [CCLabelTTF labelWithString:@"User entered:" fontName:@"Arial" fontSize:14];
        headerLabel.position = ccp(self.contentSize.width / 2, self.contentSize.height - 20);
        [self addChild:headerLabel];
        
        contentLabel = [CCLabelTTF labelWithString:@"Nothing entered yet." fontName:@"Arial" fontSize:14];
        contentLabel.position = ccp(self.contentSize.width / 2, self.contentSize.height - 60);
        [self addChild:contentLabel];
    }
    
    return self;
}

- (void)showPopup
{
    CGPoint presentationPositon = ccp(self.contentSize.width / 2, self.contentSize.height - POPUP_TOP_MARGIN - 0.5*POPUP_HEIGHT);
    NSString *popUpMessage = @"Enter your name: \n Second Line Test";
    popup = [PopupProvider presentPopUpWithContentString:popUpMessage contentSize:CGSizeMake(POPUP_WIDTH, POPUP_HEIGHT) atPosition:presentationPositon target:self selector:@selector(popUpButtonClicked:) buttonTitles:@[@"OK", @"Cancel"] showsInputField:TRUE];
    
    /* INFO: There are many overloaded methods that allow to create a popup. In the most simple one, you do not need to provide
       a custom size or a custom position! */
}

- (void)popUpButtonClicked:(CCControlButton *)sender
{
    if (sender.tag == 0)
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
