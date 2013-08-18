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

@implementation PopupInputDemoLayer {
    PopUp *popup;
    CCLabelTTF *contentLabel;
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
    NSString *popUpMessage = @"Demo Popup!";
    popup = [PopupProvider presentPopUpWithContentString:popUpMessage target:self selector:@selector(popUpButtonClicked:) buttonTitles:@[@"OK", @"Cancel"] showsInputField:TRUE];
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
