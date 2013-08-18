//
//  PopupProvider.m
//  _MGWU-SideScroller-Template_
//
//  Created by Benjamin Encz on 5/28/13.
//  Copyright (c) 2013 MakeGamesWithUs Inc. Free to use for all purposes.
//
//

#import "PopupProvider.h"
#import "StyleManager.h"
#import "STYLES.h"

@implementation PopupProvider

+ (PopUp *)presentPopUpWithContentString:(NSString *)contentString target:(id)target selector:(SEL)selector buttonTitles:(NSArray*)buttonTitles
{
    return [self presentPopUpWithContentString:contentString contentSize:CGSizeMake(250, 200) backgroundImage:[StyleManager scaleSpriteWhiteBackgroundSolidBlackBorder] target:target selector:selector buttonTitles:buttonTitles];
}

+ (PopUp *)presentPopUpWithContentString:(NSString *)contentString backgroundImage:(CCScale9Sprite *)backgroundImage target:(id)target selector:(SEL)selector buttonTitles:(NSArray*)buttonTitles
{
    return [self presentPopUpWithContentString:contentString contentSize:backgroundImage.contentSize backgroundImage:backgroundImage target:target selector:selector buttonTitles:buttonTitles];
}


+ (PopUp *)presentPopUpWithContentString:(NSString *)contentString contentSize:(CGSize)contentSize backgroundImage:(CCScale9Sprite *)backgroundImage target:(id)target selector:(SEL)selector buttonTitles:(NSArray*)buttonTitles
{
    // create a popup with a content size
    PopUp *popUp = [PopUp node];
    popUp.contentSize = contentSize;
    popUp.backgroundScaleSprite = backgroundImage;
    
    if (contentString)
    {
        // add a centered content label
        CCLabelTTF *popUpContentLabel = [CCLabelTTF labelWithString:contentString
                                                           fontName:DEFAULT_FONT
                                                           fontSize:16];
        popUpContentLabel.color = DEFAULT_FONT_COLOR;
        popUpContentLabel.anchorPoint = ccp(0.5, 0);
        popUpContentLabel.position = ccp(popUp.contentSize.width / 2, popUp.contentSize.height - 60);
        [popUp addChild:popUpContentLabel];
    }
    
    // add the different buttons, automatically determine the size of the button by dividing the available space through the amount of buttons
    // left and right margins for the button(s)
    float buttonMargins = 10.f;
    // calculate the button size using the selected margin
    float buttonSize = (popUp.contentSize.width - 2 * buttonMargins - ([buttonTitles count] - 1) * buttonMargins) / [buttonTitles count];
    // set the initial xPosition to the defined margin
    float xPos = buttonMargins;
    
    // add one button for each button title
    for (unsigned int i = 0; i < [buttonTitles count]; i++)
    {
        // add a login button for the user
        CCControlButton *popUpButton = [[CCControlButton alloc] initWithBackgroundSprite:[StyleManager scaleSpriteWhiteBackgroundSolidBlackBorder]];
        [popUpButton setTitleTTF:DEFAULT_FONT forState:CCControlStateNormal];
        [popUpButton setTitleTTFSize:16 forState:CCControlStateNormal];
        [popUpButton setTitleColor:DEFAULT_FONT_COLOR forState:CCControlStateNormal];
        [popUpButton setTitle:[buttonTitles objectAtIndex:i] forState:CCControlStateNormal];
        popUpButton.anchorPoint = ccp(0, 0);
        popUpButton.preferredSize = CGSizeMake(buttonSize, 30);
        popUpButton.position = ccp(xPos, 20);
        [popUpButton addTarget:target action:selector forControlEvents:CCControlEventTouchUpInside];
        // set the tag to the index of the button
        popUpButton.tag = i;
        
        [popUp addChild:popUpButton];
        
        // increase xPos variable to current x Position
        xPos += buttonSize + buttonMargins;
    }
        
    // present the popup on the running scene
    [popUp presentOnNode:[[CCDirector sharedDirector] runningScene]];
    
    return popUp;

}

@end
