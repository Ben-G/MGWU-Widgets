//
//  PopupProvider.m
//  _MGWU-SideScroller-Template_
//
//  Created by Benjamin Encz on 5/28/13.
//  Copyright (c) 2013 MakeGamesWithUs Inc. Free to use for all purposes.
//
//

#import "PopupProvider.h"
#import "CCControlButton.h"
#import "PopUpProtected.h"

#define DEFAULT_FONT_COLOR ccc3(0, 0, 0)
#define WHITE_FONT_COLOR ccc3(255, 255, 255)
#define DEFAULT_FONT @"Avenir-Black"

#define DEFAULT_CONTENT_SIZE CGSizeMake(250, 200)
#define DEFAULT_BUTTON_IMAGE @"9patch_whiteBackground.png"
#define DEFAULT_BACKGROUND_IMAGE @"9patch_whiteBackground.png"


@implementation PopupProvider

+ (PopUp *)presentPopUpWithContentString:(NSString *)contentString target:(id)target selector:(SEL)selector buttonTitles:(NSArray*)buttonTitles
{
    return [PopupProvider presentPopUpWithContentString:contentString contentSize:DEFAULT_CONTENT_SIZE atPosition:CGPointZero backgroundImage:DEFAULT_BACKGROUND_IMAGE buttonImage:DEFAULT_BUTTON_IMAGE target:target selector:selector buttonTitles:buttonTitles showsInputField:FALSE];
}

+ (PopUp *)presentPopUpWithContentString:(NSString *)contentString target:(id)target selector:(SEL)selector buttonTitles:(NSArray*)buttonTitles showsInputField:(BOOL)showsInputField
{
    return [PopupProvider presentPopUpWithContentString:contentString contentSize:DEFAULT_CONTENT_SIZE atPosition:CGPointZero backgroundImage:DEFAULT_BACKGROUND_IMAGE buttonImage:DEFAULT_BUTTON_IMAGE target:target selector:selector buttonTitles:buttonTitles showsInputField:showsInputField];
}

+ (PopUp *)presentPopUpWithContentString:(NSString *)contentString contentSize:(CGSize)contentSize target:(id)target selector:(SEL)selector buttonTitles:(NSArray*)buttonTitles showsInputField:(BOOL)showsInputField {
    
    return [PopupProvider presentPopUpWithContentString:contentString contentSize:contentSize atPosition:CGPointZero backgroundImage:DEFAULT_BACKGROUND_IMAGE buttonImage:DEFAULT_BUTTON_IMAGE target:target selector:selector buttonTitles:buttonTitles showsInputField:showsInputField];
}

+ (PopUp *)presentPopUpWithContentString:(NSString *)contentString contentSize:(CGSize)contentSize atPosition:(CGPoint)position target:(id)target selector:(SEL)selector buttonTitles:(NSArray*)buttonTitles showsInputField:(BOOL)showsInputField {

    return [PopupProvider presentPopUpWithContentString:contentString contentSize:contentSize atPosition:position backgroundImage:DEFAULT_BACKGROUND_IMAGE buttonImage:DEFAULT_BUTTON_IMAGE target:target selector:selector buttonTitles:buttonTitles showsInputField:showsInputField];
}

+ (PopUp *)presentPopUpWithContentString:(NSString *)contentString backgroundImage:(NSString *)backgroundImage target:(id)target selector:(SEL)selector buttonTitles:(NSArray*)buttonTitles
{
    CCScale9Sprite *backgroundImageSprite = [[CCScale9Sprite alloc] initWithFile:backgroundImage];
    
    return [PopupProvider presentPopUpWithContentString:contentString contentSize:backgroundImageSprite.contentSize backgroundImage:backgroundImage target:target selector:selector buttonTitles:buttonTitles];
}

+ (PopUp *)presentPopUpWithContentString:(NSString *)contentString contentSize:(CGSize)contentSize backgroundImage:(NSString *)backgroundImage target:(id)target selector:(SEL)selector buttonTitles:(NSArray*)buttonTitles
{
    return [PopupProvider presentPopUpWithContentString:contentString contentSize:contentSize atPosition:CGPointZero backgroundImage:backgroundImage buttonImage:DEFAULT_BUTTON_IMAGE target:target selector:selector buttonTitles:buttonTitles showsInputField:FALSE];
}

+ (PopUp *)presentPopUpWithContentString:(NSString *)contentString backgroundImage:(NSString *)backgroundImage buttonImage:(NSString *)buttonImage target:(id)target selector:(SEL)selector buttonTitles:(NSArray*)buttonTitles {
    CCScale9Sprite *backgroundImageSprite = [[CCScale9Sprite alloc] initWithFile:backgroundImage];
    
    return [PopupProvider presentPopUpWithContentString:contentString contentSize:backgroundImageSprite.contentSize backgroundImage:backgroundImage target:target selector:selector buttonTitles:buttonTitles];
}

+ (PopUp *)presentPopUpWithContentString:(NSString *)contentString contentSize:(CGSize)contentSize atPosition:(CGPoint)position backgroundImage:(NSString *)backgroundImage buttonImage:(NSString *)buttonImage target:(id)target selector:(SEL)selector buttonTitles:(NSArray*)buttonTitles showsInputField:(BOOL)showsInputField
{
    // create a popup with a content size
    PopUp *popUp = [PopUp node];
    popUp.contentSize = contentSize;
    popUp.backgroundScaleSprite = [[CCScale9Sprite alloc] initWithFile:backgroundImage];
    
    CCNode *parentNode = [[CCDirector sharedDirector] runningScene];
    CGPoint presentationPosition;
    if (!CGPointEqualToPoint(CGPointZero, position))
    {
        presentationPosition = position;
    } else
    {
        presentationPosition = ccp((parentNode.contentSize.width / 2), (parentNode.contentSize.height / 2));
    }
    
    int y = presentationPosition.y + (popUp.contentSize.height / 2);
    
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
        y -= (60 + popUpContentLabel.size.height);
    }
    
    if (showsInputField)
    {
        // add input field
        UIView *view = [[CCDirector sharedDirector] view];
        int textFieldWidth = (int) (0.8 * popUp.contentSize.width);
        int posX = presentationPosition.x - (textFieldWidth / 2);
        CGPoint position = ccp(posX, y);
        position = [[CCDirector sharedDirector] convertToUI:position];
        
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(position.x, position.y, textFieldWidth, 25)];
        textField.backgroundColor = [UIColor whiteColor];
        textField.borderStyle     = UITextBorderStyleRoundedRect;
        textField.returnKeyType   = UIReturnKeyDone;
        textField.delegate        = popUp;
        
        [view addSubview:textField];
        popUp.textField = textField;
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
        CCScale9Sprite *buttonBackgroundSprite = [[CCScale9Sprite alloc] initWithFile:buttonImage];
        
        CCControlButton *popUpButton = [[CCControlButton alloc] initWithBackgroundSprite:buttonBackgroundSprite];
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
    [popUp presentOnNode:[[CCDirector sharedDirector] runningScene] position:presentationPosition];
    
    return popUp;

}

#pragma mark - Helpers

+ (CCScale9Sprite *)scaleSpriteWhiteBackgroundSolidBlackBorder
{
    return  [[CCScale9Sprite alloc] initWithFile:@"9patch_whiteBackground.png" capInsets:CGRectMake(10, 10, 40, 40)];
}

@end
