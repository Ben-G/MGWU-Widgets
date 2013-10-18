//
//  PopUp.m
//  _MGWU-SideScroller-Template_
//
//  Created by Benjamin Encz on 5/28/13.
//  Copyright (c) 2013 MakeGamesWithUs Inc. Free to use for all purposes.
//
//

#import "PopUp.h"
#import "PopUpProtected.h"
#import "CCControlButton.h"

@interface PopUp()

@end

@implementation PopUp

- (void)presentOnNode:(CCNode *)parentNode position:(CGPoint)pos
{
    // add to the most front layer
    [parentNode addChild:self z:MAX_INT];
    self.anchorPoint = ccp(0.5, 0.5);
    self.position = pos;
}

- (NSString *)textFieldText
{
    return self.textField.text;
}

- (void)dismiss
{
    [self.textField removeFromSuperview];
    [self removeFromParent];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    [textField resignFirstResponder];
    return TRUE;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return TRUE;
}

#pragma mark - Touch Swallowing

- (void)onEnter {
    [super onEnter];
    
    [[CCDirector sharedDirector].touchDispatcher addTargetedDelegate:self priority:(-1)*MAX_INT swallowsTouches:TRUE];
}

- (void)onExit {
    [[CCDirector sharedDirector].touchDispatcher removeDelegate:self];
}

-(BOOL) ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{    
    for (id child in self.children) {
        if ([child respondsToSelector:@selector(ccTouchBegan:withEvent:)]) {
            [child ccTouchBegan:touch withEvent:event];
        }
    }
    
	return TRUE;
}

-(void) ccTouchCancelled:(UITouch *)touch withEvent:(UIEvent *)event
{
    for (id child in self.children) {
        if ([child respondsToSelector:@selector(ccTouchCancelled:withEvent:)]) {
            [child ccTouchCancelled:touch withEvent:event];
        }
    }
}

-(void) ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
    for (id child in self.children) {
        if ([child respondsToSelector:@selector(ccTouchMoved:withEvent:)]) {
            [child ccTouchMoved:touch withEvent:event];
        }
    }
}

-(void) ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event {
    for (id child in self.children) {
        if ([child respondsToSelector:@selector(ccTouchEnded:withEvent:)]) {
            [child ccTouchEnded:touch withEvent:event];
        }
    }
}






#define DEFAULT_FONT_COLOR ccc3(0, 0, 0)
#define WHITE_FONT_COLOR ccc3(255, 255, 255)
#define DEFAULT_FONT @"Avenir-Black"

#define DEFAULT_CONTENT_SIZE CGSizeMake(250, 200)
#define DEFAULT_BUTTON_IMAGE @"9patch_whiteBackground.png"
#define DEFAULT_BACKGROUND_IMAGE @"9patch_whiteBackground.png"


+ (PopUp *)showWithMessage:(NSString *)message buttons:(NSArray*)buttonTitles target:(id)target selector:(SEL)selector
{
    return [PopUp showWithMessage:message buttons:buttonTitles showsInputField:FALSE size:DEFAULT_CONTENT_SIZE atPosition:CGPointZero backgroundImage:DEFAULT_BACKGROUND_IMAGE buttonImage:DEFAULT_BUTTON_IMAGE target:target selector:selector];
}

+ (PopUp *)showWithMessage:(NSString *)message buttons:(NSArray*)buttonTitles target:(id)target selector:(SEL)selector showsInputField:(BOOL)showsInputField
{
    return [PopUp showWithMessage:message buttons:buttonTitles showsInputField:showsInputField size:DEFAULT_CONTENT_SIZE atPosition:CGPointZero backgroundImage:DEFAULT_BACKGROUND_IMAGE buttonImage:DEFAULT_BUTTON_IMAGE target:target selector:selector];
}

+ (PopUp *)showWithMessage:(NSString *)message buttons:(NSArray*)buttonTitles showsInputField:(BOOL)showsInputField size:(CGSize)size target:(id)target selector:(SEL)selector
{
    return [PopUp showWithMessage:message buttons:buttonTitles showsInputField:showsInputField size:size atPosition:CGPointZero backgroundImage:DEFAULT_BACKGROUND_IMAGE buttonImage:DEFAULT_BUTTON_IMAGE target:target selector:selector];
}

+ (PopUp *)showWithMessage:(NSString *)message buttons:(NSArray*)buttonTitles showsInputField:(BOOL)showsInputField size:(CGSize)size atPosition:(CGPoint)position target:(id)target selector:(SEL)selector {
    
    return [PopUp showWithMessage:message buttons:buttonTitles showsInputField:showsInputField size:size atPosition:position backgroundImage:DEFAULT_BACKGROUND_IMAGE buttonImage:DEFAULT_BUTTON_IMAGE target:target selector:selector];
}

+ (PopUp *)showWithMessage:(NSString *)message buttons:(NSArray*)buttonTitles size:(CGSize)size backgroundImage:(NSString *)backgroundImage target:(id)target selector:(SEL)selector {
    CCScale9Sprite *backgroundImageSprite = [[CCScale9Sprite alloc] initWithFile:backgroundImage];
    
    return [PopUp showWithMessage:message buttons:buttonTitles size:backgroundImageSprite.contentSize backgroundImage:backgroundImage target:target selector:selector];
}

+ (PopUp *)showWithMessage:(NSString *)message buttons:(NSArray*)buttonTitles backgroundImage:(NSString *)backgroundImage target:(id)target selector:(SEL)selector {
    CCScale9Sprite *backgroundImageSprite = [[CCScale9Sprite alloc] initWithFile:backgroundImage];
    
    return [PopUp showWithMessage:message buttons:buttonTitles showsInputField:FALSE size:backgroundImageSprite.contentSize atPosition:CGPointZero backgroundImage:backgroundImage buttonImage:DEFAULT_BUTTON_IMAGE target:target selector:selector];
}

+ (PopUp *)showWithMessage:(NSString *)message buttons:(NSArray*)buttonTitles backgroundImage:(NSString *)backgroundImage buttonImage:(NSString *)buttonImage target:(id)target selector:(SEL)selector {
    CCScale9Sprite *backgroundImageSprite = [[CCScale9Sprite alloc] initWithFile:backgroundImage];
    
    return [PopUp showWithMessage:message buttons:buttonTitles size:backgroundImageSprite.contentSize backgroundImage:backgroundImage target:target selector:selector];
}

+ (PopUp *)showWithMessage:(NSString *)message buttons:(NSArray*)buttonTitles showsInputField:(BOOL)showsInputField
 size:(CGSize)size atPosition:(CGPoint)position backgroundImage:(NSString *)backgroundImage buttonImage:(NSString *)buttonImage target:(id)target selector:(SEL)selector {
    // create a popup with a content size
    PopUp *popUp = [PopUp node];
    popUp.contentSize = size;
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
    
    if (message)
    {
        // add a centered content label
        CCLabelTTF *popUpContentLabel = [CCLabelTTF labelWithString:message
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
